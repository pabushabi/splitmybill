import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:splitmybill/features/guests/domain/entities/guest.dart';
import 'package:splitmybill/features/guests/domain/usecases/generate_default_guests.dart';
import 'home_state.dart';

/// Выбор состава компании перед сканированием чека.
@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._generateDefaultGuests) : super(HomeState.initial()) {
    _rebuildParty();
  }

  final GenerateDefaultGuests _generateDefaultGuests;

  void setGuestCount(int count) {
    final int next = count.clamp(HomeState.minGuests, HomeState.maxGuests);
    _rebuildParty(
      guestCount: next,
      selectedGuests: state.selectedGuests.take(next).toList(),
    );
  }

  void toggleSavedGuest(Guest guest) {
    final List<Guest> selected = List<Guest>.of(state.selectedGuests);
    final int index = selected.indexWhere((Guest g) => g.id == guest.id);

    if (index >= 0) {
      selected.removeAt(index);
      _rebuildParty(selectedGuests: selected);
      return;
    }

    if (selected.length >= HomeState.maxGuests) return;
    selected.add(guest);
    _rebuildParty(
      selectedGuests: selected,
      guestCount: selected.length > state.guestCount
          ? selected.length
          : state.guestCount,
    );
  }

  List<Guest> buildParty() => state.party;

  void _rebuildParty({
    int? guestCount,
    List<Guest>? selectedGuests,
  }) {
    final int count = guestCount ?? state.guestCount;
    final List<Guest> selected = selectedGuests ?? state.selectedGuests;
    final List<Guest> keptDefaults = state.party
        .where((Guest guest) => !guest.isPersisted)
        .toList();

    final List<Guest> party = _generateDefaultGuests(
      count: count,
      selected: selected,
    );

    // Сохраняем id безымянных гостей, чтобы аватары не прыгали при пересчёте.
    final List<Guest> stable = <Guest>[];
    int defaultIndex = 0;
    for (final Guest guest in party) {
      if (guest.isPersisted || defaultIndex >= keptDefaults.length) {
        stable.add(guest);
        continue;
      }
      stable.add(
        keptDefaults[defaultIndex].copyWith(
          name: guest.name,
          colorValue: guest.colorValue,
        ),
      );
      defaultIndex++;
    }

    emit(
      state.copyWith(
        guestCount: count,
        selectedGuests: selected,
        party: stable,
      ),
    );
  }
}
