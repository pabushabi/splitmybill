import 'package:splitmybill/core/utils/result.dart';
import 'package:splitmybill/features/scan/domain/entities/parsed_receipt.dart';

abstract interface class ReceiptScanRepository {
  /// Распознаёт чек на снимке и разбирает его на позиции.
  Future<Result<ParsedReceipt>> recognize(String imagePath);

  /// Открывает галерею. `null` — пользователь ничего не выбрал.
  Future<Result<String?>> pickFromGallery();

  /// Запрашивает доступ к камере.
  Future<Result<bool>> ensureCameraPermission();
}
