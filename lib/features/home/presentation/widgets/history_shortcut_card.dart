import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';
import 'package:splitmybill/core/widgets/app_card.dart';

class HistoryShortcutCard extends StatelessWidget {
  const HistoryShortcutCard({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: <Widget>[
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: context.colors.brandSoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.history_rounded,
              color: context.colors.brand,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.homeHistory,
                  style: AppTypography.titleSmall.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  AppStrings.homeHistorySubtitle,
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: context.colors.textTertiary,
          ),
        ],
      ),
    );
  }
}
