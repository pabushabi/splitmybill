import 'package:flutter/material.dart';

import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/guest_avatar.dart';
import '../../../guests/domain/entities/guest.dart';

class SavedGuestsPicker extends StatelessWidget {
  const SavedGuestsPicker({
    required this.guests,
    required this.selectedIds,
    required this.onToggle,
    required this.onManage,
    super.key,
  });

  final List<Guest> guests;
  final Set<String> selectedIds;
  final ValueChanged<Guest> onToggle;
  final VoidCallback onManage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                AppStrings.homeSavedGuests,
                style: AppTypography.titleMedium.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
            ),
            TextButton(
              onPressed: onManage,
              child: Text(AppStrings.homeManageGuests),
            ),
          ],
        ),
        if (guests.isEmpty)
          Text(
            AppStrings.homeSavedGuestsEmpty,
            style: AppTypography.bodySmall.copyWith(
              color: context.colors.textSecondary,
            ),
          )
        else
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: guests
                .map(
                  (Guest guest) => _SavedGuestChip(
                    guest: guest,
                    isSelected: selectedIds.contains(guest.id),
                    onTap: () => onToggle(guest),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }
}

class _SavedGuestChip extends StatelessWidget {
  const _SavedGuestChip({
    required this.guest,
    required this.isSelected,
    required this.onTap,
  });

  final Guest guest;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? context.colors.brandSoft : context.colors.surface,
      borderRadius: AppRadius.pillAll,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.xs,
            AppSpacing.xs,
            AppSpacing.md,
            AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            borderRadius: AppRadius.pillAll,
            border: Border.all(
              color: isSelected ? context.colors.brand : context.colors.border,
            ),
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
