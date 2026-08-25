import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:splitmybill/core/state/cubit_state.dart';
import 'package:splitmybill/features/bill/domain/entities/bill.dart';
import 'package:splitmybill/features/bill/domain/entities/guest_share.dart';

part 'history_state.freezed.dart';

@freezed
sealed class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default(CubitState.initial) CubitState status,
    @Default(<Bill>[]) List<Bill> bills,
    Bill? selected,
    @Default(<GuestShare>[]) List<GuestShare> selectedShares,
    String? errorMessage,
  }) = _HistoryState;

  const HistoryState._();

  factory HistoryState.initial() => const HistoryState();

  bool get isEmpty => bills.isEmpty;
}
