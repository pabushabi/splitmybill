import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_durations.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/guest_palette.dart';

/// Кружок цвета в палитре выбора: при выборе показывает галочку.
class ColorDot extends StatelessWidget {
  const ColorDot({
    required this.color,
    required this.isSelected,
    this.onTap,
    this.size = 40,
    super.key,
  });

  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: AppDurations.fast,
        curve: Curves.easeOutBack,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? context.colors.textPrimary : Colors.transparent,
            width: 2.5,
          ),
        ),
        child: isSelected
            ? Icon(
                Icons.check_rounded,
                size: size * 0.5,
                color: GuestPalette.foregroundOn(color),
              )
            : null,
      ),
    );
  }
}
