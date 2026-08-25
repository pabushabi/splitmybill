import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_radius.dart';
import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';

class UnassignedWarning extends StatelessWidget {
  const UnassignedWarning({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: context.colors.warningSoft,
        borderRadius: AppRadius.mdAll,
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.info_outline_rounded, color: context.colors.warning),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              '${AppStrings.splitUnassigned}: $count',
              style: AppTypography.bodySmall.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
