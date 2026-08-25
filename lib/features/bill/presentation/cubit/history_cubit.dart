import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/state/cubit_state.dart';
import '../../domain/entities/bill.dart';
import '../../domain/usecases/calculate_shares.dart';
import '../../domain/usecases/delete_bill.dart';
import '../../domain/usecases/get_bill_history.dart';
import 'history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(
    this._getBillHistory,
    this._deleteBill,
    this._calculateShares,
  ) : super(HistoryState.initial());

  final GetBillHistory _getBillHistory;
  final DeleteBill _deleteBill;
  final CalculateShares _calculateShares;

  Future<void> load() async {
    emit(state.copyWith(status: CubitState.loading, errorMessage: null));

    final result = await _getBillHistory();
    result.fold(
      onSuccess: (List<Bill> bills) => emit(
        state.copyWith(status: CubitState.success, bills: bills),
      ),
      onFailure: (Failure failure) => emit(
        state.copyWith(
          status: CubitState.failure,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  Future<void> open(String billId) async {
    Bill? bill;
    for (final Bill item in state.bills) {
      if (item.id == billId) {
        bill = item;
        break;
      }
    }

    if (bill == null) {
      emit(state.copyWith(status: CubitState.loading, errorMessage: null));
      final result = await _getBillHistory.byId(billId);
      result.fold(
        onSuccess: (Bill? found) {
          if (found == null) {
            emit(
              state.copyWith(
                status: CubitState.failure,
                selected: null,
                errorMessage: Failure.storage().message,
              ),
            );
            return;
          }
          emit(
            state.copyWith(
              status: CubitState.success,
              selected: found,
              selectedShares: _calculateShares(found),
            ),
          );
        },
        onFailure: (Failure failure) => emit(
          state.copyWith(
            status: CubitState.failure,
            errorMessage: failure.message,
          ),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        selected: bill,
        selectedShares: _calculateShares(bill),
        errorMessage: null,
      ),
    );
  }

  Future<void> remove(String billId) async {
    final result = await _deleteBill(billId);
    result.fold(
      onSuccess: (_) {
        final List<Bill> updated = state.bills
            .where((Bill bill) => bill.id != billId)
            .toList();
        emit(
          state.copyWith(
            status: CubitState.success,
            bills: updated,
            selected: state.selected?.id == billId ? null : state.selected,
          ),
        );
      },
      onFailure: (Failure failure) =>
          emit(state.copyWith(errorMessage: failure.message)),
    );
  }
}
