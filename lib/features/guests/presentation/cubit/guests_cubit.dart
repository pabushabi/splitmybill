import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import 'package:splitmybill/core/error/failure.dart';
import 'package:splitmybill/core/state/cubit_state.dart';
import 'package:splitmybill/core/theme/guest_palette.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';
import 'package:splitmybill/features/guests/domain/usecases/delete_guest.dart';
import 'package:splitmybill/features/guests/domain/usecases/get_saved_guests.dart';
import 'package:splitmybill/features/guests/domain/usecases/save_guest.dart';
import 'guests_state.dart';

/// Управляет справочником постоянных гостей.
@lazySingleton
class GuestsCubit extends Cubit<GuestsState> {
  GuestsCubit(
    this._getSavedGuests,
    this._saveGuest,
    this._deleteGuest,
    this._uuid,
  ) : super(GuestsState.initial());

  final GetSavedGuests _getSavedGuests;
  final SaveGuest _saveGuest;
  final DeleteGuest _deleteGuest;
  final Uuid _uuid;

  Future<void> load() async {
    if (state.status.isLoading) return;
    emit(state.copyWith(status: CubitState.loading, errorMessage: null));

    final result = await _getSavedGuests();
    result.fold(
      onSuccess: (List<Guest> guests) => emit(
        state.copyWith(status: CubitState.success, guests: guests),
      ),
      onFailure: (Failure failure) => emit(
        state.copyWith(
          status: CubitState.failure,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  /// Создаёт заготовку нового гостя со свободным цветом палитры.
  Guest draftGuest() {
    final Set<int> used = state.guests.map((Guest g) => g.colorValue).toSet();
    int paletteIndex = 0;
    for (int i = 0; i < GuestPalette.length; i++) {
      if (!used.contains(GuestPalette.valueByIndex(i))) {
        paletteIndex = i;
        break;
      }
    }
    return Guest(
      id: _uuid.v4(),
      name: '',
      colorValue: GuestPalette.valueByIndex(paletteIndex),
    );
  }

  Future<void> save(Guest guest) async {
    final result = await _saveGuest(guest);
    result.fold(
      onSuccess: (Guest saved) {
        final List<Guest> updated = List<Guest>.of(state.guests);
        final int index = updated.indexWhere((Guest g) => g.id == saved.id);
        if (index == -1) {
          updated.add(saved);
        } else {
          updated[index] = saved;
        }
        emit(state.copyWith(status: CubitState.success, guests: updated));
      },
      onFailure: (Failure failure) => emit(
        state.copyWith(
          status: CubitState.failure,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  Future<void> remove(String guestId) async {
    final result = await _deleteGuest(guestId);
    result.fold(
      onSuccess: (_) => emit(
        state.copyWith(
          status: CubitState.success,
          guests: state.guests
              .where((Guest guest) => guest.id != guestId)
              .toList(),
        ),
      ),
      onFailure: (Failure failure) => emit(
        state.copyWith(
          status: CubitState.failure,
          errorMessage: failure.message,
        ),
      ),
    );
  }
}
