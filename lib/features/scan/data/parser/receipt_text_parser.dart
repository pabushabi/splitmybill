import 'package:injectable/injectable.dart';

import 'package:splitmybill/core/extensions/string_x.dart';
import 'package:splitmybill/core/utils/money_parser.dart';
import 'package:splitmybill/features/scan/domain/entities/ocr_line.dart';
import 'package:splitmybill/features/scan/domain/entities/ocr_result.dart';
import 'package:splitmybill/features/scan/domain/entities/parsed_item.dart';
import 'package:splitmybill/features/scan/domain/entities/parsed_receipt.dart';
import 'package:splitmybill/features/scan/domain/services/receipt_parser.dart';
import 'line_classifier.dart';
import 'receipt_line_kind.dart';
import 'receipt_line_normalizer.dart';
import 'receipt_patterns.dart';

/// Разбирает текст чека на позиции и служебные суммы.
///
/// Работает только со строками, поэтому не зависит от движка OCR
/// и полностью покрывается юнит-тестами.
@LazySingleton(as: ReceiptParser)
class ReceiptTextParser implements ReceiptParser {
  const ReceiptTextParser(this._normalizer, this._classifier);

  final ReceiptLineNormalizer _normalizer;
  final LineClassifier _classifier;

  /// Позиция дороже этой суммы почти наверняка ошибка распознавания.
  static const int _maxReasonableItemMinor = 100000000;

  /// Больше этого количества одинаковых блюд в заказе не бывает.
  static const int _maxReasonableQuantity = 30;

  @override
  ParsedReceipt parse(OcrResult ocrResult) {
    final List<String> normalized = ocrResult.lines
        .map((OcrLine line) => _normalizer.normalize(line.text))
        .map((String line) => _normalizer.fixNumericTokens(line))
        .where((String line) => line.isNotEmpty)
        .toList();

    final List<String> lines = _normalizer.mergeWrappedLines(normalized);

    final List<ParsedItem> items = <ParsedItem>[];
    final List<int> totals = <int>[];
    int? serviceCharge;
    int? discount;

    for (final String line in lines) {
      switch (_classifier.classify(line)) {
        case ReceiptLineKind.item:
          final ParsedItem? item = _parseItem(line, items.length + 1);
          if (item != null) items.add(item);
        case ReceiptLineKind.total:
          final int? value = _lastMoneyIn(line);
          if (value != null && value > 0) totals.add(value);
        case ReceiptLineKind.service:
          serviceCharge ??= _lastMoneyIn(line);
        case ReceiptLineKind.discount:
          discount ??= _lastMoneyIn(line);
        case ReceiptLineKind.subtotal:
        case ReceiptLineKind.noise:
          break;
      }
    }

    return ParsedReceipt(
      items: items,
      placeName: _guessPlaceName(lines),
      totalMinor: totals.isEmpty
          ? null
          : totals.reduce((int a, int b) => a > b ? a : b),
      serviceChargeMinor: serviceCharge,
      discountMinor: discount,
      rawText: ocrResult.rawText,
    );
  }

  ParsedItem? _parseItem(String line, int position) {
    final String withoutIndex = line
        .replaceFirst(ReceiptPatterns.leadingIndex, '')
        .trim();

    final _QuantityExtract quantityExtract = _extractQuantityWithUnit(
      withoutIndex,
    );

    final _TailSplit split = _splitNameAndAmounts(quantityExtract.line);

    final RegExpMatch? quantityMatch = ReceiptPatterns.quantityByPrice
        .firstMatch(withoutIndex);
    final int? patternQuantity = quantityMatch == null
        ? null
        : MoneyParser.parseQuantity(quantityMatch.group(1));
    final int? patternUnitPrice = quantityMatch == null
        ? null
        : MoneyParser.parse(quantityMatch.group(2));

    final _ItemAmounts? amounts = _resolveAmounts(
      split.tokens,
      patternQuantity,
      patternUnitPrice,
      extractedQuantity: quantityExtract.quantity,
    );

    if (amounts == null) return null;
    if (amounts.totalMinor <= 0) return null;
    if (amounts.totalMinor > _maxReasonableItemMinor) return null;

    final String cleanedName = _cleanTitle(split.name);
    final bool suspicious = cleanedName.length < 3;

    return ParsedItem(
      title: suspicious ? 'Позиция $position' : cleanedName,
      quantity: amounts.quantity,
      unitPriceMinor: amounts.unitPriceMinor,
      totalMinor: amounts.totalMinor,
      sourceLine: line,
      hasSuspiciousTitle: suspicious,
    );
  }

