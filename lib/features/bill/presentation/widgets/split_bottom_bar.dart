import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_shadows.dart';
import 'package:splitmybill/core/theme/app_typography.dart';
import 'package:splitmybill/core/widgets/app_button.dart';
import 'distribution_progress_bar.dart';

class SplitBottomBar extends StatelessWidget {
  const SplitBottomBar({
    required this.assignedMinor,
    required this.totalMinor,
    required this.unassignedCount,
    required this.canContinue,
    required this.onContinue,
    required this.onAssignRemaining,
    super.key,
  });

  final int assignedMinor;
  final int totalMinor;
  final int unassignedCount;
  final bool canContinue;
  final VoidCallback onContinue;
  final VoidCallback onAssignRemaining;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.surface,
        boxShadow: context.isDark ? AppShadows.cardDark : AppShadows.bottomBar,
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenPadding,
            AppSpacing.md,
            AppSpacing.screenPadding,
            AppSpacing.lg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DistributionProgressBar(
                assignedMinor: assignedMinor,
                totalMinor: totalMinor,
                unassignedCount: unassignedCount,
              ),
              if (unassignedCount > 0) ...<Widget>[
                const SizedBox(height: AppSpacing.sm),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: onAssignRemaining,
                    child: const Text(AppStrings.splitAssignRemaining),
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.md),
              AppButton(
                label: canContinue
                    ? AppStrings.splitToSummary
                    : AppStrings.splitFinishFirst,
                onPressed: canContinue ? onContinue : null,
              ),
              if (!canContinue)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.xs),
                  child: Text(
                    AppStrings.splitSelectGuestHint,
                    style: AppTypography.bodySmall.copyWith(
                      color: context.colors.textTertiary,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
