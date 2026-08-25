import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/theme/app_typography.dart';
import 'package:splitmybill/core/widgets/app_button.dart';

/// Экран-заглушка, когда доступ к камере не выдан.
class CameraPermissionView extends StatelessWidget {
  const CameraPermissionView({
    required this.onRequest,
    required this.onOpenSettings,
    required this.onPickFromGallery,
    required this.isPermanentlyDenied,
    super.key,
  });

  final VoidCallback onRequest;
  final VoidCallback onOpenSettings;
  final VoidCallback onPickFromGallery;
  final bool isPermanentlyDenied;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xxl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.photo_camera_outlined,
              color: Colors.white,
              size: 34,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            AppStrings.capturePermissionTitle,
            textAlign: TextAlign.center,
            style: AppTypography.titleLarge.copyWith(color: Colors.white),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            AppStrings.capturePermissionMessage,
            textAlign: TextAlign.center,
            style: AppTypography.bodyMedium.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: AppSpacing.xxl),
          AppButton(
            label: isPermanentlyDenied
                ? AppStrings.capturePermissionOpenSettings
                : AppStrings.retry,
            onPressed: isPermanentlyDenied ? onOpenSettings : onRequest,
            icon: isPermanentlyDenied
                ? Icons.settings_outlined
                : Icons.lock_open_rounded,
          ),
          const SizedBox(height: AppSpacing.md),
          AppButton(
            label: AppStrings.captureFromGallery,
            onPressed: onPickFromGallery,
            variant: AppButtonVariant.ghost,
            icon: Icons.photo_library_outlined,
          ),
        ],
      ),
    );
  }
}
