import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/state/cubit_state.dart';
import '../../../guests/domain/entities/guest.dart';
import '../../domain/entities/bill.dart';
import '../../domain/entities/guest_share.dart';

part 'split_state.freezed.dart';

@freezed
sealed class SplitState with _$SplitState {
  const factory SplitState({
    @Default(CubitState.initial) CubitState status,
    final Bill? bill,
    @Default(<GuestShare>[]) List<GuestShare> shares,

    /// Гости, выбранные на главном экране до сканирования чека.
    @Default(<Guest>[]) List<Guest> preparedGuests,

    /// Гость, на которого уходят блюда при быстром нажатии по списку.
    final String? selectedGuestId,
    @Default(false) bool isSaved,
    final String? errorMessage,
  }) = _SplitState;

  const SplitState._();

  factory SplitState.initial() => const SplitState();

  bool get hasBill => bill != null;

  List<Guest> get guests => bill?.guests ?? preparedGuests;

  int get itemsTotalMinor => bill?.itemsTotalMinor ?? 0;

  int get assignedTotalMinor => bill?.assignedTotalMinor ?? 0;

  int get unassignedCount => bill?.unassignedCount ?? 0;

  bool get isFullyAssigned => bill?.isFullyAssigned ?? false;

  double get assignedProgress =>
      itemsTotalMinor == 0 ? 0 : assignedTotalMinor / itemsTotalMinor;

  int shareOf(String guestId) {
    for (final GuestShare share in shares) {
      if (share.guest.id == guestId) return share.totalMinor;
    }
    return 0;
  }
}
