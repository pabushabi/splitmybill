import 'package:flutter/material.dart';

import '../../../../core/widgets/guest_avatar.dart';
import '../../../guests/domain/entities/guest.dart';

class AssignedAvatarsStack extends StatelessWidget {
  const AssignedAvatarsStack({
    required this.guests,
    this.size = 24,
    this.maxVisible = 3,
    super.key,
  });

  final List<Guest> guests;
  final double size;
  final int maxVisible;

  @override
  Widget build(BuildContext context) {
    if (guests.isEmpty) return const SizedBox.shrink();

    final List<Guest> visible = guests.take(maxVisible).toList();
    final int extra = guests.length - visible.length;
    final double overlap = size * 0.38;
    final double width =
        size + (visible.length - 1 + (extra > 0 ? 1 : 0)) * (size - overlap);

    return SizedBox(
      width: width,
      height: size,
      child: Stack(
        children: <Widget>[
          for (int i = 0; i < visible.length; i++)
            Positioned(
              left: i * (size - overlap),
              child: GuestAvatar(
                name: visible[i].name,
                color: visible[i].color,
                size: size,
                showRing: true,
              ),
            ),
          if (extra > 0)
            Positioned(
              left: visible.length * (size - overlap),
              child: GuestAvatar(
                name: '+$extra',
                color: Theme.of(context).colorScheme.outline,
                size: size,
                showRing: true,
              ),
            ),
        ],
      ),
    );
  }
}
