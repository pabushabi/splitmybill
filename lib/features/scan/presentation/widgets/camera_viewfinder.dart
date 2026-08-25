import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

/// Превью камеры, растянутое на весь экран без искажения пропорций.
class CameraViewfinder extends StatelessWidget {
  const CameraViewfinder({required this.controller, super.key});

  final CameraController controller;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.sizeOf(context);
    // Соотношение сторон камеры задаётся в ландшафте, поэтому инвертируем.
    final double previewRatio = 1 / controller.value.aspectRatio;
    final double scale = screen.aspectRatio / previewRatio;

    return ClipRect(
      child: Transform.scale(
        scale: scale < 1 ? 1 / scale : scale,
        alignment: Alignment.center,
        child: Center(child: CameraPreview(controller)),
      ),
    );
  }
}
