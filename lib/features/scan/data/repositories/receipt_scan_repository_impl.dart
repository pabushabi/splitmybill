import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/ocr_result.dart';
import '../../domain/entities/parsed_receipt.dart';
import '../../domain/repositories/receipt_scan_repository.dart';
import '../../domain/services/ocr_engine.dart';
import '../../domain/services/receipt_parser.dart';
import '../datasources/camera_permission_data_source.dart';
import '../datasources/gallery_data_source.dart';

@LazySingleton(as: ReceiptScanRepository)
class ReceiptScanRepositoryImpl implements ReceiptScanRepository {
  const ReceiptScanRepositoryImpl(
    @Named(OcrEngine.tesseractEngine) this._primaryEngine,
    @Named(OcrEngine.mlKitEngine) this._fallbackEngine,
    this._parser,
    this._galleryDataSource,
    this._cameraPermissionDataSource,
  );

  final OcrEngine _primaryEngine;
  final OcrEngine _fallbackEngine;
  final ReceiptParser _parser;
  final GalleryDataSource _galleryDataSource;
  final CameraPermissionDataSource _cameraPermissionDataSource;

  @override
  Future<Result<ParsedReceipt>> recognize(String imagePath) {
    return guardAsync(() async {
      ParsedReceipt receipt = await _recognizeWith(_primaryEngine, imagePath);

      // Кириллическая модель могла не справиться со снимком — пробуем ML Kit,
      // он хотя бы вытащит цены, а названия пользователь допишет сам.
      if (receipt.isEmpty) {
        final ParsedReceipt fallback = await _recognizeWith(
          _fallbackEngine,
          imagePath,
        );
        if (fallback.items.length > receipt.items.length) {
          receipt = fallback;
        }
      }

      return receipt;
    });
  }

  Future<ParsedReceipt> _recognizeWith(
    OcrEngine engine,
    String imagePath,
  ) async {
    final OcrResult ocrResult = await engine.recognize(imagePath);
    if (ocrResult.isEmpty) return ParsedReceipt.empty();
    try {
      return _parser.parse(ocrResult);
    } catch (e) {
      throw ParsingException('Не удалось разобрать текст чека: $e');
    }
  }

  @override
  Future<Result<String?>> pickFromGallery() {
    return guardAsync(() => _galleryDataSource.pickImage());
  }

  @override
  Future<Result<bool>> ensureCameraPermission() {
    return guardAsync(() => _cameraPermissionDataSource.ensureGranted());
  }
}
