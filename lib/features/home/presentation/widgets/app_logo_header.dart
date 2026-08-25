import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_typography.dart';

class AppLogoHeader extends StatelessWidget {
  const AppLogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: context.colors.brand,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            Icons.receipt_rounded,
            color: context.colors.onBrand,
            size: 26,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          AppStrings.appName,
          style: AppTypography.headlineLarge.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          AppStrings.appTagline,
          style: AppTypography.bodyLarge.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
