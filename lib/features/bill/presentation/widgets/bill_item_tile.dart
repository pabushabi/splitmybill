import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_radius.dart';
import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';
import 'package:splitmybill/core/utils/money_formatter.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';
import 'package:splitmybill/features/bill/domain/entities/bill_item.dart';
import 'assigned_avatars_stack.dart';

class BillItemTile extends StatelessWidget {
  const BillItemTile({
    required this.item,
    required this.assignedGuests,
    required this.isAssigned,
    required this.onTap,
    super.key,
  });

  final BillItem item;
  final List<Guest> assignedGuests;
  final bool isAssigned;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.surface,
      borderRadius: AppRadius.mdAll,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            borderRadius: AppRadius.mdAll,
            border: Border.all(
              color: isAssigned
                  ? context.colors.border
                  : context.colors.warning.withValues(alpha: 0.45),
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.titleSmall.copyWith(
                        color: context.colors.textPrimary,
                      ),
                    ),
                    if (item.hasMultipleUnits) ...<Widget>[
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        '${item.quantity} × ${MoneyFormatter.format(item.unitPriceMinor)}',
                        style: AppTypography.bodySmall.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    MoneyFormatter.format(item.totalMinor),
                    style: AppTypography.moneySmall.copyWith(
                      color: context.colors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  AssignedAvatarsStack(guests: assignedGuests),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
