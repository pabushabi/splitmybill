import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:splitmybill/core/utils/money_splitter.dart';

void main() {
  group('MoneySplitter.splitEvenly', () {
    test('делит сумму без остатка', () {
      expect(MoneySplitter.splitEvenly(30000, 3), <int>[10000, 10000, 10000]);
    });

    test('раздаёт неделимый остаток по одной копейке', () {
      final List<int> parts = MoneySplitter.splitEvenly(10000, 3);
      expect(parts, <int>[3334, 3333, 3333]);
      expect(parts.reduce((int a, int b) => a + b), 10000);
    });

    test('делит копеечную сумму между четырьмя гостями', () {
      final List<int> parts = MoneySplitter.splitEvenly(3, 4);
      expect(parts.reduce((int a, int b) => a + b), 3);
      expect(parts.where((int p) => p == 1).length, 3);
      expect(parts.where((int p) => p == 0).length, 1);
    });

    test('нулевое количество участников даёт пустой результат', () {
      expect(MoneySplitter.splitEvenly(1000, 0), isEmpty);
    });
  });

  group('MoneySplitter.split по весам', () {
    test('распределяет пропорционально весам', () {
      expect(
        MoneySplitter.split(30000, <int>[2, 1]),
        <int>[20000, 10000],
      );
    });

    test('сумма долей всегда равна исходной сумме', () {
      final Random random = Random(42);
      for (int i = 0; i < 500; i++) {
        final int amount = random.nextInt(1000000);
        final int count = 1 + random.nextInt(8);
        final List<int> weights = List<int>.generate(
          count,
          (_) => 1 + random.nextInt(5),
        );

        final List<int> parts = MoneySplitter.split(amount, weights);

        expect(parts.length, count);
        expect(parts.reduce((int a, int b) => a + b), amount);
        expect(parts.every((int p) => p >= 0), isTrue);
      }
    });

    test('гость с нулевым весом не платит', () {
      final List<int> parts = MoneySplitter.split(10001, <int>[1, 0, 1]);
      expect(parts[1], 0);
      expect(parts.reduce((int a, int b) => a + b), 10001);
    });

    test('нулевой общий вес не даёт начислений', () {
      expect(MoneySplitter.split(5000, <int>[0, 0]), <int>[0, 0]);
    });

    test('пустой список весов возвращает пустой результат', () {
      expect(MoneySplitter.split(5000, const <int>[]), isEmpty);
    });
  });

  group('MoneySplitter.percentOf', () {
    test('считает процент с округлением до копейки', () {
      expect(MoneySplitter.percentOf(100000, 10), 10000);
      expect(MoneySplitter.percentOf(33333, 15), 5000);
      expect(MoneySplitter.percentOf(100000, 0), 0);
    });
  });
}
