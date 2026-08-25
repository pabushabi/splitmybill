import 'package:flutter/material.dart';

import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/money_formatter.dart';

/// Предупреждение о расхождении суммы позиций с итогом чека.
class ReceiptTotalMismatchBanner extends StatelessWidget {
  const ReceiptTotalMismatchBanner({
    required this.itemsTotalMinor,
    required this.receiptTotalMinor,
    super.key,
  });

  final int itemsTotalMinor;
  final int receiptTotalMinor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: context.colors.warningSoft,
        borderRadius: AppRadius.mdAll,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.warning_amber_rounded,
            color: context.colors.warning,
            size: 22,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.reviewMismatchTitle,
                  style: AppTypography.titleSmall.copyWith(
                    color: context.colors.warning,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  AppStrings.reviewMismatchMessage,
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: <Widget>[
                    Text(
                      '${AppStrings.reviewTotal}: '
                      '${MoneyFormatter.format(itemsTotalMinor)}',
                      style: AppTypography.labelMedium.copyWith(
                        color: context.colors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Text(
                      '${AppStrings.reviewReceiptTotal}: '
                      '${MoneyFormatter.format(receiptTotalMinor)}',
                      style: AppTypography.labelMedium.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
