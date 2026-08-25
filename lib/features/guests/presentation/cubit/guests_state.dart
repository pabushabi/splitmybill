import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:splitmybill/core/state/cubit_state.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';

part 'guests_state.freezed.dart';

@freezed
sealed class GuestsState with _$GuestsState {
  const factory GuestsState({
    @Default(CubitState.initial) CubitState status,
    @Default(<Guest>[]) List<Guest> guests,
    final String? errorMessage,
  }) = _GuestsState;

  const GuestsState._();

  factory GuestsState.initial() => const GuestsState();

  bool get isEmpty => guests.isEmpty;
}
