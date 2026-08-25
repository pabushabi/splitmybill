import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_radius.dart';
import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';

/// Каркас модального листа: ручка, заголовок и контент с учётом клавиатуры.
class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    required this.child,
    this.title,
    this.trailing,
    this.padding = const EdgeInsets.fromLTRB(
      AppSpacing.xl,
      0,
      AppSpacing.xl,
      AppSpacing.xl,
    ),
    super.key,
  });

  final Widget child;
  final String? title;
  final Widget? trailing;
  final EdgeInsetsGeometry padding;

  /// Открывает лист и возвращает результат, переданный в `Navigator.pop`.
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool isDismissible = true,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: builder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: AppRadius.sheetTop,
      ),
      padding: EdgeInsets.only(bottom: context.bottomInset),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: AppSpacing.md),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.colors.border,
                borderRadius: AppRadius.pillAll,
              ),
            ),
            if (title != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.xl,
                  AppSpacing.lg,
                  AppSpacing.xl,
                  AppSpacing.sm,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        title!,
                        style: AppTypography.titleLarge.copyWith(
                          color: context.colors.textPrimary,
                        ),
                      ),
                    ),
                    ?trailing,
                  ],
                ),
              )
            else
              const SizedBox(height: AppSpacing.lg),
            Flexible(child: Padding(padding: padding, child: child)),
          ],
        ),
      ),
    );
  }
}
