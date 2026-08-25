import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_totals.freezed.dart';

/// Свод по счёту для шапки экрана распределения и итогов.
@freezed
sealed class BillTotals with _$BillTotals {
  const factory BillTotals({
    required int itemsTotalMinor,
    required int assignedMinor,
    required int tipMinor,
    required int unassignedCount,
    required int itemsCount,
  }) = _BillTotals;

  const BillTotals._();

  int get unassignedMinor => itemsTotalMinor - assignedMinor;

  int get grandTotalMinor => itemsTotalMinor + tipMinor;

  bool get isFullyAssigned => itemsCount > 0 && unassignedCount == 0;

  double get assignedProgress =>
      itemsTotalMinor == 0 ? 0 : assignedMinor / itemsTotalMinor;
}
