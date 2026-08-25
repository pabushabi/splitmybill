/// Исключения слоя данных. Репозитории ловят их и превращают в `Failure`.
sealed class AppException implements Exception {
  const AppException([this.message]);

  final String? message;

  @override
  String toString() => '$runtimeType(${message ?? ''})';
}

class CameraException extends AppException {
  const CameraException([super.message]);
}

class OcrException extends AppException {
  const OcrException([super.message]);
}

class ParsingException extends AppException {
  const ParsingException([super.message]);
}

class StorageException extends AppException {
  const StorageException([super.message]);
}

class PermissionDeniedException extends AppException {
  const PermissionDeniedException({this.permanently = false, String? message})
    : super(message);

  /// Пользователь отказал навсегда — помогает только экран настроек системы.
  final bool permanently;
}
