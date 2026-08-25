import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';
import 'package:splitmybill/core/widgets/guest_avatar.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';

class GuestListTile extends StatelessWidget {
  const GuestListTile({
    required this.guest,
    required this.onTap,
    required this.onDelete,
    super.key,
  });

  final Guest guest;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      leading: GuestAvatar(name: guest.name, color: guest.color),
      title: Text(
        guest.name,
        style: AppTypography.titleSmall.copyWith(
          color: context.colors.textPrimary,
        ),
      ),
      trailing: IconButton(
        tooltip: 'Удалить',
        onPressed: onDelete,
        icon: Icon(
          Icons.delete_outline_rounded,
          color: context.colors.textTertiary,
        ),
      ),
    );
  }
}
