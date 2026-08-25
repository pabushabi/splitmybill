import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:splitmybill/core/constants/app_radius.dart';
import 'package:splitmybill/core/constants/app_spacing.dart';
import 'app_colors.dart';
import 'app_theme_extension.dart';
import 'app_typography.dart';

/// Сборка [ThemeData] из семантической палитры.
abstract final class AppTheme {
  static ThemeData get light => _build(AppColors.light, Brightness.light);

  static ThemeData get dark => _build(AppColors.dark, Brightness.dark);

  static ThemeData _build(AppColors c, Brightness brightness) {
    final ColorScheme scheme = ColorScheme(
      brightness: brightness,
      primary: c.brand,
      onPrimary: c.onBrand,
      primaryContainer: c.brandSoft,
      onPrimaryContainer: c.brand,
      secondary: c.accent,
      onSecondary: c.onBrand,
      secondaryContainer: c.accentSoft,
      onSecondaryContainer: c.warning,
      error: c.danger,
      onError: Colors.white,
      errorContainer: c.dangerSoft,
      onErrorContainer: c.danger,
      surface: c.surface,
      onSurface: c.textPrimary,
      surfaceContainerHighest: c.surfaceVariant,
      onSurfaceVariant: c.textSecondary,
      outline: c.border,
      outlineVariant: c.divider,
      shadow: Colors.black,
      inverseSurface: c.surfaceInverse,
      onInverseSurface: c.textOnInverse,
    );

    final TextTheme textTheme = AppTypography.textTheme(
      c.textPrimary,
      c.textSecondary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.background,
      canvasColor: c.background,
      splashFactory: InkSparkle.splashFactory,
      textTheme: textTheme,
      extensions: <ThemeExtension<dynamic>>[AppColorsExtension(colors: c)],
      appBarTheme: AppBarTheme(
        backgroundColor: c.background,
        foregroundColor: c.textPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.titleLarge.copyWith(
          color: c.textPrimary,
        ),
        systemOverlayStyle: brightness == Brightness.light
            ? SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
              )
            : SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Colors.transparent,
              ),
      ),
      dividerTheme: DividerThemeData(
        color: c.divider,
        thickness: 1,
        space: 1,
      ),
      cardTheme: CardThemeData(
        color: c.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.lgAll),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: c.surface,
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: c.surface,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.sheetTop),
        showDragHandle: false,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: c.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.lgAll),
        titleTextStyle: AppTypography.titleLarge.copyWith(color: c.textPrimary),
        contentTextStyle: AppTypography.bodyMedium.copyWith(
          color: c.textSecondary,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: c.surfaceInverse,
        contentTextStyle: AppTypography.bodyMedium.copyWith(
          color: c.textOnInverse,
        ),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
        insetPadding: const EdgeInsets.all(AppSpacing.lg),
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.surfaceVariant,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(color: c.textTertiary),
        labelStyle: AppTypography.labelMedium.copyWith(color: c.textSecondary),
        border: const OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: c.brand, width: 1.6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: c.danger, width: 1.4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: c.danger, width: 1.6),
        ),
      ),
      iconTheme: IconThemeData(color: c.textSecondary, size: 22),
      listTileTheme: ListTileThemeData(
        iconColor: c.textSecondary,
        textColor: c.textPrimary,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: c.brand,
        linearTrackColor: c.surfaceVariant,
        circularTrackColor: c.surfaceVariant,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: c.brand,
        inactiveTrackColor: c.surfaceVariant,
        thumbColor: c.brand,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? c.onBrand
              : c.surface,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? c.brand
              : c.surfaceVariant,
        ),
        trackOutlineColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? Colors.transparent
              : c.border,
        ),
      ),
    );
  }
}
