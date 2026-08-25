import 'package:flutter/material.dart';

import '../constants/app_durations.dart';
import '../extensions/build_context_x.dart';
import '../extensions/string_x.dart';
import '../theme/guest_palette.dart';

/// Круглый аватар гостя с инициалом на его цвете.
class GuestAvatar extends StatelessWidget {
  const GuestAvatar({
    required this.name,
    required this.color,
    this.size = 44,
    this.isSelected = false,
    this.showRing = false,
    super.key,
  });

  final String name;
  final Color color;
  final double size;
  final bool isSelected;
  final bool showRing;

  @override
  Widget build(BuildContext context) {
    final double ringWidth = isSelected ? 2.5 : 1.5;
    final bool hasRing = isSelected || showRing;

    return AnimatedContainer(
      duration: AppDurations.fast,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: hasRing
            ? Border.all(
                color: isSelected
                    ? context.colors.textPrimary
                    : context.colors.surface,
                width: ringWidth,
              )
            : null,
      ),
      alignment: Alignment.center,
      child: Text(
        name.initials,
        style: TextStyle(
          color: GuestPalette.foregroundOn(color),
          fontSize: size * 0.4,
          fontWeight: FontWeight.w700,
          height: 1,
        ),
      ),
    );
  }
}
