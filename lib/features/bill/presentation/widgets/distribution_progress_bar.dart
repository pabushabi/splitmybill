import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_radius.dart';
import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';
import 'package:splitmybill/core/utils/money_formatter.dart';

class DistributionProgressBar extends StatelessWidget {
  const DistributionProgressBar({
    required this.assignedMinor,
    required this.totalMinor,
    required this.unassignedCount,
    super.key,
  });

  final int assignedMinor;
  final int totalMinor;
  final int unassignedCount;

  @override
  Widget build(BuildContext context) {
    final double progress = totalMinor == 0 ? 0 : assignedMinor / totalMinor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: AppRadius.pillAll,
          child: LinearProgressIndicator(
            value: progress.clamp(0, 1),
            minHeight: 8,
            backgroundColor: context.colors.surfaceVariant,
            color: unassignedCount == 0
                ? context.colors.success
                : context.colors.brand,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '${AppStrings.splitAssignedProgress} '
                '${MoneyFormatter.format(assignedMinor)} '
                '${AppStrings.splitOf} ${MoneyFormatter.format(totalMinor)}',
                style: AppTypography.bodySmall.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ),
            if (unassignedCount > 0)
              Text(
                '${AppStrings.splitItemsLeft}: $unassignedCount',
                style: AppTypography.labelSmall.copyWith(
                  color: context.colors.warning,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
