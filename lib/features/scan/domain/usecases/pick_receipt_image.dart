import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../repositories/receipt_scan_repository.dart';

@lazySingleton
class PickReceiptImage {
  const PickReceiptImage(this._repository);

  final ReceiptScanRepository _repository;

  Future<Result<String?>> call() => _repository.pickFromGallery();
}
