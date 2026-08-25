import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_radius.dart';
import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';
import 'package:splitmybill/core/widgets/guest_avatar.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';

class AssignmentGuestChip extends StatelessWidget {
  const AssignmentGuestChip({
    required this.guest,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final Guest guest;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? context.colors.brandSoft : context.colors.surfaceVariant,
      borderRadius: AppRadius.pillAll,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.xs,
            AppSpacing.xs,
            AppSpacing.md,
            AppSpacing.xs,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GuestAvatar(
                name: guest.name,
                color: guest.color,
                size: 28,
                isSelected: isSelected,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                guest.name,
                style: AppTypography.labelMedium.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
