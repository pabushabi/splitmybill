import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_radius.dart';
import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/theme/app_typography.dart';

/// Затемнение с прозрачным окном под чек и подсказкой.
class ReceiptFrameOverlay extends StatelessWidget {
  const ReceiptFrameOverlay({super.key});

  static const double _horizontalInset = 0.08;
  static const double _verticalInset = 0.12;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;
        final Rect window = Rect.fromLTRB(
          width * _horizontalInset,
          height * _verticalInset,
          width * (1 - _horizontalInset),
          height * (1 - _verticalInset),
        );

        return Stack(
          children: <Widget>[
            Positioned.fill(
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.black54,
                  BlendMode.srcOut,
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          backgroundBlendMode: BlendMode.dstOut,
                        ),
                      ),
                    ),
                    Positioned.fromRect(
                      rect: window,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: AppRadius.lgAll,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fromRect(
              rect: window,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: AppRadius.lgAll,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.85),
                    width: 2,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: window.bottom + AppSpacing.lg,
              child: Text(
                AppStrings.captureHint,
                textAlign: TextAlign.center,
                style: AppTypography.bodyMedium.copyWith(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
