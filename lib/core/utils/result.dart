import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:splitmybill/core/error/exceptions.dart';
import 'package:splitmybill/core/error/failure.dart';

part 'result.freezed.dart';

/// Результат операции репозитория: успех со значением либо [Failure].
@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T value) = Success<T>;
  const factory Result.failure(Failure failure) = ResultFailure<T>;

  const Result._();

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is ResultFailure<T>;

  T? get valueOrNull => switch (this) {
    Success<T>(:final value) => value,
    ResultFailure<T>() => null,
  };

  Failure? get failureOrNull => switch (this) {
    Success<T>() => null,
    ResultFailure<T>(:final failure) => failure,
  };

  R fold<R>({
    required R Function(T value) onSuccess,
    required R Function(Failure failure) onFailure,
  }) {
    return switch (this) {
      Success<T>(:final value) => onSuccess(value),
      ResultFailure<T>(:final failure) => onFailure(failure),
    };
  }

  Result<R> map<R>(R Function(T value) transform) {
    return switch (this) {
      Success<T>(:final value) => Result<R>.success(transform(value)),
      ResultFailure<T>(:final failure) => Result<R>.failure(failure),
    };
  }
}

/// Оборачивает работу с источником данных, превращая исключения в [Failure].
Future<Result<T>> guardAsync<T>(Future<T> Function() action) async {
  try {
    return Result<T>.success(await action());
  } on AppException catch (e) {
    return Result<T>.failure(e.toFailure());
  } catch (e) {
    return Result<T>.failure(Failure.unknown(e.toString()));
  }
}

extension AppExceptionToFailure on AppException {
  Failure toFailure() => switch (this) {
    CameraException(:final message) => Failure.camera(message),
    OcrException(:final message) => Failure.ocr(message),
    ParsingException(:final message) => Failure.parsing(message),
    StorageException(:final message) => Failure.storage(message),
    PermissionDeniedException(:final message, :final permanently) =>
      Failure.permissionDenied(permanently: permanently, details: message),
  };
}
