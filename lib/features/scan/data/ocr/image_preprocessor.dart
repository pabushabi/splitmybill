import 'dart:io';

import 'package:image/image.dart' as img;
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

/// Готовит фотографию чека к распознаванию.
///
/// Чек — это тёмный текст на светлой бумаге, поэтому перевод в оттенки серого
/// с растяжением контраста заметно поднимает качество Tesseract. Слишком
/// большие снимки замедляют распознавание, поэтому ширина ограничивается.
@lazySingleton
class ImagePreprocessor {
  const ImagePreprocessor();

  static const int _targetWidth = 1600;
  static const int _minWidthToUpscale = 900;

  Future<String> prepare(String sourcePath) async {
    final File source = File(sourcePath);
    final img.Image? decoded = img.decodeImage(await source.readAsBytes());
    if (decoded == null) return sourcePath;

    img.Image processed = img.bakeOrientation(decoded);

    if (processed.width > _targetWidth) {
      processed = img.copyResize(
        processed,
        width: _targetWidth,
        interpolation: img.Interpolation.average,
      );
    } else if (processed.width < _minWidthToUpscale) {
      // Мелкий кадр лучше увеличить, иначе мелкие цифры теряются.
      processed = img.copyResize(
        processed,
        width: _minWidthToUpscale,
        interpolation: img.Interpolation.cubic,
      );
    }

    processed = img.grayscale(processed);
    processed = img.adjustColor(processed, contrast: 1.35, brightness: 1.05);
    processed = img.normalize(processed, min: 0, max: 255);

    final Directory tempDir = await getTemporaryDirectory();
    final String outputPath =
        '${tempDir.path}/ocr_${DateTime.now().microsecondsSinceEpoch}.png';
    await File(outputPath).writeAsBytes(img.encodePng(processed));
    return outputPath;
  }
}
