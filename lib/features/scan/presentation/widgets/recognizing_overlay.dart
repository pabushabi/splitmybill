import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/theme/app_typography.dart';

/// Затемнение с индикатором на время распознавания.
class RecognizingOverlay extends StatelessWidget {
  const RecognizingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black.withValues(alpha: 0.72),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              width: 34,
              height: 34,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              AppStrings.captureRecognizing,
              style: AppTypography.titleMedium.copyWith(color: Colors.white),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              AppStrings.captureRecognizingHint,
              style: AppTypography.bodySmall.copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
