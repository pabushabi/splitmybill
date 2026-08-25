import 'package:flutter/material.dart';

/// Набор цветов для аватаров гостей.
///
/// Цвета подобраны так, чтобы одинаково читаться в светлой и тёмной темах
/// и хорошо различаться между собой на маленьких аватарах.
abstract final class GuestPalette {
  static const List<Color> colors = <Color>[
    Color(0xFFEF4444),
    Color(0xFFF97316),
    Color(0xFFF59E0B),
    Color(0xFF84CC16),
    Color(0xFF22C55E),
    Color(0xFF10B981),
    Color(0xFF14B8A6),
    Color(0xFF06B6D4),
    Color(0xFF3B82F6),
    Color(0xFF6366F1),
    Color(0xFFA855F7),
    Color(0xFFEC4899),
  ];

  static int get length => colors.length;

  /// Цвет по порядковому номеру гостя, по кругу.
  static Color byIndex(int index) => colors[index % colors.length];

  static int valueByIndex(int index) => byIndex(index).toARGB32();

  /// Контрастный цвет текста поверх цвета гостя.
  static Color foregroundOn(Color background) {
    return background.computeLuminance() > 0.6
        ? const Color(0xFF0F172A)
        : Colors.white;
  }
}
