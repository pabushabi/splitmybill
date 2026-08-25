import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/state/cubit_state.dart';
import '../../domain/entities/bill.dart';
import '../../domain/entities/guest_share.dart';

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
