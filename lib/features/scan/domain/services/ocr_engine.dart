import 'package:splitmybill/features/scan/domain/entities/ocr_result.dart';

/// Движок распознавания текста на изображении.
///
/// Реализации подключаются в DI по имени: [tesseractEngine] читает кириллицу,
/// [mlKitEngine] быстрее, но работает только с латиницей и цифрами.
abstract interface class OcrEngine {
  static const String tesseractEngine = 'tesseract';
  static const String mlKitEngine = 'mlkit';

  String get id;

  Future<OcrResult> recognize(String imagePath);

  Future<void> dispose();
}
