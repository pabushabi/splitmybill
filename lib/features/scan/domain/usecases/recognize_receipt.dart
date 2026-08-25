import 'package:injectable/injectable.dart';

import 'package:splitmybill/core/utils/result.dart';
import 'package:splitmybill/features/scan/domain/entities/parsed_receipt.dart';
import 'package:splitmybill/features/scan/domain/repositories/receipt_scan_repository.dart';

@lazySingleton
class RecognizeReceipt {
  const RecognizeReceipt(this._repository);

  final ReceiptScanRepository _repository;

  Future<Result<ParsedReceipt>> call(String imagePath) =>
      _repository.recognize(imagePath);
}
