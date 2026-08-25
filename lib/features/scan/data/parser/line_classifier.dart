import 'package:injectable/injectable.dart';

import 'receipt_line_kind.dart';
import 'receipt_patterns.dart';

/// Определяет, чем является строка чека.
@lazySingleton
class LineClassifier {
  const LineClassifier();

  ReceiptLineKind classify(String line) {
    final String lower = line.toLowerCase();

    if (ReceiptPatterns.containsAny(lower, ReceiptPatterns.subtotalKeywords)) {
      return ReceiptLineKind.subtotal;
    }
    if (ReceiptPatterns.containsAny(lower, ReceiptPatterns.totalKeywords)) {
      return ReceiptLineKind.total;
    }
    if (ReceiptPatterns.containsAny(lower, ReceiptPatterns.serviceKeywords)) {
      return ReceiptLineKind.service;
    }
    if (ReceiptPatterns.containsAny(lower, ReceiptPatterns.discountKeywords)) {
      return ReceiptLineKind.discount;
    }
    if (_isNoise(lower)) {
      return ReceiptLineKind.noise;
    }
    if (_looksLikeItem(line)) {
      return ReceiptLineKind.item;
    }
    return ReceiptLineKind.noise;
  }

  bool _isNoise(String lower) {
    if (ReceiptPatterns.longDigitCode.hasMatch(lower)) return true;
    if (ReceiptPatterns.date.hasMatch(lower)) return true;
    if (ReceiptPatterns.time.hasMatch(lower)) return true;
    if (ReceiptPatterns.phone.hasMatch(lower)) return true;
    return ReceiptPatterns.containsAny(lower, ReceiptPatterns.noiseKeywords);
  }

  /// Позиция — это строка, где есть и название, и цена справа.
  bool _looksLikeItem(String line) {
    if (!ReceiptPatterns.money.hasMatch(line)) return false;

    final String withoutNumbers = line
        .replaceAll(RegExp(r'[\d.,\-]'), ' ')
        .replaceAll(ReceiptPatterns.units, ' ')
        .trim();

    // Название должно содержать хотя бы две буквы подряд.
    return RegExp(r'[A-Za-zА-Яа-яЁё]{2,}').hasMatch(withoutNumbers);
  }
}
