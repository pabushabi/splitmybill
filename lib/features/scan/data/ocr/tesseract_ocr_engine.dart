import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/ocr_result.dart';
import '../../domain/services/ocr_engine.dart';
import 'image_preprocessor.dart';

/// Основной движок: Tesseract с русской и английской моделями.
///
/// `psm: 4` — режим «одна колонка текста переменного размера», ровно то, чем
/// является чек. `preserve_interword_spaces` сохраняет пробелы между
/// названием и ценой, по которым парсер делит строку на колонки.
@Named(OcrEngine.tesseractEngine)
@LazySingleton(as: OcrEngine)
class TesseractOcrEngine implements OcrEngine {
  const TesseractOcrEngine(this._preprocessor);

  final ImagePreprocessor _preprocessor;

  @override
  String get id => OcrEngine.tesseractEngine;

  @override
  Future<OcrResult> recognize(String imagePath) async {
    try {
      final String preparedPath = await _preprocessor.prepare(imagePath);
      final String text = await FlutterTesseractOcr.extractText(
        preparedPath,
        language: AppAssets.tessLanguages,
        args: <String, String>{
          'psm': '4',
          'oem': '1',
          'preserve_interword_spaces': '1',
        },
      );
      return OcrResult.fromPlainText(text, engineId: id);
    } catch (e) {
      throw OcrException('Tesseract не смог обработать снимок: $e');
    }
  }

  @override
  Future<void> dispose() async {}
}
