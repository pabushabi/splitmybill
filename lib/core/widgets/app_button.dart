import 'package:flutter/material.dart';

import '../constants/app_durations.dart';
import '../constants/app_radius.dart';
import '../constants/app_spacing.dart';
import '../extensions/build_context_x.dart';
import '../theme/app_typography.dart';

enum AppButtonVariant { primary, secondary, ghost, danger }

enum AppButtonSize { large, medium, small }

/// Основная кнопка приложения.
class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.large,
    this.icon,
    this.isLoading = false,
    this.expanded = true,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool expanded;

  bool get _isEnabled => onPressed != null && !isLoading;

  @override
  Widget build(BuildContext context) {
    final _ButtonPalette palette = _paletteFor(context);
    final double height = switch (size) {
      AppButtonSize.large => 56,
      AppButtonSize.medium => 48,
      AppButtonSize.small => 38,
    };
    final TextStyle textStyle = switch (size) {
      AppButtonSize.large => AppTypography.labelLarge,
      AppButtonSize.medium => AppTypography.labelLarge,
      AppButtonSize.small => AppTypography.labelMedium,
    };
    final double horizontalPadding = size == AppButtonSize.small
        ? AppSpacing.md
        : AppSpacing.xl;

    return AnimatedOpacity(
      duration: AppDurations.fast,
      opacity: _isEnabled ? 1 : 0.5,
      child: Material(
        color: palette.background,
        borderRadius: AppRadius.mdAll,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: _isEnabled ? onPressed : null,
          splashColor: palette.foreground.withValues(alpha: 0.08),
          highlightColor: palette.foreground.withValues(alpha: 0.04),
          child: Container(
            height: height,
            width: expanded ? double.infinity : null,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            decoration: BoxDecoration(
              borderRadius: AppRadius.mdAll,
              border: palette.border == null
                  ? null
                  : Border.all(color: palette.border!),
            ),
            child: Row(
              mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (isLoading)
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: palette.foreground,
                    ),
                  )
                else if (icon != null) ...<Widget>[
                  Icon(icon, size: 20, color: palette.foreground),
                  const SizedBox(width: AppSpacing.sm),
                ],
                if (!isLoading)
                  Flexible(
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle.copyWith(color: palette.foreground),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _ButtonPalette _paletteFor(BuildContext context) {
    return switch (variant) {
      AppButtonVariant.primary => _ButtonPalette(
        background: context.colors.brand,
        foreground: context.colors.onBrand,
      ),
      AppButtonVariant.secondary => _ButtonPalette(
        background: context.colors.surface,
        foreground: context.colors.textPrimary,
        border: context.colors.border,
      ),
      AppButtonVariant.ghost => _ButtonPalette(
        background: Colors.transparent,
        foreground: context.colors.brand,
      ),
      AppButtonVariant.danger => _ButtonPalette(
        background: context.colors.dangerSoft,
        foreground: context.colors.danger,
      ),
    };
  }
}

class _ButtonPalette {
  const _ButtonPalette({
    required this.background,
    required this.foreground,
    this.border,
  });

  final Color background;
  final Color foreground;
  final Color? border;
}
