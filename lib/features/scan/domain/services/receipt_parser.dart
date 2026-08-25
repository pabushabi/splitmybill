import '../entities/ocr_result.dart';
import '../entities/parsed_receipt.dart';

/// Превращает распознанный текст в структуру чека.
abstract interface class ReceiptParser {
  ParsedReceipt parse(OcrResult ocrResult);
}
