import 'package:intl/intl.dart';

import 'package:splitmybill/core/constants/app_strings.dart';

/// Форматирование денежных сумм, хранящихся в копейках.
abstract final class MoneyFormatter {
  static const int minorUnitsInMajor = 100;

  static final NumberFormat _whole = NumberFormat('#,##0', 'ru_RU');
  static final NumberFormat _fractional = NumberFormat('#,##0.00', 'ru_RU');

  /// «1 250» или «1 250,50» — дробная часть показывается только если она есть.
  static String format(int amountMinor, {bool withSymbol = true}) {
    final double major = amountMinor / minorUnitsInMajor;
    final bool hasCents = amountMinor % minorUnitsInMajor != 0;
    final String number = hasCents
        ? _fractional.format(major)
        : _whole.format(major);
    final String normalized = number.replaceAll('\u00A0', ' ');
    return withSymbol
        ? '$normalized\u00A0${AppStrings.currencySymbol}'
        : normalized;
  }

  /// Значение для поля ввода: без разделителей тысяч и без символа валюты.
  static String toInput(int amountMinor) {
    if (amountMinor % minorUnitsInMajor == 0) {
      return (amountMinor ~/ minorUnitsInMajor).toString();
    }
    return (amountMinor / minorUnitsInMajor).toStringAsFixed(2).replaceAll(
      '.',
      ',',
    );
  }

  static String percent(int value) => '$value\u00A0%';
}
