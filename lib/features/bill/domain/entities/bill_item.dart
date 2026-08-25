import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_item.freezed.dart';

/// Позиция чека. Все суммы хранятся в копейках.
@freezed
sealed class BillItem with _$BillItem {
  const factory BillItem({
    required String id,
    required String title,
    @Default(1) int quantity,
    required int unitPriceMinor,
    required int totalMinor,
  }) = _BillItem;

  const BillItem._();

  factory BillItem.fromUnitPrice({
    required String id,
    required String title,
    required int unitPriceMinor,
    int quantity = 1,
  }) {
    return BillItem(
      id: id,
      title: title,
      quantity: quantity,
      unitPriceMinor: unitPriceMinor,
      totalMinor: unitPriceMinor * quantity,
    );
  }

  bool get hasMultipleUnits => quantity > 1;
}
