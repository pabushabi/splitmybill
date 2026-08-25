import 'package:splitmybill/features/scan/domain/entities/ocr_result.dart';
import 'package:splitmybill/features/scan/domain/entities/parsed_receipt.dart';

/// Превращает распознанный текст в структуру чека.
abstract interface class ReceiptParser {
  ParsedReceipt parse(OcrResult ocrResult);
}
