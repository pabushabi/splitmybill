import 'package:freezed_annotation/freezed_annotation.dart';

import 'parsed_item.dart';

part 'parsed_receipt.freezed.dart';

/// Разобранный чек: позиции и служебные суммы.
@freezed
sealed class ParsedReceipt with _$ParsedReceipt {
  const factory ParsedReceipt({
    @Default(<ParsedItem>[]) List<ParsedItem> items,
    String? placeName,
    int? totalMinor,
    int? serviceChargeMinor,
    int? discountMinor,
    @Default('') String rawText,
  }) = _ParsedReceipt;

  const ParsedReceipt._();

  factory ParsedReceipt.empty() => const ParsedReceipt();

  bool get isEmpty => items.isEmpty;

  int get itemsTotalMinor =>
      items.fold(0, (int sum, ParsedItem item) => sum + item.totalMinor);

  /// Сумма позиций расходится с итогом чека.
  bool get hasTotalMismatch {
    final int? total = totalMinor;
    if (total == null || items.isEmpty) return false;
    return itemsTotalMinor != total;
  }

  int? get mismatchMinor =>
      hasTotalMismatch ? itemsTotalMinor - totalMinor! : null;
}
