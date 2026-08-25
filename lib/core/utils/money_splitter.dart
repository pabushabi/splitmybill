/// Деление денежных сумм между участниками без потери копеек.
abstract final class MoneySplitter {
  /// Делит [amountMinor] пропорционально [weights] методом наибольших остатков.
  ///
  /// Сумма результата всегда точно равна [amountMinor]: остаток от целочисленного
  /// деления раздаётся по одной копейке тем, у кого дробная часть больше.
  /// При равных дробных частях выигрывает меньший индекс — деление детерминировано.
  static List<int> split(int amountMinor, List<int> weights) {
    if (weights.isEmpty) return const <int>[];

    final int totalWeight = weights.fold(0, (int sum, int w) => sum + w);
    if (totalWeight <= 0) {
      return List<int>.filled(weights.length, 0);
    }

    final List<int> base = List<int>.filled(weights.length, 0);
    final List<int> remainders = List<int>.filled(weights.length, 0);

    for (int i = 0; i < weights.length; i++) {
      final int numerator = amountMinor * weights[i];
      base[i] = numerator ~/ totalWeight;
      remainders[i] = numerator.remainder(totalWeight).abs();
    }

    int distributed = base.fold(0, (int sum, int v) => sum + v);
    int leftover = amountMinor - distributed;
    if (leftover == 0) return base;

    final int step = leftover > 0 ? 1 : -1;
    final List<int> order = List<int>.generate(weights.length, (int i) => i)
      ..sort((int a, int b) {
        final int byRemainder = remainders[b].compareTo(remainders[a]);
        if (byRemainder != 0) return byRemainder;
        return a.compareTo(b);
      });

    int cursor = 0;
    while (leftover != 0) {
      final int index = order[cursor % order.length];
      // Нулевой вес не должен получать копейки от остатка.
      if (weights[index] > 0) {
        base[index] += step;
        leftover -= step;
      }
      cursor++;
      if (cursor > order.length * 2) break;
    }

    return base;
  }

  /// Делит сумму поровну между [parts] участниками.
  static List<int> splitEvenly(int amountMinor, int parts) {
    if (parts <= 0) return const <int>[];
    return split(amountMinor, List<int>.filled(parts, 1));
  }

  /// Процент от суммы с округлением до копейки.
  static int percentOf(int amountMinor, num percent) {
    return (amountMinor * percent / 100).round();
  }
}