  /// Забирает колонку количества `1,00шт` / `1,00uwt`, чтобы она не попала
  /// ни в название, ни в денежный хвост (иначе `1,00` станет 1 рублём).
  _QuantityExtract _extractQuantityWithUnit(String line) {
    final List<RegExpMatch> matches = ReceiptPatterns.quantityColumnMatches(
      line,
    ).toList();
    if (matches.isEmpty) {
      return _QuantityExtract(line: line, quantity: null);
    }

    final int? quantity = MoneyParser.parseQuantity(matches.last.group(1));
    final String stripped = ReceiptPatterns.stripQuantityColumns(
      line,
    ).collapsedSpaces;
    return _QuantityExtract(line: stripped, quantity: quantity);
  }

  /// Отделяет название от хвоста с числами.
  ///
  /// Хвост — числовые токены и количество с единицей в конце строки.
  /// Объём в названии (`300мл`, `0,5 л`) хвост не начинает, поэтому
  /// «Кола 0,5 л 250» даст название «Кола 0,5 л» и одно число 250.
  _TailSplit _splitNameAndAmounts(String line) {
    final List<String> tokens = line
        .split(RegExp(r'\s+'))
        .where((String t) => t.isNotEmpty)
        .toList();
    if (tokens.isEmpty) return const _TailSplit(name: '', tokens: <String>[]);

    int tailStart = tokens.length;
    while (tailStart > 0 &&
        ReceiptPatterns.isAmountOrQuantityToken(tokens[tailStart - 1])) {
      tailStart--;
    }

    return _TailSplit(
      name: tokens.sublist(0, tailStart).join(' '),
      tokens: tokens.sublist(tailStart),
    );
  }

  /// Решает, что из чисел хвоста — количество, цена за штуку и сумма.
  _ItemAmounts? _resolveAmounts(
    List<String> tokens,
    int? patternQuantity,
    int? patternUnitPrice, {
    int? extractedQuantity,
  }) {
    if (extractedQuantity != null &&
        extractedQuantity > 0 &&
        extractedQuantity <= _maxReasonableQuantity) {
      final _ItemAmounts? fromUnit = _amountsFromExtractedQuantity(
        tokens,
        extractedQuantity,
      );
      if (fromUnit != null) return fromUnit;
    }

    // Раскладка «количество, цена, сумма» в отдельных колонках.
    if (tokens.length >= 3 && patternQuantity == null) {
      final _ItemAmounts? columns = _tryQuantityColumns(tokens);
      if (columns != null) return columns;
    }

    final List<int> values = _parseAmounts(tokens);

    if (patternQuantity != null &&
        patternQuantity > 0 &&
        patternUnitPrice != null &&
        patternUnitPrice > 0) {
      final int expected = patternUnitPrice * patternQuantity;
      // В хвосте либо сумма позиции, либо повтор цены за штуку.
      final int total = values.isEmpty || values.last == patternUnitPrice
          ? expected
          : values.last;
      return _ItemAmounts(
        quantity: patternQuantity,
        unitPriceMinor: total == expected
            ? patternUnitPrice
            : total ~/ patternQuantity,
        totalMinor: total,
      );
    }

    if (values.isEmpty) return null;

    final int total = values.last;

    if (values.length == 1) {
      return _ItemAmounts(
        quantity: 1,
        unitPriceMinor: total,
        totalMinor: total,
      );
    }

    // Две колонки: цена за штуку и сумма, кратная ей.
    final int previous = values[values.length - 2];
    if (previous > 0 && total >= previous && total % previous == 0) {
      final int quantity = total ~/ previous;
      if (quantity <= _maxReasonableQuantity) {
        return _ItemAmounts(
          quantity: quantity,
          unitPriceMinor: previous,
          totalMinor: total,
        );
      }
    }

    return _ItemAmounts(quantity: 1, unitPriceMinor: total, totalMinor: total);
  }

  /// Колонки `цена  кол-во шт  сумма`: последнее число — итог строки.
  _ItemAmounts? _amountsFromExtractedQuantity(
    List<String> tokens,
    int quantity,
  ) {
    final List<int> values = _parseAmounts(tokens);
    if (values.isEmpty) return null;

    final int total = values.last;
    int unitPrice = quantity > 1 ? total ~/ quantity : total;

    if (values.length >= 2) {
      final int candidateUnit = values[values.length - 2];
      if (candidateUnit > 0 && candidateUnit * quantity == total) {
        unitPrice = candidateUnit;
      }
    }

    return _ItemAmounts(
      quantity: quantity,
      unitPriceMinor: unitPrice,
      totalMinor: total,
    );
  }

