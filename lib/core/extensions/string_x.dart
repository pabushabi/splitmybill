import 'package:characters/characters.dart';

extension StringX on String {
  /// Первая буква заглавная, остальные не трогаем — названия блюд из чека
  /// часто набраны капсом или вразнобой.
  String get capitalized {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Инициалы для аватара гостя: одна буква имени.
  String get initials {
    final String trimmed = trim();
    if (trimmed.isEmpty) return '?';
    return trimmed.characters.first.toUpperCase();
  }

  String get collapsedSpaces => trim().replaceAll(RegExp(r'\s+'), ' ');

  bool get isBlank => trim().isEmpty;

  bool get isNotBlank => !isBlank;
}

extension NullableStringX on String? {
  bool get isNullOrBlank => this == null || this!.trim().isEmpty;
}
