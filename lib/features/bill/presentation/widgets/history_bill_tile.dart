import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';
import 'package:splitmybill/core/utils/date_formatter.dart';
import 'package:splitmybill/core/utils/money_formatter.dart';
import 'package:splitmybill/core/widgets/app_card.dart';
import 'package:splitmybill/features/bill/domain/entities/bill.dart';
import 'assigned_avatars_stack.dart';

class HistoryBillTile extends StatelessWidget {
  const HistoryBillTile({
    required this.bill,
    required this.onTap,
    required this.onDelete,
    super.key,
  });

  final Bill bill;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<String>(bill.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: AppSpacing.xl),
        color: context.colors.dangerSoft,
        child: Icon(Icons.delete_outline_rounded, color: context.colors.danger),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
        child: AppCard(
          onTap: onTap,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bill.placeName?.isNotEmpty == true
                          ? bill.placeName!
                          : AppStrings.appName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.titleSmall.copyWith(
                        color: context.colors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      DateFormatter.dayTime(bill.createdAt),
                      style: AppTypography.bodySmall.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    AssignedAvatarsStack(guests: bill.guests),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    MoneyFormatter.format(bill.grandTotalMinor),
                    style: AppTypography.moneySmall.copyWith(
                      color: context.colors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    AppStrings.guestsCountLabel(bill.guests.length),
                    style: AppTypography.labelSmall.copyWith(
                      color: context.colors.textTertiary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
