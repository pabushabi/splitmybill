import 'package:flutter/material.dart';

/// Полупрозрачная круглая кнопка поверх превью камеры.
class CameraRoundButton extends StatelessWidget {
  const CameraRoundButton({
    required this.icon,
    required this.onPressed,
    this.isActive = false,
    this.tooltip,
    this.size = 48,
    super.key,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final bool isActive;
  final String? tooltip;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: Material(
        color: isActive
            ? Colors.white.withValues(alpha: 0.9)
            : Colors.black.withValues(alpha: 0.35),
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(
              icon,
              size: size * 0.46,
              color: isActive ? Colors.black87 : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
