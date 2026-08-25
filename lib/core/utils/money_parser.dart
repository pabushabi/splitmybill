import 'money_formatter.dart';

/// Разбор денежных строк в копейки.
///
/// Понимает форматы, встречающиеся в чеках и в ручном вводе:
/// `450`, `450,00`, `450.00`, `450-00`, `1 234,56`, `1.234,56`, `1,234.56`.
abstract final class MoneyParser {
  static final RegExp _allowed = RegExp(r'[^0-9.,\- ]');
  static final RegExp _separator = RegExp(r'[.,\-]');
  static final RegExp _digits = RegExp(r'^\d+$');

  /// Возвращает сумму в копейках или `null`, если строка не похожа на число.
  static int? parse(String? raw) {
    if (raw == null) return null;

    final String trimmed = raw.trim();
    if (trimmed.isEmpty) return null;

    final bool isNegative = trimmed.startsWith('-');
    String cleaned = trimmed
        .replaceAll('\u00A0', ' ')
        .replaceAll(_allowed, '')
        .trim();
    if (isNegative) {
      cleaned = cleaned.replaceFirst('-', '');
    }
    cleaned = cleaned.replaceAll(' ', '');
    if (cleaned.isEmpty) return null;

    final int lastSeparator = cleaned.lastIndexOf(_separator);

    String integerPart;
    String fractionPart;

    if (lastSeparator == -1) {
      integerPart = cleaned;
      fractionPart = '';
    } else {
      final String tail = cleaned.substring(lastSeparator + 1);
      // Три цифры после разделителя — это разряд тысяч, а не копейки.
      final bool tailIsFraction = tail.length == 1 || tail.length == 2;
      if (tailIsFraction && _digits.hasMatch(tail)) {
        integerPart = cleaned.substring(0, lastSeparator);
        fractionPart = tail;
      } else {
        integerPart = cleaned;
        fractionPart = '';
      }
    }

    integerPart = integerPart.replaceAll(_separator, '');
    if (integerPart.isEmpty) integerPart = '0';
    if (!_digits.hasMatch(integerPart)) return null;
    if (fractionPart.isNotEmpty && !_digits.hasMatch(fractionPart)) return null;

    final int? major = int.tryParse(integerPart);
    if (major == null) return null;

    final int minor = switch (fractionPart.length) {
      0 => 0,
      1 => int.parse(fractionPart) * 10,
      _ => int.parse(fractionPart.substring(0, 2)),
    };

    final int amount = major * MoneyFormatter.minorUnitsInMajor + minor;
    return isNegative ? -amount : amount;
  }

  /// Разбор количества: `2`, `1,5`, `0.250`. Возвращает целое число порций.
  static int? parseQuantity(String? raw) {
    if (raw == null) return null;
    final String cleaned = raw.trim().replaceAll(',', '.');
    if (cleaned.isEmpty) return null;
    final double? value = double.tryParse(cleaned);
    if (value == null) return null;
    // Весовые позиции (0,250 кг) считаем одной порцией.
    if (value <= 0) return null;
    if (value < 1) return 1;
    return value.round();
  }
}
