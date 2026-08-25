import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';
import 'package:splitmybill/core/utils/money_formatter.dart';
import 'package:splitmybill/core/widgets/guest_avatar.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';

class GuestStripItem extends StatelessWidget {
  const GuestStripItem({
    required this.guest,
    required this.amountMinor,
    required this.isSelected,
    required this.onTap,
    required this.onLongPress,
    super.key,
  });

  final Guest guest;
  final int amountMinor;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 76,
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.sm,
          horizontal: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: isSelected ? context.colors.brandSoft : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GuestAvatar(
              name: guest.name,
              color: guest.color,
              size: isSelected ? 48 : 44,
              isSelected: isSelected,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              guest.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.labelSmall.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
            Text(
              MoneyFormatter.format(amountMinor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.labelSmall.copyWith(
                color: isSelected
                    ? context.colors.brand
                    : context.colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
