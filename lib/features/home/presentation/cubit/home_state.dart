import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:splitmybill/features/guests/domain/entities/guest.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    @Default(2) int guestCount,
    @Default(<Guest>[]) List<Guest> selectedGuests,
    @Default(<Guest>[]) List<Guest> party,
  }) = _HomeState;

  const HomeState._();

  factory HomeState.initial() => const HomeState();

  static const int minGuests = 2;
  static const int maxGuests = 12;

  bool isSelected(String guestId) =>
      selectedGuests.any((Guest guest) => guest.id == guestId);
}
