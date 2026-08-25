import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/state/cubit_state.dart';
import '../../domain/entities/parsed_receipt.dart';

part 'capture_state.freezed.dart';

@freezed
sealed class CaptureState with _$CaptureState {
  const factory CaptureState({
    @Default(CubitState.initial) CubitState status,
    @Default(false) bool isPermissionGranted,
    @Default(false) bool isPermissionPermanentlyDenied,
    @Default(false) bool isRecognizing,

    /// Снимок, выбранный из галереи и требующий перехода к обрезке.
    final String? pickedImagePath,
    final ParsedReceipt? receipt,
    final String? errorMessage,
  }) = _CaptureState;

  const CaptureState._();

  factory CaptureState.initial() => const CaptureState();

  bool get isPermissionDenied =>
      status.isSuccess && !isPermissionGranted;

  bool get isBusy => isRecognizing || status.isLoading;
}
