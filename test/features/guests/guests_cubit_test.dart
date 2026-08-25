import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:splitmybill/core/error/failure.dart';
import 'package:splitmybill/core/utils/result.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';
import 'package:splitmybill/features/guests/domain/usecases/delete_guest.dart';
import 'package:splitmybill/features/guests/domain/usecases/get_saved_guests.dart';
import 'package:splitmybill/features/guests/domain/usecases/save_guest.dart';
import 'package:splitmybill/features/guests/presentation/cubit/guests_cubit.dart';
import 'package:splitmybill/features/guests/presentation/cubit/guests_state.dart';
import 'package:uuid/uuid.dart';

class _MockGetSavedGuests extends Mock implements GetSavedGuests {}

class _MockSaveGuest extends Mock implements SaveGuest {}

class _MockDeleteGuest extends Mock implements DeleteGuest {}

class _MockUuid extends Mock implements Uuid {}

void main() {
  late GuestsCubit cubit;
  late _MockGetSavedGuests getSaved;
  late _MockSaveGuest saveGuest;
  late _MockDeleteGuest deleteGuest;

  const Guest anna = Guest(
    id: '1',
    name: 'Аня',
    colorValue: 0xFFEF4444,
    isPersisted: true,
  );

  setUpAll(() {
    registerFallbackValue(anna);
  });

  setUp(() {
    getSaved = _MockGetSavedGuests();
    saveGuest = _MockSaveGuest();
    deleteGuest = _MockDeleteGuest();
    cubit = GuestsCubit(getSaved, saveGuest, deleteGuest, _MockUuid());
  });

  tearDown(() async {
    await cubit.close();
  });

  blocTest<GuestsCubit, GuestsState>(
    'load кладёт сохранённых гостей в состояние',
    build: () {
      when(
        () => getSaved(),
      ).thenAnswer((_) async => const Result<List<Guest>>.success(<Guest>[anna]));
      return cubit;
    },
    act: (GuestsCubit c) => c.load(),
    expect: () => <dynamic>[
      isA<GuestsState>().having(
        (GuestsState s) => s.status.isLoading,
        'loading',
        isTrue,
      ),
      isA<GuestsState>()
          .having((GuestsState s) => s.guests, 'guests', <Guest>[anna])
          .having((GuestsState s) => s.status.isSuccess, 'success', isTrue),
    ],
  );

  blocTest<GuestsCubit, GuestsState>(
    'save добавляет нового гостя',
    build: () {
      when(
        () => saveGuest(any()),
      ).thenAnswer((_) async => const Result<Guest>.success(anna));
      return cubit;
    },
    act: (GuestsCubit c) => c.save(anna),
    verify: (GuestsCubit c) {
      expect(c.state.guests, <Guest>[anna]);
    },
  );

  blocTest<GuestsCubit, GuestsState>(
    'remove убирает гостя из списка',
    build: () {
      when(
        () => deleteGuest(any()),
      ).thenAnswer((_) async => const Result<void>.success(null));
      return cubit;
    },
    seed: () => const GuestsState(guests: <Guest>[anna]),
    act: (GuestsCubit c) => c.remove(anna.id),
    verify: (GuestsCubit c) {
      expect(c.state.guests, isEmpty);
    },
  );

  blocTest<GuestsCubit, GuestsState>(
    'load при ошибке хранилища переходит в failure',
    build: () {
      when(
        () => getSaved(),
      ).thenAnswer((_) async => const Result<List<Guest>>.failure(Failure.storage()));
      return cubit;
    },
    act: (GuestsCubit c) => c.load(),
    verify: (GuestsCubit c) {
      expect(c.state.status.isFailure, isTrue);
      expect(c.state.errorMessage, isNotNull);
    },
  );
}
