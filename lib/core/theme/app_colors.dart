import 'package:flutter/material.dart';

/// Семантическая палитра приложения.
///
/// Виджеты не обращаются к этим константам напрямую — они читают цвета
/// через [AppColorsExtension] в `context.colors`, чтобы работали обе темы.
@immutable
class AppColors {
  const AppColors({
    required this.brand,
    required this.brandSoft,
    required this.onBrand,
    required this.accent,
    required this.accentSoft,
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.surfaceInverse,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textOnInverse,
    required this.border,
    required this.divider,
    required this.success,
    required this.successSoft,
    required this.warning,
    required this.warningSoft,
    required this.danger,
    required this.dangerSoft,
    required this.overlay,
    required this.shimmer,
  });

  final Color brand;
  final Color brandSoft;
  final Color onBrand;
  final Color accent;
  final Color accentSoft;

  final Color background;
  final Color surface;
  final Color surfaceVariant;
  final Color surfaceInverse;

  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textOnInverse;

  final Color border;
  final Color divider;

  final Color success;
  final Color successSoft;
  final Color warning;
  final Color warningSoft;
  final Color danger;
  final Color dangerSoft;

  final Color overlay;
  final Color shimmer;

  static const AppColors light = AppColors(
    brand: Color(0xFFE07A5F),
    brandSoft: Color(0xFFEEF0FF),
    onBrand: Color(0xFFFFFFFF),
    accent: Color(0xFFF59E0B),
    accentSoft: Color(0xFFFEF3C7),
    background: Color(0xFFF6F7FB),
    surface: Color(0xFFFFFFFF),
    surfaceVariant: Color(0xFFEFF1F6),
    surfaceInverse: Color(0xFF0F172A),
    textPrimary: Color(0xFF0F172A),
    textSecondary: Color(0xFF64748B),
    textTertiary: Color(0xFF94A3B8),
    textOnInverse: Color(0xFFF8FAFC),
    border: Color(0xFFE2E8F0),
    divider: Color(0xFFEDF1F6),
    success: Color(0xFF16A34A),
    successSoft: Color(0xFFDCFCE7),
    warning: Color(0xFFD97706),
    warningSoft: Color(0xFFFEF3C7),
    danger: Color(0xFFDC2626),
    dangerSoft: Color(0xFFFEE2E2),
    overlay: Color(0x99000000),
    shimmer: Color(0xFFE9EDF3),
  );

  static const AppColors dark = AppColors(
    brand: Color(0xFFE89C87),
    brandSoft: Color(0xFF232A46),
    onBrand: Color(0xFF0B0F19),
    accent: Color(0xFFFBBF24),
    accentSoft: Color(0xFF3A2F14),
    background: Color(0xFF0B0F19),
    surface: Color(0xFF141A26),
    surfaceVariant: Color(0xFF1D2534),
    surfaceInverse: Color(0xFFF8FAFC),
    textPrimary: Color(0xFFF8FAFC),
    textSecondary: Color(0xFF94A3B8),
    textTertiary: Color(0xFF64748B),
    textOnInverse: Color(0xFF0F172A),
    border: Color(0xFF263041),
    divider: Color(0xFF1E2634),
    success: Color(0xFF4ADE80),
    successSoft: Color(0xFF16301F),
    warning: Color(0xFFFBBF24),
    warningSoft: Color(0xFF3A2F14),
    danger: Color(0xFFF87171),
    dangerSoft: Color(0xFF3B1B1B),
    overlay: Color(0xB3000000),
    shimmer: Color(0xFF1D2534),
  );
}
