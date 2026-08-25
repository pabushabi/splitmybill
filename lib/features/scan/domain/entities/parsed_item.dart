import 'package:freezed_annotation/freezed_annotation.dart';

part 'parsed_item.freezed.dart';

/// Позиция, вытащенная парсером из текста чека.
@freezed
sealed class ParsedItem with _$ParsedItem {
  const factory ParsedItem({
    required String title,
    @Default(1) int quantity,
    required int unitPriceMinor,
    required int totalMinor,

    /// Исходная строка чека — показывается пользователю при правке.
    required String sourceLine,

    /// Название не удалось прочитать, его нужно ввести вручную.
    @Default(false) bool hasSuspiciousTitle,
  }) = _ParsedItem;

  const ParsedItem._();
}
