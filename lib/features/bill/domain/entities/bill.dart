import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:splitmybill/features/guests/domain/entities/guest.dart';
import 'bill_item.dart';
import 'item_assignment.dart';

part 'bill.freezed.dart';

/// Счёт: распознанные позиции, гости и распределение между ними.
@freezed
sealed class Bill with _$Bill {
  const factory Bill({
    required String id,
    required DateTime createdAt,
    required List<BillItem> items,
    required List<Guest> guests,
    @Default(<String, ItemAssignment>{})
    Map<String, ItemAssignment> assignments,
    String? placeName,

    /// Итог, распознанный в чеке. Нужен только для сверки.
    int? recognizedTotalMinor,
    @Default(0) int tipPercent,
  }) = _Bill;

  const Bill._();

  int get itemsTotalMinor =>
      items.fold(0, (int sum, BillItem item) => sum + item.totalMinor);

  int get assignedTotalMinor => items
      .where((BillItem item) => assignmentFor(item.id).isAssigned)
      .fold(0, (int sum, BillItem item) => sum + item.totalMinor);

  int get unassignedTotalMinor => itemsTotalMinor - assignedTotalMinor;

  List<BillItem> get unassignedItems => items
      .where((BillItem item) => !assignmentFor(item.id).isAssigned)
      .toList();

  int get unassignedCount => unassignedItems.length;

  bool get isFullyAssigned => items.isNotEmpty && unassignedCount == 0;

  int get tipMinor => (itemsTotalMinor * tipPercent / 100).round();

  int get grandTotalMinor => itemsTotalMinor + tipMinor;

  /// Расхождение между суммой позиций и итогом чека, если итог распознан.
  int? get totalMismatchMinor {
    final int? recognized = recognizedTotalMinor;
    if (recognized == null) return null;
    final int diff = itemsTotalMinor - recognized;
    return diff == 0 ? null : diff;
  }

  ItemAssignment assignmentFor(String itemId) =>
      assignments[itemId] ?? ItemAssignment.empty(itemId);

  BillItem? itemById(String itemId) {
    for (final BillItem item in items) {
      if (item.id == itemId) return item;
    }
    return null;
  }

  Guest? guestById(String guestId) {
    for (final Guest guest in guests) {
      if (guest.id == guestId) return guest;
    }
    return null;
  }

  Bill withAssignment(ItemAssignment assignment) {
    final Map<String, ItemAssignment> updated =
        Map<String, ItemAssignment>.of(assignments);
    if (assignment.isAssigned) {
      updated[assignment.itemId] = assignment;
    } else {
      updated.remove(assignment.itemId);
    }
    return copyWith(assignments: updated);
  }

  /// Убирает из распределения гостей, которых больше нет в счёте.
  Bill withGuests(List<Guest> nextGuests) {
    final Set<String> removed = guests
        .map((Guest g) => g.id)
        .toSet()
        .difference(nextGuests.map((Guest g) => g.id).toSet());

    if (removed.isEmpty) return copyWith(guests: nextGuests);

    final Map<String, ItemAssignment> updated = <String, ItemAssignment>{};
    assignments.forEach((String itemId, ItemAssignment assignment) {
      final ItemAssignment cleaned = assignment.withoutGuests(removed);
      if (cleaned.isAssigned) updated[itemId] = cleaned;
    });

    return copyWith(guests: nextGuests, assignments: updated);
  }
}
