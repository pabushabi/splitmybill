import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_radius.dart';
import '../extensions/build_context_x.dart';
import '../theme/app_typography.dart';
import 'stepper_button.dart';

/// Компактный счётчик «минус — значение — плюс».
class CountStepper extends StatelessWidget {
  const CountStepper({
    required this.value,
    required this.onChanged,
    this.min = 1,
    this.max = 99,
    this.compact = false,
    super.key,
  });

  final int value;
  final ValueChanged<int> onChanged;
  final int min;
  final int max;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final double buttonSize = compact ? 30 : 38;

    return Container(
      decoration: BoxDecoration(
        color: context.colors.surfaceVariant,
        borderRadius: AppRadius.pillAll,
      ),
      padding: const EdgeInsets.all(3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          StepperButton(
            icon: Icons.remove_rounded,
            size: buttonSize,
            onTap: value > min ? () => _change(value - 1) : null,
          ),
          Container(
            constraints: BoxConstraints(minWidth: compact ? 28 : 36),
            alignment: Alignment.center,
            child: Text(
              '$value',
              style:
                  (compact
                          ? AppTypography.titleSmall
                          : AppTypography.titleMedium)
                      .copyWith(color: context.colors.textPrimary),
            ),
          ),
          StepperButton(
            icon: Icons.add_rounded,
            size: buttonSize,
            onTap: value < max ? () => _change(value + 1) : null,
          ),
        ],
      ),
    );
  }

  void _change(int next) {
    HapticFeedback.selectionClick();
    onChanged(next);
  }
}
