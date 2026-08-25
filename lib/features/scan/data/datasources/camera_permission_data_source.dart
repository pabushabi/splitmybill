import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:splitmybill/core/error/exceptions.dart';

abstract interface class CameraPermissionDataSource {
  /// Возвращает `true`, если доступ к камере есть.
  Future<bool> ensureGranted();

  Future<void> openSettings();
}

@LazySingleton(as: CameraPermissionDataSource)
class PermissionHandlerCameraDataSource implements CameraPermissionDataSource {
  const PermissionHandlerCameraDataSource();

  @override
  Future<bool> ensureGranted() async {
    PermissionStatus status = await Permission.camera.status;
    if (status.isGranted) return true;

    if (status.isPermanentlyDenied) {
      throw const PermissionDeniedException(permanently: true);
    }

    status = await Permission.camera.request();
    if (status.isGranted) return true;

    throw PermissionDeniedException(
      permanently: status.isPermanentlyDenied,
      message: 'Доступ к камере не выдан',
    );
  }

  @override
  Future<void> openSettings() => openAppSettings();
}
