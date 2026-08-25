import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/error/failure.dart';
import 'package:splitmybill/core/state/cubit_state.dart';
import 'package:splitmybill/features/scan/data/datasources/camera_permission_data_source.dart';
import 'package:splitmybill/features/scan/domain/entities/parsed_receipt.dart';
import 'package:splitmybill/features/scan/domain/repositories/receipt_scan_repository.dart';
import 'package:splitmybill/features/scan/domain/usecases/pick_receipt_image.dart';
import 'package:splitmybill/features/scan/domain/usecases/recognize_receipt.dart';
import 'capture_state.dart';

/// Ведёт съёмку чека: разрешения, выбор снимка и распознавание.
@injectable
class CaptureCubit extends Cubit<CaptureState> {
  CaptureCubit(
    this._receiptScanRepository,
    this._pickReceiptImage,
    this._recognizeReceipt,
    this._cameraPermissionDataSource,
  ) : super(CaptureState.initial());

  final ReceiptScanRepository _receiptScanRepository;
  final PickReceiptImage _pickReceiptImage;
  final RecognizeReceipt _recognizeReceipt;
  final CameraPermissionDataSource _cameraPermissionDataSource;

  Future<void> requestCameraPermission() async {
    emit(state.copyWith(status: CubitState.loading, errorMessage: null));

    final result = await _receiptScanRepository.ensureCameraPermission();
    result.fold(
      onSuccess: (bool granted) => emit(
        state.copyWith(
          status: CubitState.success,
          isPermissionGranted: granted,
          isPermissionPermanentlyDenied: false,
        ),
      ),
      onFailure: (Failure failure) => emit(
        state.copyWith(
          status: CubitState.success,
          isPermissionGranted: false,
          isPermissionPermanentlyDenied: switch (failure) {
            PermissionDeniedFailure(:final permanently) => permanently,
            _ => false,
          },
        ),
      ),
    );
  }

  Future<void> openSystemSettings() =>
      _cameraPermissionDataSource.openSettings();

  Future<void> pickFromGallery() async {
    emit(state.copyWith(pickedImagePath: null, errorMessage: null));

    final result = await _pickReceiptImage();
    result.fold(
      onSuccess: (String? path) {
        if (path == null) return;
        emit(state.copyWith(pickedImagePath: path));
      },
      onFailure: (Failure failure) =>
          emit(state.copyWith(errorMessage: failure.message)),
    );
  }

  /// Сообщает, что снимок из галереи уже обработан навигацией.
  void consumePickedImage() => emit(state.copyWith(pickedImagePath: null));

  Future<void> recognize(String imagePath) async {
    if (state.isRecognizing) return;
    emit(
      state.copyWith(
        isRecognizing: true,
        errorMessage: null,
        receipt: null,
      ),
    );

    final result = await _recognizeReceipt(imagePath);
    result.fold(
      onSuccess: (ParsedReceipt receipt) => emit(
        state.copyWith(
          isRecognizing: false,
          status: CubitState.success,
          receipt: receipt,
          // Пустой результат — не ошибка: позиции можно ввести руками.
          errorMessage: receipt.isEmpty ? AppStrings.ocrEmpty : null,
        ),
      ),
      onFailure: (Failure failure) => emit(
        state.copyWith(
          isRecognizing: false,
          status: CubitState.failure,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  void consumeReceipt() => emit(state.copyWith(receipt: null));

  void clearError() => emit(state.copyWith(errorMessage: null));
}
