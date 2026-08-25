/// Имена Hive-боксов.
///
/// Данные хранятся как JSON-строки: адаптеры пишутся руками в DTO,
/// что избавляет от кодогенерации Hive и конфликта версий analyzer.
abstract final class HiveBoxes {
  static const String guests = 'guests_box';
  static const String bills = 'bills_box';
}
