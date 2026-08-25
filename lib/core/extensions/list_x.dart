extension ListX<T> on List<T> {
  T? get firstOrNullOrEmpty => isEmpty ? null : first;

  /// Вставляет [separator] между элементами — для колонок и рядов.
  List<T> separatedBy(T separator) {
    if (length <= 1) return List<T>.of(this);
    final List<T> result = <T>[];
    for (int i = 0; i < length; i++) {
      result.add(this[i]);
      if (i != length - 1) result.add(separator);
    }
    return result;
  }
}

extension IterableX<T> on Iterable<T> {
  int sumBy(int Function(T element) selector) {
    return fold<int>(0, (int sum, T element) => sum + selector(element));
  }
}
