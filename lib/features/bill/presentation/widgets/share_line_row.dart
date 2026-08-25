import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';
import 'package:splitmybill/core/utils/money_formatter.dart';
import 'package:splitmybill/features/bill/domain/entities/share_line.dart';

class ShareLineRow extends StatelessWidget {
  const ShareLineRow({required this.line, super.key});

  final ShareLine line;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  line.title,
                  style: AppTypography.bodyMedium.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
                if (line.isShared)
                  Text(
                    '${line.weight} ${AppStrings.splitOf} ${line.totalWeight}',
                    style: AppTypography.labelSmall.copyWith(
                      color: context.colors.textTertiary,
                    ),
                  ),
              ],
            ),
          ),
          Text(
            MoneyFormatter.format(line.amountMinor),
            style: AppTypography.labelMedium.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
