import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/ocr_line.dart';
import '../../domain/entities/ocr_result.dart';
import '../../domain/services/ocr_engine.dart';
import 'image_preprocessor.dart';

/// Запасной движок: латинская модель ML Kit.
///
/// Кириллицу on-device она не читает, зато быстро и надёжно берёт цифры
/// и отдаёт координаты строк, по которым видно колонку цен.
@Named(OcrEngine.mlKitEngine)
@LazySingleton(as: OcrEngine)
class MlKitOcrEngine implements OcrEngine {
  const MlKitOcrEngine(this._textRecognizer, this._preprocessor);

  final TextRecognizer _textRecognizer;
  final ImagePreprocessor _preprocessor;

  @override
  String get id => OcrEngine.mlKitEngine;

  @override
  Future<OcrResult> recognize(String imagePath) async {
    try {
      final String preparedPath = await _preprocessor.prepare(imagePath);
      final RecognizedText recognized = await _textRecognizer.processImage(
        InputImage.fromFilePath(preparedPath),
      );

      final List<OcrLine> lines = <OcrLine>[];
      for (final TextBlock block in recognized.blocks) {
        for (final TextLine line in block.lines) {
          if (line.text.trim().isEmpty) continue;
          lines.add(
            OcrLine(
              text: line.text.trim(),
              left: line.boundingBox.left,
              top: line.boundingBox.top,
              right: line.boundingBox.right,
              bottom: line.boundingBox.bottom,
            ),
          );
        }
      }

      // Блоки приходят вразнобой, а чек читается сверху вниз.
      lines.sort(
        (OcrLine a, OcrLine b) =>
            (a.top ?? 0).compareTo(b.top ?? 0),
      );

      return OcrResult(
        rawText: lines.map((OcrLine line) => line.text).join('\n'),
        lines: lines,
        engineId: id,
      );
    } catch (e) {
      throw OcrException('ML Kit не смог обработать снимок: $e');
    }
  }

  @override
  Future<void> dispose() => _textRecognizer.close();
}
