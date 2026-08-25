import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../cubit/capture_cubit.dart';
import '../cubit/capture_state.dart';
import '../widgets/camera_permission_view.dart';
import '../widgets/camera_round_button.dart';
import '../widgets/camera_viewfinder.dart';
import '../widgets/capture_button.dart';
import '../widgets/receipt_frame_overlay.dart';

class CapturePage extends StatefulWidget {
  const CapturePage({super.key});

  @override
  State<CapturePage> createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> with WidgetsBindingObserver {
  CameraController? _controller;
  bool _isInitializing = false;
  bool _isFlashOn = false;
  bool _isShooting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<CaptureCubit>().requestCameraPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;

    if (state == AppLifecycleState.inactive) {
      _disposeCamera();
    } else if (state == AppLifecycleState.resumed) {
      _initCamera();
    }
  }

  Future<void> _initCamera() async {
    if (_isInitializing || _controller != null) return;
    _isInitializing = true;

    try {
      final List<CameraDescription> cameras = await availableCameras();
      if (cameras.isEmpty || !mounted) return;

      final CameraDescription camera = cameras.firstWhere(
        (CameraDescription c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      final CameraController controller = CameraController(
        camera,
        ResolutionPreset.veryHigh,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await controller.initialize();
      await controller.setFlashMode(FlashMode.off);

      if (!mounted) {
        await controller.dispose();
        return;
      }
      setState(() => _controller = controller);
    } catch (_) {
      if (mounted) context.showSnack(AppStrings.captureNoCamera, isError: true);
    } finally {
      _isInitializing = false;
    }
  }

  void _disposeCamera() {
    final CameraController? controller = _controller;
    if (controller == null) return;
    setState(() => _controller = null);
    controller.dispose();
  }

  Future<void> _toggleFlash() async {
    final CameraController? controller = _controller;
    if (controller == null) return;
    final bool next = !_isFlashOn;
    await controller.setFlashMode(next ? FlashMode.torch : FlashMode.off);
    if (mounted) setState(() => _isFlashOn = next);
  }

  Future<void> _shoot() async {
    final CameraController? controller = _controller;
    if (controller == null || _isShooting) return;

    setState(() => _isShooting = true);
    try {
      final XFile file = await controller.takePicture();
      if (!mounted) return;
      context.pushNamed(AppRoutes.cropName, extra: file.path);
    } catch (_) {
      if (mounted) context.showSnack(AppStrings.captureFailed, isError: true);
    } finally {
      if (mounted) setState(() => _isShooting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<CaptureCubit, CaptureState>(
        listenWhen: (CaptureState prev, CaptureState next) =>
            prev.isPermissionGranted != next.isPermissionGranted ||
            prev.pickedImagePath != next.pickedImagePath ||
            prev.errorMessage != next.errorMessage,
        listener: (BuildContext context, CaptureState state) {
          if (state.isPermissionGranted) _initCamera();

          final String? picked = state.pickedImagePath;
          if (picked != null) {
            context.read<CaptureCubit>().consumePickedImage();
            context.pushNamed(AppRoutes.cropName, extra: picked);
          }

          final String? error = state.errorMessage;
          if (error != null) {
            context.showSnack(error, isError: true);
            context.read<CaptureCubit>().clearError();
          }
        },
        builder: (BuildContext context, CaptureState state) {
          final CaptureCubit cubit = context.read<CaptureCubit>();

          if (state.isPermissionDenied) {
            return SafeArea(
              child: CameraPermissionView(
                isPermanentlyDenied: state.isPermissionPermanentlyDenied,
                onRequest: cubit.requestCameraPermission,
                onOpenSettings: cubit.openSystemSettings,
                onPickFromGallery: cubit.pickFromGallery,
              ),
            );
          }

          final CameraController? controller = _controller;

          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              if (controller != null && controller.value.isInitialized)
                CameraViewfinder(controller: controller)
              else
                const ColoredBox(color: Colors.black),
              const ReceiptFrameOverlay(),
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
                          const Spacer(),
                          CameraRoundButton(
                            icon: _isFlashOn
                                ? Icons.flash_on_rounded
                                : Icons.flash_off_rounded,
                            isActive: _isFlashOn,
                            tooltip: AppStrings.captureFlash,
                            onPressed: controller == null ? null : _toggleFlash,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.xxl,
                        0,
                        AppSpacing.xxl,
                        AppSpacing.xxl,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CameraRoundButton(
                            icon: Icons.photo_library_outlined,
                            tooltip: AppStrings.captureFromGallery,
                            onPressed: cubit.pickFromGallery,
                            size: 52,
                          ),
                          CaptureButton(
                            isBusy: _isShooting,
                            onPressed: controller == null ? null : _shoot,
                          ),
                          const SizedBox(width: 52),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
