import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../entities/parsed_receipt.dart';
import '../repositories/receipt_scan_repository.dart';

@lazySingleton
class RecognizeReceipt {
  const RecognizeReceipt(this._repository);

  final ReceiptScanRepository _repository;

  Future<Result<ParsedReceipt>> call(String imagePath) =>
      _repository.recognize(imagePath);
}
