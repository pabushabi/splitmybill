import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'package:splitmybill/core/error/failure.dart';
import 'package:splitmybill/core/state/cubit_state.dart';
import 'package:splitmybill/core/storage/app_prefs_keys.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';
import 'package:splitmybill/features/bill/domain/entities/bill.dart';
import 'package:splitmybill/features/bill/domain/entities/bill_item.dart';
import 'package:splitmybill/features/bill/domain/entities/item_assignment.dart';
import 'package:splitmybill/features/bill/domain/usecases/calculate_shares.dart';
import 'package:splitmybill/features/bill/domain/usecases/save_bill.dart';
import 'split_state.dart';

/// Владелец активного счёта: распределение позиций, чаевые и итоги.
///
/// Живёт дольше отдельных экранов, потому что счёт собирается по частям:
/// гости приходят с главного экрана, позиции — с экрана проверки.
@lazySingleton
class SplitCubit extends Cubit<SplitState> {
  SplitCubit(
    this._calculateShares,
    this._saveBill,
    this._uuid,
    this._prefs,
  ) : super(SplitState.initial());

  final CalculateShares _calculateShares;
  final SaveBill _saveBill;
  final Uuid _uuid;
  final SharedPreferences _prefs;

  /// Запоминает гостей до сканирования чека.
  void prepareGuests(List<Guest> guests) {
    emit(state.copyWith(preparedGuests: guests));
  }

  /// Создаёт счёт из проверенных позиций.
  void startBill({
    required List<BillItem> items,
    String? placeName,
    int? recognizedTotalMinor,
  }) {
    final Bill bill = Bill(
      id: _uuid.v4(),
      createdAt: DateTime.now(),
      items: items,
      guests: state.preparedGuests,
      placeName: placeName,
      recognizedTotalMinor: recognizedTotalMinor,
      tipPercent: _prefs.getInt(AppPrefsKeys.tipPercent) ?? 0,
    );

    emit(
      state.copyWith(
        status: CubitState.success,
        bill: bill,
        isSaved: false,
        selectedGuestId: null,
        errorMessage: null,
      ),
    );
    _recalculate(bill);
  }

  void selectGuest(String? guestId) {
    emit(
      state.copyWith(
        selectedGuestId: state.selectedGuestId == guestId ? null : guestId,
      ),
    );
  }

  /// Переключает участие гостя в позиции.
  void toggleGuestOnItem(String itemId, String guestId) {
    final Bill? bill = state.bill;
    if (bill == null) return;

    final ItemAssignment assignment = bill
        .assignmentFor(itemId)
        .toggleGuest(guestId);
    _applyBill(bill.withAssignment(assignment));
  }

  void setGuestWeight(String itemId, String guestId, int weight) {
    final Bill? bill = state.bill;
    if (bill == null) return;

    final ItemAssignment assignment = bill
        .assignmentFor(itemId)
        .withWeight(guestId, weight);
    _applyBill(bill.withAssignment(assignment));
  }

  void assignToEveryone(String itemId) {
    final Bill? bill = state.bill;
    if (bill == null) return;

    _applyBill(
      bill.withAssignment(
        ItemAssignment.everyone(
          itemId,
          bill.guests.map((Guest guest) => guest.id).toList(),
        ),
      ),
    );
  }

  void clearItem(String itemId) {
    final Bill? bill = state.bill;
    if (bill == null) return;
    _applyBill(bill.withAssignment(bill.assignmentFor(itemId).cleared()));
  }

  /// Раздаёт все нераспределённые позиции на всех гостей.
  void assignRemainingToEveryone() {
    final Bill? bill = state.bill;
    if (bill == null) return;

    final List<String> guestIds = bill.guests
        .map((Guest guest) => guest.id)
        .toList();

    Bill updated = bill;
    for (final BillItem item in bill.unassignedItems) {
      updated = updated.withAssignment(
        ItemAssignment.everyone(item.id, guestIds),
      );
    }
    _applyBill(updated);
  }

  void updateGuest(Guest guest) {
    final Bill? bill = state.bill;
    final List<Guest> source = bill?.guests ?? state.preparedGuests;
    final List<Guest> updated = source
        .map((Guest g) => g.id == guest.id ? guest : g)
        .toList();

    if (bill == null) {
      emit(state.copyWith(preparedGuests: updated));
      return;
    }
    _applyBill(bill.copyWith(guests: updated));
  }

  void setTipPercent(int percent) {
    final Bill? bill = state.bill;
    if (bill == null) return;
    final int next = percent.clamp(0, 100);
    _prefs.setInt(AppPrefsKeys.tipPercent, next);
    _applyBill(bill.copyWith(tipPercent: next));
  }

  Future<void> save() async {
    final Bill? bill = state.bill;
    if (bill == null) return;

    final result = await _saveBill(bill);
    result.fold(
      onSuccess: (_) => emit(state.copyWith(isSaved: true)),
      onFailure: (Failure failure) =>
          emit(state.copyWith(errorMessage: failure.message)),
    );
  }

  /// Сбрасывает счёт, оставляя гостей для следующего похода.
  void reset() {
    emit(SplitState.initial().copyWith(preparedGuests: state.preparedGuests));
  }

  void clearError() => emit(state.copyWith(errorMessage: null));

  void _applyBill(Bill bill) {
    emit(state.copyWith(bill: bill, isSaved: false));
    _recalculate(bill);
  }

  void _recalculate(Bill bill) {
    emit(state.copyWith(shares: _calculateShares(bill)));
  }
}
