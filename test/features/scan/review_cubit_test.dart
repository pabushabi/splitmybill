import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splitmybill/features/bill/domain/entities/bill_item.dart';
import 'package:splitmybill/features/scan/domain/entities/parsed_item.dart';
import 'package:splitmybill/features/scan/domain/entities/parsed_receipt.dart';
import 'package:splitmybill/features/scan/presentation/cubit/review_cubit.dart';
import 'package:splitmybill/features/scan/presentation/cubit/review_state.dart';
import 'package:uuid/uuid.dart';

void main() {
  late ReviewCubit cubit;

  setUp(() {
    cubit = ReviewCubit(const Uuid());
  });

  tearDown(() async {
    await cubit.close();
  });

  blocTest<ReviewCubit, ReviewState>(
    'start переносит позиции из чека и считает расхождение',
    build: () => cubit,
    act: (ReviewCubit c) {
      c.start(
        const ParsedReceipt(
          items: <ParsedItem>[
            ParsedItem(
              title: 'Салат',
              unitPriceMinor: 45000,
              totalMinor: 45000,
              sourceLine: 'Салат 450',
            ),
            ParsedItem(
              title: 'Пицца',
              unitPriceMinor: 89000,
              totalMinor: 89000,
              sourceLine: 'Пицца 890',
            ),
          ],
          totalMinor: 140000,
          placeName: 'Кафе',
        ),
      );
    },
    verify: (ReviewCubit c) {
      expect(c.state.items.length, 2);
      expect(c.state.itemsTotalMinor, 134000);
      expect(c.state.hasMismatch, isTrue);
      expect(c.state.placeName, 'Кафе');
      expect(c.state.canContinue, isTrue);
    },
  );

  blocTest<ReviewCubit, ReviewState>(
    'upsert и remove правят список позиций',
    build: () => cubit,
    act: (ReviewCubit c) {
      const BillItem item = BillItem(
        id: '1',
        title: 'Чай',
        unitPriceMinor: 18000,
        totalMinor: 18000,
      );
      c
        ..upsertItem(item)
        ..upsertItem(item.copyWith(title: 'Чай зелёный'))
        ..removeItem('1');
    },
    verify: (ReviewCubit c) {
      expect(c.state.items, isEmpty);
      expect(c.state.canContinue, isFalse);
    },
  );
}
