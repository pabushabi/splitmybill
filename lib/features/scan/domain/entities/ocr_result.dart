import 'package:freezed_annotation/freezed_annotation.dart';

import 'ocr_line.dart';

part 'ocr_result.freezed.dart';

/// Результат распознавания изображения чека.
@freezed
sealed class OcrResult with _$OcrResult {
  const factory OcrResult({
    required String rawText,
    @Default(<OcrLine>[]) List<OcrLine> lines,
    required String engineId,
  }) = _OcrResult;

  const OcrResult._();

  factory OcrResult.fromPlainText(String text, {required String engineId}) {
    return OcrResult(
      rawText: text,
      engineId: engineId,
      lines: text
          .split('\n')
          .map((String line) => line.trim())
          .where((String line) => line.isNotEmpty)
          .map((String line) => OcrLine(text: line))
          .toList(),
    );
  }

  bool get isEmpty => lines.isEmpty;
}
