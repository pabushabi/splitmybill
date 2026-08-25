import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Пробрасывает семантическую палитру в дерево виджетов.
///
/// Читается через `context.colors` (см. `core/extensions/build_context_x.dart`).
@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({required this.colors});

  final AppColors colors;

  @override
  ThemeExtension<AppColorsExtension> copyWith({AppColors? colors}) {
    return AppColorsExtension(colors: colors ?? this.colors);
  }

  /// Палитра переключается целиком, промежуточная интерполяция не нужна.
  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) return this;
    return t < 0.5 ? this : other;
  }
}
