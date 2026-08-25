import 'package:injectable/injectable.dart';

import 'receipt_patterns.dart';

/// Приводит строки OCR к виду, пригодному для разбора.
@lazySingleton
class ReceiptLineNormalizer {
  const ReceiptLineNormalizer();

  /// Символы, которые OCR путает с цифрами.
  static const Map<String, String> _digitLookalikes = <String, String>{
    'O': '0',
    'o': '0',
    'О': '0',
    'о': '0',
    'D': '0',
    'Q': '0',
    'l': '1',
    'I': '1',
    '|': '1',
    'i': '1',
    'З': '3',
    'з': '3',
    'A': '4',
    'S': '5',
    's': '5',
    'б': '6',
    'G': '6',
    'T': '7',
    'B': '8',
    'В': '8',
    'g': '9',
    'q': '9',
  };

  /// Чистит строку целиком: убирает мусорные символы и валюту,
  /// схлопывает пробелы. Пустая строка означает, что разбирать нечего.
  String normalize(String raw) {
    String line = raw
        .replaceAll('\u00A0', ' ')
        .replaceAll(RegExp(r'[«»"`^~_=]+'), ' ')
        .replaceAll(ReceiptPatterns.currency, ' ')
        .trim();

    line = line.replaceAll(RegExp(r'\.{2,}'), ' ');
    line = line.replaceAll(RegExp(r'\s{2,}'), '  ');
    return line.trim();
  }

  /// Исправляет буквы, попавшие внутрь числа: `45O` → `450`.
  ///
  /// Работает только с токенами, которые уже похожи на число, чтобы не
  /// испортить названия блюд.
  String fixNumericTokens(String line) {
    final List<String> tokens = line.split(' ');
    for (int i = 0; i < tokens.length; i++) {
      final String token = tokens[i];
      if (token.isEmpty) continue;
      if (_looksLikeNumber(token)) {
        tokens[i] = _replaceLookalikes(token);
      }
    }
    return tokens.join(' ');
  }

  /// Токен считается числом, если состоит только из цифр, разделителей
  /// и символов, которые OCR путает с цифрами, и хотя бы одна цифра в нём есть.
  bool _looksLikeNumber(String token) {
    int digits = 0;

    for (final String char in token.split('')) {
      if (RegExp(r'\d').hasMatch(char)) {
        digits++;
      } else if (_digitLookalikes.containsKey(char)) {
        continue;
      } else if (RegExp(r'[.,\-]').hasMatch(char)) {
        continue;
      } else {
        return false;
      }
    }

    return digits > 0;
  }

  String _replaceLookalikes(String token) {
    final StringBuffer buffer = StringBuffer();
    for (final String char in token.split('')) {
      buffer.write(_digitLookalikes[char] ?? char);
    }
    return buffer.toString();
  }

  /// Склеивает перенос: название на одной строке, цена на следующей.
  List<String> mergeWrappedLines(List<String> lines) {
    final List<String> merged = <String>[];

    for (int i = 0; i < lines.length; i++) {
      final String current = lines[i];
      final bool isLast = i == lines.length - 1;

      final bool currentHasMoney = ReceiptPatterns.money.hasMatch(current);
      final bool currentHasWords = ReceiptPatterns.hasLetters.hasMatch(current);

      if (!isLast && currentHasWords && !currentHasMoney) {
        final String next = lines[i + 1];
        final bool nextIsPriceOnly =
            ReceiptPatterns.digitsOnly.hasMatch(next) &&
            ReceiptPatterns.money.hasMatch(next);
        if (nextIsPriceOnly) {
          merged.add('$current  ${next.trim()}');
          i++;
          continue;
        }
      }

      merged.add(current);
    }

    return merged;
  }
}
