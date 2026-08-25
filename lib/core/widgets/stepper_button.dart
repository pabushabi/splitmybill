import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';

/// Круглая кнопка «плюс/минус» для [CountStepper].
class StepperButton extends StatelessWidget {
  const StepperButton({
    required this.icon,
    required this.size,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final double size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool enabled = onTap != null;
    return Material(
      color: enabled ? context.colors.surface : Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(
            icon,
            size: size * 0.5,
            color: enabled
                ? context.colors.textPrimary
                : context.colors.textTertiary,
          ),
        ),
      ),
    );
  }
}
