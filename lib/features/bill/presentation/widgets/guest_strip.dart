import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../guests/domain/entities/guest.dart';
import 'guest_strip_item.dart';

class GuestStrip extends StatelessWidget {
  const GuestStrip({
    required this.guests,
    required this.selectedGuestId,
    required this.amountOf,
    required this.onSelect,
    required this.onEdit,
    super.key,
  });

  final List<Guest> guests;
  final String? selectedGuestId;
  final int Function(String guestId) amountOf;
  final ValueChanged<String> onSelect;
  final ValueChanged<Guest> onEdit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        scrollDirection: Axis.horizontal,
        itemCount: guests.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.xs),
        itemBuilder: (BuildContext context, int index) {
          final Guest guest = guests[index];
          return GuestStripItem(
            guest: guest,
            amountMinor: amountOf(guest.id),
            isSelected: guest.id == selectedGuestId,
            onTap: () => onSelect(guest.id),
            onLongPress: () => onEdit(guest),
          );
        },
      ),
    );
  }
}