  /// Проверяет раскладку `2  320,00  640,00`, где сумма равна произведению.
  _ItemAmounts? _tryQuantityColumns(List<String> tokens) {
    if (!ReceiptPatterns.countToken.hasMatch(tokens.first)) return null;

    final int quantity = int.parse(tokens.first);
    if (quantity < 2 || quantity > _maxReasonableQuantity) return null;

    final int? unitPrice = MoneyParser.parse(tokens[1]);
    if (unitPrice == null || unitPrice <= 0) return null;

    final List<int> rest = _parseAmounts(tokens.sublist(2));
    if (rest.isEmpty || rest.last != unitPrice * quantity) return null;

    return _ItemAmounts(
      quantity: quantity,
      unitPriceMinor: unitPrice,
      totalMinor: rest.last,
    );
  }

  /// Разбирает числовые токены, склеивая разряды тысяч: `1` + `850,00`.
  ///
  /// Количество с единицей пропускается: `1,00шт` — это не рубль.
  List<int> _parseAmounts(List<String> tokens) {
    final List<int> values = <int>[];

    for (int i = 0; i < tokens.length; i++) {
      if (_isQuantityToken(tokens[i])) continue;
      if (i + 1 < tokens.length &&
          ReceiptPatterns.isQuantityUnitOnly(tokens[i + 1]) &&
          ReceiptPatterns.numericToken.hasMatch(tokens[i])) {
        continue;
      }

      final bool isThousandsGroup =
          i + 1 < tokens.length &&
          ReceiptPatterns.thousandsHead.hasMatch(tokens[i]) &&
          ReceiptPatterns.thousandsTail.hasMatch(tokens[i + 1]);

      final int? value = MoneyParser.parse(
        isThousandsGroup ? '${tokens[i]}${tokens[i + 1]}' : tokens[i],
      );
      if (value != null) values.add(value);
      if (isThousandsGroup) i++;
    }

    return values;
  }

  bool _isQuantityToken(String token) {
    return ReceiptPatterns.isQuantityToken(token);
  }

  String _cleanTitle(String raw) {
    String title = ReceiptPatterns.stripQuantityColumns(raw)
        .replaceAll(RegExp(r'[xXхХ*]\s*$'), ' ')
        .replaceAll(RegExp(r'^[^A-Za-zА-Яа-яЁё]+'), '')
        .replaceAll(RegExp(r'[\s.,\-:;]+$'), '')
        .collapsedSpaces;

    if (title.isEmpty) return title;

    // Чеки часто печатают капсом — читать такой список тяжело.
    if (title == title.toUpperCase() && title.length > 3) {
      title = title.toLowerCase();
    }
    return title.capitalized;
  }

  /// Название заведения — первая осмысленная строка без цифр.
  String? _guessPlaceName(List<String> lines) {
    for (final String line in lines.take(5)) {
      final String candidate = line.collapsedSpaces;
      if (candidate.length < 3 || candidate.length > 40) continue;
      if (RegExp(r'\d').hasMatch(candidate)) continue;
      if (!ReceiptPatterns.hasLetters.hasMatch(candidate)) continue;
      if (ReceiptPatterns.containsAny(
        candidate.toLowerCase(),
        ReceiptPatterns.noiseKeywords,
      )) {
        continue;
      }
      return candidate.capitalized;
    }
    return null;
  }

  int? _lastMoneyIn(String line) {
    final Iterable<RegExpMatch> matches = ReceiptPatterns.money.allMatches(
      line,
    );
    if (matches.isEmpty) return null;
    return MoneyParser.parse(matches.last.group(0));
  }
}

class _QuantityExtract {
  const _QuantityExtract({required this.line, required this.quantity});

  final String line;
  final int? quantity;
}

class _TailSplit {
  const _TailSplit({required this.name, required this.tokens});

  final String name;

  /// Числовые токены в конце строки в исходном виде.
  final List<String> tokens;
}

class _ItemAmounts {
  const _ItemAmounts({
    required this.quantity,
    required this.unitPriceMinor,
    required this.totalMinor,
  });

  final int quantity;
  final int unitPriceMinor;
  final int totalMinor;
}
