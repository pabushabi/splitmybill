import 'dart:io';
import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/widgets/app_button.dart';
import '../../domain/entities/parsed_receipt.dart';
import '../cubit/capture_cubit.dart';
import '../cubit/capture_state.dart';
import '../widgets/camera_round_button.dart';
import '../widgets/crop_hint_bar.dart';
import '../widgets/recognizing_overlay.dart';

/// Обрезка снимка перед распознаванием: чем меньше лишнего, тем точнее OCR.
class CropPage extends StatefulWidget {
  const CropPage({required this.imagePath, super.key});

  final String imagePath;

  @override
  State<CropPage> createState() => _CropPageState();
}

class _CropPageState extends State<CropPage> {
  final CropController _cropController = CropController();

  Uint8List? _imageBytes;
  bool _isCropping = false;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    try {
      final Uint8List bytes = await File(widget.imagePath).readAsBytes();
      if (!mounted) return;
      setState(() => _imageBytes = bytes);
    } catch (_) {
      if (!mounted) return;
      context.showSnack(AppStrings.captureFailed, isError: true);
      context.pop();
    }
  }

  void _confirm() {
    if (_isCropping) return;
    setState(() => _isCropping = true);
    _cropController.crop();
  }

  Future<void> _onCropped(CropResult result) async {
    if (!mounted) return;

    if (result is! CropSuccess) {
      setState(() => _isCropping = false);
      context.showSnack(AppStrings.captureFailed, isError: true);
      return;
    }

    try {
      final Directory tempDir = await getTemporaryDirectory();
      final String path =
          '${tempDir.path}/receipt_${DateTime.now().millisecondsSinceEpoch}.jpg';
      await File(path).writeAsBytes(result.croppedImage);
      if (!mounted) return;
      await context.read<CaptureCubit>().recognize(path);
    } catch (_) {
      if (mounted) context.showSnack(AppStrings.captureFailed, isError: true);
    } finally {
      if (mounted) setState(() => _isCropping = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uint8List? bytes = _imageBytes;

    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<CaptureCubit, CaptureState>(
        listenWhen: (CaptureState prev, CaptureState next) =>
            prev.receipt != next.receipt ||
            prev.errorMessage != next.errorMessage,
        listener: (BuildContext context, CaptureState state) {
          final ParsedReceipt? receipt = state.receipt;
          if (receipt != null) {
            context.read<CaptureCubit>().consumeReceipt();
            context.goNamed(AppRoutes.reviewName, extra: receipt);
            return;
          }

          final String? error = state.errorMessage;
          if (error != null) {
            context.showSnack(error, isError: true);
            context.read<CaptureCubit>().clearError();
          }
        },
        builder: (BuildContext context, CaptureState state) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              if (bytes == null)
                const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              else
                Crop(
                  controller: _cropController,
                  image: bytes,
                  onCropped: _onCropped,
                  baseColor: Colors.black,
                  maskColor: Colors.black.withValues(alpha: 0.6),
                  cornerDotBuilder: (double size, EdgeAlignment alignment) =>
                      const DotControl(color: Colors.white),
                  interactive: true,
                  radius: 8,
                ),
              SafeArea(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Row(
                        children: <Widget>[
                          CameraRoundButton(
                            icon: Icons.arrow_back_rounded,
                            onPressed: () => context.pop(),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const CropHintBar(text: AppStrings.captureCropHint),
                    const SizedBox(height: AppSpacing.lg),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.xl,
                        0,
                        AppSpacing.xl,
                        AppSpacing.xxl,
                      ),
                      child: Column(
                        children: <Widget>[
                          AppButton(
                            label: AppStrings.captureRecognize,
                            icon: Icons.document_scanner_outlined,
                            isLoading: _isCropping || state.isRecognizing,
                            onPressed: bytes == null ? null : _confirm,
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          AppButton(
                            label: AppStrings.ocrAddManually,
                            variant: AppButtonVariant.ghost,
                            onPressed: state.isRecognizing
                                ? null
                                : () => context.goNamed(
                                    AppRoutes.reviewName,
                                    extra: ParsedReceipt.empty(),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (state.isRecognizing) const RecognizingOverlay(),
            ],
          );
        },
      ),
    );
  }
}
