import 'package:flutter/material.dart';

import '../../../../core/constants/app_durations.dart';

/// Большая круглая кнопка спуска затвора.
class CaptureButton extends StatelessWidget {
  const CaptureButton({required this.onPressed, this.isBusy = false, super.key});

  final VoidCallback? onPressed;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    final bool enabled = onPressed != null && !isBusy;

    return Semantics(
      button: true,
      label: 'Сделать снимок',
      child: GestureDetector(
        onTap: enabled ? onPressed : null,
        child: AnimatedContainer(
          duration: AppDurations.fast,
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha: enabled ? 0.9 : 0.4),
              width: 4,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: enabled ? 1 : 0.5),
              ),
              child: isBusy
                  ? const Padding(
                      padding: EdgeInsets.all(18),
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.black54,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
