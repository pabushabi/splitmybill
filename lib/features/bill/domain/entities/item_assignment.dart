import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_assignment.freezed.dart';

/// Кто и в какой доле оплачивает позицию.
///
/// [shares] хранит вес доли на гостя. Вес 1 у каждого — деление поровну,
/// разные веса — неравные доли (например, гость взял две порции из трёх).
@freezed
sealed class ItemAssignment with _$ItemAssignment {
  const factory ItemAssignment({
    required String itemId,
    @Default(<String, int>{}) Map<String, int> shares,
  }) = _ItemAssignment;

  const ItemAssignment._();

  factory ItemAssignment.empty(String itemId) =>
      ItemAssignment(itemId: itemId);

  factory ItemAssignment.everyone(String itemId, List<String> guestIds) {
    return ItemAssignment(
      itemId: itemId,
      shares: <String, int>{for (final String id in guestIds) id: 1},
    );
  }

  bool get isAssigned => shares.values.any((int weight) => weight > 0);

  int get totalWeight =>
      shares.values.fold(0, (int sum, int weight) => sum + weight);

  List<String> get guestIds => shares.entries
      .where((MapEntry<String, int> e) => e.value > 0)
      .map((MapEntry<String, int> e) => e.key)
      .toList();

  int weightOf(String guestId) => shares[guestId] ?? 0;

  bool hasGuest(String guestId) => weightOf(guestId) > 0;

  /// Переключает участие гостя, сохраняя его вес при повторном включении.
  ItemAssignment toggleGuest(String guestId) {
    final Map<String, int> updated = Map<String, int>.of(shares);
    if (updated.containsKey(guestId)) {
      updated.remove(guestId);
    } else {
      updated[guestId] = 1;
    }
    return copyWith(shares: updated);
  }

  ItemAssignment withWeight(String guestId, int weight) {
    final Map<String, int> updated = Map<String, int>.of(shares);
    if (weight <= 0) {
      updated.remove(guestId);
    } else {
      updated[guestId] = weight;
    }
    return copyWith(shares: updated);
  }

  ItemAssignment withoutGuests(Set<String> removedIds) {
    final Map<String, int> updated = Map<String, int>.of(shares)
      ..removeWhere((String id, _) => removedIds.contains(id));
    return copyWith(shares: updated);
  }

  ItemAssignment cleared() => copyWith(shares: const <String, int>{});
}
