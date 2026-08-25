import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/app_strings.dart';

part 'failure.freezed.dart';

/// Ошибка, пригодная для показа пользователю.
@freezed
sealed class Failure with _$Failure {
  const factory Failure.camera([String? details]) = CameraFailure;
  const factory Failure.ocr([String? details]) = OcrFailure;
  const factory Failure.parsing([String? details]) = ParsingFailure;
  const factory Failure.storage([String? details]) = StorageFailure;
  const factory Failure.permissionDenied({
    @Default(false) bool permanently,
    String? details,
  }) = PermissionDeniedFailure;
  const factory Failure.unknown([String? details]) = UnknownFailure;

  const Failure._();

  String get message => switch (this) {
    CameraFailure() => AppStrings.errorCamera,
    OcrFailure() => AppStrings.errorOcr,
    ParsingFailure() => AppStrings.errorParsing,
    StorageFailure() => AppStrings.errorStorage,
    PermissionDeniedFailure() => AppStrings.errorPermission,
    UnknownFailure() => AppStrings.errorUnknown,
  };
}
