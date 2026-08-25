import 'package:freezed_annotation/freezed_annotation.dart';

part 'ocr_line.freezed.dart';

/// Строка текста, найденная движком OCR.
@freezed
sealed class OcrLine with _$OcrLine {
  const factory OcrLine({
    required String text,

    /// Координаты строки на изображении. Tesseract в текстовом режиме их
    /// не отдаёт, поэтому парсер обязан работать и без них.
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) = _OcrLine;

  const OcrLine._();

  bool get hasBounds => top != null && bottom != null;

  double get verticalCenter =>
      hasBounds ? (top! + bottom!) / 2 : double.nan;
}
