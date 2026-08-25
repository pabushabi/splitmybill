import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_radius.dart';
import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';
import 'package:splitmybill/core/utils/money_formatter.dart';
import 'package:splitmybill/features/bill/domain/entities/bill_item.dart';

class ReviewItemTile extends StatelessWidget {
  const ReviewItemTile({
    required this.item,
    required this.onTap,
    required this.onDelete,
    super.key,
  });

  final BillItem item;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<String>(item.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: AppSpacing.xl),
        decoration: BoxDecoration(
          color: context.colors.dangerSoft,
          borderRadius: AppRadius.mdAll,
        ),
        child: Icon(Icons.delete_outline_rounded, color: context.colors.danger),
      ),
      child: Material(
        color: context.colors.surface,
        borderRadius: AppRadius.mdAll,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
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
                          '${item.quantity} × '
                          '${MoneyFormatter.format(item.unitPriceMinor)}',
                          style: AppTypography.bodySmall.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Text(
                  MoneyFormatter.format(item.totalMinor),
                  style: AppTypography.moneySmall.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                  color: context.colors.textTertiary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
