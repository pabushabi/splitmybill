import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splitmybill/core/error/failure.dart';
import 'package:splitmybill/core/utils/result.dart';
import 'package:splitmybill/features/bill/domain/entities/bill.dart';
import 'package:splitmybill/features/bill/domain/entities/bill_item.dart';
import 'package:splitmybill/features/bill/domain/entities/guest_share.dart';
import 'package:splitmybill/features/bill/domain/usecases/calculate_shares.dart';
import 'package:splitmybill/features/bill/domain/usecases/save_bill.dart';
import 'package:splitmybill/features/bill/presentation/cubit/split_cubit.dart';
import 'package:splitmybill/features/bill/presentation/cubit/split_state.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';
import 'package:uuid/uuid.dart';

class _MockSaveBill extends Mock implements SaveBill {}

class _MockUuid extends Mock implements Uuid {}

void main() {
  late SplitCubit cubit;
  late _MockSaveBill saveBill;
  late _MockUuid uuid;
  late SharedPreferences prefs;

  const Guest guestA = Guest(id: 'a', name: 'Аня', colorValue: 0xFFEF4444);
  const Guest guestB = Guest(id: 'b', name: 'Боря', colorValue: 0xFF22C55E);

  const BillItem salad = BillItem(
    id: 'item-1',
    title: 'Салат',
    unitPriceMinor: 45000,
    totalMinor: 45000,
  );
  const BillItem pizza = BillItem(
    id: 'item-2',
    title: 'Пицца',
    unitPriceMinor: 89000,
    totalMinor: 89000,
  );

  setUpAll(() {
    registerFallbackValue(
      Bill(
        id: 'fallback',
        createdAt: DateTime(2026),
        items: const <BillItem>[],
        guests: const <Guest>[],
      ),
    );
  });

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    prefs = await SharedPreferences.getInstance();
    saveBill = _MockSaveBill();
    uuid = _MockUuid();
    when(() => uuid.v4()).thenReturn('bill-1');
    cubit = SplitCubit(const CalculateShares(), saveBill, uuid, prefs);
  });

  tearDown(() async {
    await cubit.close();
  });

  test('prepareGuests запоминает состав до сканирования', () {
    cubit.prepareGuests(const <Guest>[guestA, guestB]);
    expect(cubit.state.preparedGuests, <Guest>[guestA, guestB]);
  });

  blocTest<SplitCubit, SplitState>(
    'startBill создаёт счёт и считает нулевые доли',
    build: () {
      cubit.prepareGuests(const <Guest>[guestA, guestB]);
      return cubit;
    },
    act: (SplitCubit c) => c.startBill(items: const <BillItem>[salad, pizza]),
    verify: (SplitCubit c) {
      expect(c.state.bill?.id, 'bill-1');
      expect(c.state.bill?.items, const <BillItem>[salad, pizza]);
      expect(c.state.isFullyAssigned, isFalse);
      expect(c.state.unassignedCount, 2);
      expect(c.state.shares.length, 2);
      expect(
        c.state.shares.every((GuestShare s) => s.totalMinor == 0),
        isTrue,
      );
    },
  );

  blocTest<SplitCubit, SplitState>(
    'toggleGuestOnItem назначает блюдо выбранному гостю',
    build: () {
      cubit
        ..prepareGuests(const <Guest>[guestA, guestB])
        ..startBill(items: const <BillItem>[salad, pizza]);
      return cubit;
    },
    act: (SplitCubit c) => c.toggleGuestOnItem(salad.id, guestA.id),
    verify: (SplitCubit c) {
      expect(c.state.bill?.assignmentFor(salad.id).hasGuest(guestA.id), isTrue);
      expect(c.state.shareOf(guestA.id), 45000);
      expect(c.state.unassignedCount, 1);
    },
  );

  blocTest<SplitCubit, SplitState>(
    'assignToEveryone делит позицию поровну',
    build: () {
      cubit
        ..prepareGuests(const <Guest>[guestA, guestB])
        ..startBill(items: const <BillItem>[salad]);
      return cubit;
    },
    act: (SplitCubit c) => c.assignToEveryone(salad.id),
    verify: (SplitCubit c) {
      expect(c.state.isFullyAssigned, isTrue);
      expect(c.state.shareOf(guestA.id) + c.state.shareOf(guestB.id), 45000);
    },
  );

  blocTest<SplitCubit, SplitState>(
    'setGuestWeight задаёт неравные доли',
    build: () {
      cubit
        ..prepareGuests(const <Guest>[guestA, guestB])
        ..startBill(items: const <BillItem>[pizza]);
      return cubit;
    },
    act: (SplitCubit c) {
      c
        ..toggleGuestOnItem(pizza.id, guestA.id)
        ..toggleGuestOnItem(pizza.id, guestB.id)
        ..setGuestWeight(pizza.id, guestA.id, 2);
    },
    verify: (SplitCubit c) {
      expect(c.state.shareOf(guestA.id), 59333);
      expect(c.state.shareOf(guestB.id), 29667);
      expect(
        c.state.shareOf(guestA.id) + c.state.shareOf(guestB.id),
        89000,
      );
    },
  );

  blocTest<SplitCubit, SplitState>(
    'setTipPercent сохраняет процент и пересчитывает итог',
    build: () {
      cubit
        ..prepareGuests(const <Guest>[guestA, guestB])
        ..startBill(items: const <BillItem>[salad])
        ..assignToEveryone(salad.id);
      return cubit;
    },
    act: (SplitCubit c) => c.setTipPercent(10),
    verify: (SplitCubit c) {
      expect(c.state.bill?.tipPercent, 10);
      expect(prefs.getInt('tip_percent'), 10);
      expect(
        c.state.shares.fold<int>(0, (int s, GuestShare g) => s + g.totalMinor),
        49500,
      );
    },
  );

  blocTest<SplitCubit, SplitState>(
    'save помечает счёт сохранённым',
    build: () {
      when(
        () => saveBill(any()),
      ).thenAnswer((_) async => const Result<void>.success(null));
      cubit
        ..prepareGuests(const <Guest>[guestA])
        ..startBill(items: const <BillItem>[salad])
        ..toggleGuestOnItem(salad.id, guestA.id);
      return cubit;
    },
    act: (SplitCubit c) => c.save(),
    verify: (SplitCubit c) {
      expect(c.state.isSaved, isTrue);
      verify(() => saveBill(any())).called(1);
    },
  );

  blocTest<SplitCubit, SplitState>(
    'save при ошибке показывает сообщение',
    build: () {
      when(
        () => saveBill(any()),
      ).thenAnswer((_) async => const Result<void>.failure(Failure.storage()));
      cubit
        ..prepareGuests(const <Guest>[guestA])
        ..startBill(items: const <BillItem>[salad]);
      return cubit;
    },
    act: (SplitCubit c) => c.save(),
    verify: (SplitCubit c) {
      expect(c.state.isSaved, isFalse);
      expect(c.state.errorMessage, isNotNull);
    },
  );
}
