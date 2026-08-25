import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';

import 'crop_edge_handle.dart';

/// Редактор обрезки чека: рамка пакета плюс ручки сторон поверх неё.
class ReceiptCropView extends StatefulWidget {
  const ReceiptCropView({
    required this.image,
    required this.controller,
    required this.onCropped,
    super.key,
  });

  final Uint8List image;
  final CropController controller;
  final ValueChanged<CropResult> onCropped;

  static const double initialInset = 16;
  static const double minSide = 40;
  static const double cornerClearance = 28;

  @override
  State<ReceiptCropView> createState() => _ReceiptCropViewState();
}

class _ReceiptCropViewState extends State<ReceiptCropView> {
  Rect? _cropRect;

  void _resize({double dx = 0, double dy = 0, required _CropEdge edge}) {
    final Rect? current = _cropRect;
    if (current == null) return;

    double left = current.left;
    double top = current.top;
    double right = current.right;
    double bottom = current.bottom;

    switch (edge) {
      case _CropEdge.top:
        top = (top + dy).clamp(0, bottom - ReceiptCropView.minSide);
      case _CropEdge.right:
        right = (right + dx).clamp(left + ReceiptCropView.minSide, double.infinity);
      case _CropEdge.bottom:
        bottom = (bottom + dy).clamp(top + ReceiptCropView.minSide, double.infinity);
      case _CropEdge.left:
        left = (left + dx).clamp(0, right - ReceiptCropView.minSide);
    }

    widget.controller.cropRect = Rect.fromLTRB(left, top, right, bottom);
  }

  @override
  Widget build(BuildContext context) {
    final Rect? rect = _cropRect;

    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Crop(
          controller: widget.controller,
          image: widget.image,
          onCropped: widget.onCropped,
          onMoved: (ViewportBasedRect viewportRect, ImageBasedRect _) {
            setState(() => _cropRect = viewportRect);
          },
          initialRectBuilder: InitialRectBuilder.withBuilder(
            (ViewportBasedRect viewportRect, ImageBasedRect imageRect) {
              final Rect area = viewportRect.intersect(imageRect);
              const double inset = ReceiptCropView.initialInset;
              if (area.width < inset * 2 + ReceiptCropView.minSide ||
                  area.height < inset * 2 + ReceiptCropView.minSide) {
                return area;
              }
              return Rect.fromLTRB(
                area.left + inset,
                area.top + inset,
                area.right - inset,
                area.bottom - inset,
              );
            },
          ),
          baseColor: Colors.black,
          maskColor: Colors.black.withValues(alpha: 0.6),
          cornerDotBuilder: (double size, EdgeAlignment alignment) =>
              const DotControl(color: Colors.white),
          interactive: true,
          radius: 8,
        ),
        if (rect != null) ...<Widget>[
          Positioned(
            left: rect.left + ReceiptCropView.cornerClearance,
            top: rect.top - CropEdgeHandle.hitSize / 2,
            width: (rect.width - ReceiptCropView.cornerClearance * 2).clamp(
              0,
              double.infinity,
            ),
            height: CropEdgeHandle.hitSize,
            child: CropEdgeHandle(
              axis: CropHandleAxis.horizontal,
              onDrag: (DragUpdateDetails details) =>
                  _resize(dy: details.delta.dy, edge: _CropEdge.top),
            ),
          ),
          Positioned(
            left: rect.left + ReceiptCropView.cornerClearance,
            top: rect.bottom - CropEdgeHandle.hitSize / 2,
            width: (rect.width - ReceiptCropView.cornerClearance * 2).clamp(
              0,
              double.infinity,
            ),
            height: CropEdgeHandle.hitSize,
            child: CropEdgeHandle(
              axis: CropHandleAxis.horizontal,
              onDrag: (DragUpdateDetails details) =>
                  _resize(dy: details.delta.dy, edge: _CropEdge.bottom),
            ),
          ),
          Positioned(
            left: rect.left - CropEdgeHandle.hitSize / 2,
            top: rect.top + ReceiptCropView.cornerClearance,
            width: CropEdgeHandle.hitSize,
            height: (rect.height - ReceiptCropView.cornerClearance * 2).clamp(
              0,
              double.infinity,
            ),
            child: CropEdgeHandle(
              axis: CropHandleAxis.vertical,
              onDrag: (DragUpdateDetails details) =>
                  _resize(dx: details.delta.dx, edge: _CropEdge.left),
            ),
          ),
          Positioned(
            left: rect.right - CropEdgeHandle.hitSize / 2,
            top: rect.top + ReceiptCropView.cornerClearance,
            width: CropEdgeHandle.hitSize,
            height: (rect.height - ReceiptCropView.cornerClearance * 2).clamp(
              0,
              double.infinity,
            ),
            child: CropEdgeHandle(
              axis: CropHandleAxis.vertical,
              onDrag: (DragUpdateDetails details) =>
                  _resize(dx: details.delta.dx, edge: _CropEdge.right),
            ),
          ),
        ],
      ],
    );
  }
}

enum _CropEdge { top, right, bottom, left }
