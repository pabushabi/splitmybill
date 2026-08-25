import 'package:intl/intl.dart';

/// Русские даты для истории и шаринга.
abstract final class DateFormatter {
  static final DateFormat _full = DateFormat('d MMMM yyyy, HH:mm', 'ru_RU');
  static final DateFormat _short = DateFormat('d MMM yyyy', 'ru_RU');
  static final DateFormat _dayTime = DateFormat('d MMMM, HH:mm', 'ru_RU');

  static String full(DateTime date) => _full.format(date);

  static String short(DateTime date) => _short.format(date);

  static String dayTime(DateTime date) => _dayTime.format(date);
}
