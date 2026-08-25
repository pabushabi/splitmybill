import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';
import 'app_button.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    required this.message,
    this.title,
    this.onRetry,
    this.retryLabel,
    this.icon = Icons.error_outline_rounded,
    super.key,
  });

  final String message;
  final String? title;
  final VoidCallback? onRetry;
  final String? retryLabel;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: context.colors.dangerSoft,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: context.colors.danger, size: 30),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              title ?? AppStrings.somethingWentWrong,
              textAlign: TextAlign.center,
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            if (onRetry != null) ...<Widget>[
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                label: retryLabel ?? AppStrings.retry,
                onPressed: onRetry,
                variant: AppButtonVariant.secondary,
                size: AppButtonSize.medium,
                expanded: false,
                icon: Icons.refresh_rounded,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
