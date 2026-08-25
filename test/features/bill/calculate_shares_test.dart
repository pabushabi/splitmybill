import 'package:flutter_test/flutter_test.dart';
import 'package:splitmybill/features/bill/domain/entities/bill.dart';
import 'package:splitmybill/features/bill/domain/entities/bill_item.dart';
import 'package:splitmybill/features/bill/domain/entities/guest_share.dart';
import 'package:splitmybill/features/bill/domain/entities/item_assignment.dart';
import 'package:splitmybill/features/bill/domain/usecases/calculate_shares.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';

void main() {
  const CalculateShares calculateShares = CalculateShares();

  const Guest guestA = Guest(id: 'a', name: 'А', colorValue: 0xFFEF4444);
  const Guest guestB = Guest(id: 'b', name: 'Б', colorValue: 0xFF22C55E);
  const Guest guestC = Guest(id: 'c', name: 'В', colorValue: 0xFF3B82F6);

  BillItem item(String id, int totalMinor) =>
      BillItem(id: id, title: id, unitPriceMinor: totalMinor, totalMinor: totalMinor);

  Bill buildBill({
    required List<BillItem> items,
    required Map<String, ItemAssignment> assignments,
    int tipPercent = 0,
  }) {
    return Bill(
      id: 'bill',
      createdAt: DateTime(2026, 8, 24),
      items: items,
      guests: const <Guest>[guestA, guestB, guestC],
      assignments: assignments,
      tipPercent: tipPercent,
    );
  }

  int shareOf(List<GuestShare> shares, String guestId) =>
      shares.firstWhere((GuestShare s) => s.guest.id == guestId).totalMinor;

  group('CalculateShares', () {
    test('сценарий из задачи: личные блюда, общее и на двоих', () {
      // А берёт блюдо 1, Б — 2, В — 3, блюдо 4 на всех, блюдо 5 на А и Б.
      final Bill bill = buildBill(
        items: <BillItem>[
          item('1', 10000),
          item('2', 20000),
          item('3', 30000),
          item('4', 60000),
          item('5', 40000),
        ],
        assignments: <String, ItemAssignment>{
          '1': const ItemAssignment(itemId: '1', shares: <String, int>{'a': 1}),
          '2': const ItemAssignment(itemId: '2', shares: <String, int>{'b': 1}),
          '3': const ItemAssignment(itemId: '3', shares: <String, int>{'c': 1}),
          '4': ItemAssignment.everyone('4', <String>['a', 'b', 'c']),
          '5': const ItemAssignment(
            itemId: '5',
            shares: <String, int>{'a': 1, 'b': 1},
          ),
        },
      );

      final List<GuestShare> shares = calculateShares(bill);

      expect(shareOf(shares, 'a'), 10000 + 20000 + 20000);
      expect(shareOf(shares, 'b'), 20000 + 20000 + 20000);
      expect(shareOf(shares, 'c'), 30000 + 20000);
      expect(
        shares.fold<int>(0, (int sum, GuestShare s) => sum + s.totalMinor),
        bill.itemsTotalMinor,
      );
    });

    test('неделимая сумма раскладывается без потери копеек', () {
      final Bill bill = buildBill(
        items: <BillItem>[item('1', 10000)],
        assignments: <String, ItemAssignment>{
          '1': ItemAssignment.everyone('1', <String>['a', 'b', 'c']),
        },
      );

      final List<GuestShare> shares = calculateShares(bill);

      expect(
        shares.fold<int>(0, (int sum, GuestShare s) => sum + s.totalMinor),
        10000,
      );
      expect(shareOf(shares, 'a'), 3334);
      expect(shareOf(shares, 'b'), 3333);
      expect(shareOf(shares, 'c'), 3333);
    });

    test('неравные веса долей', () {
      // А взял две порции из трёх.
      final Bill bill = buildBill(
        items: <BillItem>[item('1', 30000)],
        assignments: <String, ItemAssignment>{
          '1': const ItemAssignment(
            itemId: '1',
            shares: <String, int>{'a': 2, 'b': 1},
          ),
        },
      );

      final List<GuestShare> shares = calculateShares(bill);

      expect(shareOf(shares, 'a'), 20000);
      expect(shareOf(shares, 'b'), 10000);
      expect(shareOf(shares, 'c'), 0);
    });

    test('чаевые распределяются пропорционально суммам', () {
      final Bill bill = buildBill(
        items: <BillItem>[item('1', 30000), item('2', 10000)],
        assignments: <String, ItemAssignment>{
          '1': const ItemAssignment(itemId: '1', shares: <String, int>{'a': 1}),
          '2': const ItemAssignment(itemId: '2', shares: <String, int>{'b': 1}),
        },
        tipPercent: 10,
      );

      final List<GuestShare> shares = calculateShares(bill);

      expect(bill.tipMinor, 4000);
      expect(shareOf(shares, 'a'), 30000 + 3000);
      expect(shareOf(shares, 'b'), 10000 + 1000);
      expect(
        shares.fold<int>(0, (int sum, GuestShare s) => sum + s.totalMinor),
        bill.grandTotalMinor,
      );
    });

    test('нераспределённые позиции не попадают в доли', () {
      final Bill bill = buildBill(
        items: <BillItem>[item('1', 10000), item('2', 5000)],
        assignments: <String, ItemAssignment>{
          '1': const ItemAssignment(itemId: '1', shares: <String, int>{'a': 1}),
        },
      );

      final List<GuestShare> shares = calculateShares(bill);

      expect(bill.isFullyAssigned, isFalse);
      expect(bill.unassignedCount, 1);
      expect(bill.unassignedTotalMinor, 5000);
      expect(
        shares.fold<int>(0, (int sum, GuestShare s) => sum + s.totalMinor),
        10000,
      );
    });

    test('детализация показывает долю и общее число долей', () {
      final Bill bill = buildBill(
        items: <BillItem>[item('1', 30000)],
        assignments: <String, ItemAssignment>{
          '1': ItemAssignment.everyone('1', <String>['a', 'b', 'c']),
        },
      );

      final GuestShare share = calculateShares(
        bill,
      ).firstWhere((GuestShare s) => s.guest.id == 'a');

      expect(share.lines.single.weight, 1);
      expect(share.lines.single.totalWeight, 3);
      expect(share.lines.single.isShared, isTrue);
    });
  });

  group('Bill', () {
    test('удаление гостя очищает его доли', () {
      final Bill bill = buildBill(
        items: <BillItem>[item('1', 10000)],
        assignments: <String, ItemAssignment>{
          '1': const ItemAssignment(
            itemId: '1',
            shares: <String, int>{'a': 1, 'b': 1},
          ),
        },
      );

      final Bill updated = bill.withGuests(const <Guest>[guestA, guestC]);

      expect(updated.assignmentFor('1').guestIds, <String>['a']);
      expect(updated.guests.length, 2);
    });

    test('расхождение с итогом чека вычисляется', () {
      final Bill bill = buildBill(
        items: <BillItem>[item('1', 10000)],
        assignments: const <String, ItemAssignment>{},
      ).copyWith(recognizedTotalMinor: 12000);

      expect(bill.totalMismatchMinor, -2000);
    });
  });
}
