import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_durations.dart';
import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';
import 'package:splitmybill/core/utils/money_formatter.dart';
import 'package:splitmybill/core/widgets/app_card.dart';
import 'package:splitmybill/core/widgets/guest_avatar.dart';
import 'package:splitmybill/features/bill/domain/entities/guest_share.dart';
import 'package:splitmybill/features/bill/domain/entities/share_line.dart';
import 'share_line_row.dart';

class GuestShareCard extends StatefulWidget {
  const GuestShareCard({required this.share, super.key});

  final GuestShare share;

  @override
  State<GuestShareCard> createState() => _GuestShareCardState();
}

class _GuestShareCardState extends State<GuestShareCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final GuestShare share = widget.share;

    return AppCard(
      onTap: share.lines.isEmpty
          ? null
          : () => setState(() => _expanded = !_expanded),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              GuestAvatar(
                name: share.guest.name,
                color: share.guest.color,
                size: 48,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      share.guest.name,
                      style: AppTypography.titleMedium.copyWith(
                        color: context.colors.textPrimary,
                      ),
                    ),
                    Text(
                      AppStrings.summaryToPay,
                      style: AppTypography.bodySmall.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                MoneyFormatter.format(share.totalMinor),
                style: AppTypography.money.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
            ],
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity, height: 0),
            secondChild: Padding(
              padding: const EdgeInsets.only(top: AppSpacing.md),
              child: Column(
                children: <Widget>[
                  const Divider(),
                  ...share.lines.map((ShareLine line) => ShareLineRow(line: line)),
                  if (share.tipMinor > 0)
                    ShareLineRow(
                      line: ShareLine(
                        itemId: 'tip',
                        title: AppStrings.summaryTip,
                        amountMinor: share.tipMinor,
                        weight: 1,
                        totalWeight: 1,
                      ),
                    ),
                ],
              ),
            ),
            crossFadeState: _expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: AppDurations.fast,
          ),
        ],
      ),
    );
  }
}
