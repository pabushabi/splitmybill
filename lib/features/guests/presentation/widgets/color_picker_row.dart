import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/theme/guest_palette.dart';
import 'package:splitmybill/core/widgets/color_dot.dart';

class ColorPickerRow extends StatelessWidget {
  const ColorPickerRow({
    required this.selectedValue,
    required this.onSelected,
    super.key,
  });

  final int selectedValue;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: GuestPalette.colors
          .map(
            (Color color) => ColorDot(
              color: color,
              isSelected: color.toARGB32() == selectedValue,
              onTap: () => onSelected(color.toARGB32()),
            ),
          )
          .toList(),
    );
  }
}
