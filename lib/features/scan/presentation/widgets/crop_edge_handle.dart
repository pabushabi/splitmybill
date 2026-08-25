import 'package:flutter/material.dart';

import '../../../../core/constants/app_radius.dart';

enum CropHandleAxis { horizontal, vertical }

/// Ручка стороны рамки обрезки: широкая зона нажатия и короткая «пилюля».
class CropEdgeHandle extends StatelessWidget {
  const CropEdgeHandle({
    required this.axis,
    required this.onDrag,
    super.key,
  });

  final CropHandleAxis axis;
  final GestureDragUpdateCallback onDrag;

  static const double hitSize = 44;
  static const double pillLength = 36;
  static const double pillThickness = 5;

  @override
  Widget build(BuildContext context) {
    final bool isHorizontal = axis == CropHandleAxis.horizontal;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanUpdate: onDrag,
      child: Center(
        child: Container(
          width: isHorizontal ? pillLength : pillThickness,
          height: isHorizontal ? pillThickness : pillLength,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: AppRadius.pillAll,
          ),
        ),
      ),
    );
  }
}
