// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart'
    as _i612;
import 'package:hive_ce/hive.dart' as _i738;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:uuid/uuid.dart' as _i706;

import '../../features/bill/data/datasources/bills_local_data_source.dart'
    as _i702;
import '../../features/bill/data/repositories/bills_repository_impl.dart'
    as _i1034;
import '../../features/bill/domain/repositories/bills_repository.dart' as _i148;
import '../../features/bill/domain/usecases/calculate_bill_totals.dart'
    as _i573;
import '../../features/bill/domain/usecases/calculate_shares.dart' as _i662;
import '../../features/bill/domain/usecases/delete_bill.dart' as _i364;
import '../../features/bill/domain/usecases/get_bill_history.dart' as _i551;
import '../../features/bill/domain/usecases/save_bill.dart' as _i712;
import '../../features/bill/presentation/cubit/history_cubit.dart' as _i132;
import '../../features/bill/presentation/cubit/split_cubit.dart' as _i1071;
import '../../features/guests/data/datasources/guests_local_data_source.dart'
    as _i616;
import '../../features/guests/data/repositories/guests_repository_impl.dart'
    as _i899;
import '../../features/guests/domain/repositories/guests_repository.dart'
    as _i151;
import '../../features/guests/domain/usecases/delete_guest.dart' as _i135;
import '../../features/guests/domain/usecases/generate_default_guests.dart'
    as _i334;
import '../../features/guests/domain/usecases/get_saved_guests.dart' as _i522;
import '../../features/guests/domain/usecases/save_guest.dart' as _i290;
import '../../features/guests/presentation/cubit/guests_cubit.dart' as _i418;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../../features/scan/data/datasources/camera_permission_data_source.dart'
    as _i188;
import '../../features/scan/data/datasources/gallery_data_source.dart' as _i114;
import '../../features/scan/data/ocr/image_preprocessor.dart' as _i13;
import '../../features/scan/data/ocr/mlkit_ocr_engine.dart' as _i796;
import '../../features/scan/data/ocr/tesseract_ocr_engine.dart' as _i12;
import '../../features/scan/data/parser/line_classifier.dart' as _i696;
import '../../features/scan/data/parser/receipt_line_normalizer.dart' as _i989;
import '../../features/scan/data/parser/receipt_text_parser.dart' as _i111;
import '../../features/scan/data/repositories/receipt_scan_repository_impl.dart'
    as _i350;
import '../../features/scan/domain/repositories/receipt_scan_repository.dart'
    as _i758;
import '../../features/scan/domain/services/ocr_engine.dart' as _i431;
import '../../features/scan/domain/services/receipt_parser.dart' as _i2;
import '../../features/scan/domain/usecases/pick_receipt_image.dart' as _i701;
import '../../features/scan/domain/usecases/recognize_receipt.dart' as _i83;
import '../../features/scan/presentation/cubit/capture_cubit.dart' as _i568;
import '../../features/scan/presentation/cubit/review_cubit.dart' as _i517;
import '../router/app_router.dart' as _i81;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i706.Uuid>(() => registerModule.uuid);
    gh.lazySingleton<_i183.ImagePicker>(() => registerModule.imagePicker);
    gh.lazySingleton<_i612.TextRecognizer>(() => registerModule.textRecognizer);
    gh.lazySingleton<_i81.AppRouter>(() => _i81.AppRouter());
    gh.lazySingleton<_i573.CalculateBillTotals>(
      () => const _i573.CalculateBillTotals(),
    );
    gh.lazySingleton<_i662.CalculateShares>(
      () => const _i662.CalculateShares(),
    );
    gh.lazySingleton<_i13.ImagePreprocessor>(
      () => const _i13.ImagePreprocessor(),
    );
    gh.lazySingleton<_i696.LineClassifier>(() => const _i696.LineClassifier());
    gh.lazySingleton<_i989.ReceiptLineNormalizer>(
      () => const _i989.ReceiptLineNormalizer(),
    );
    await gh.factoryAsync<_i738.Box<String>>(
      () => registerModule.guestsBox,
      instanceName: 'guests_box',
      preResolve: true,
    );
    gh.lazySingleton<_i188.CameraPermissionDataSource>(
      () => const _i188.PermissionHandlerCameraDataSource(),
    );
    gh.factory<_i517.ReviewCubit>(() => _i517.ReviewCubit(gh<_i706.Uuid>()));
    gh.lazySingleton<_i334.GenerateDefaultGuests>(
      () => _i334.GenerateDefaultGuests(gh<_i706.Uuid>()),
    );
    gh.lazySingleton<_i431.OcrEngine>(
      () => _i796.MlKitOcrEngine(
        gh<_i612.TextRecognizer>(),
        gh<_i13.ImagePreprocessor>(),
      ),
      instanceName: 'mlkit',
    );
    gh.factory<_i9.HomeCubit>(
      () => _i9.HomeCubit(gh<_i334.GenerateDefaultGuests>()),
    );
    await gh.factoryAsync<_i738.Box<String>>(
      () => registerModule.billsBox,
      instanceName: 'bills_box',
      preResolve: true,
    );
    gh.lazySingleton<_i616.GuestsLocalDataSource>(
      () => _i616.HiveGuestsLocalDataSource(
        gh<_i738.Box<String>>(instanceName: 'guests_box'),
      ),
    );
    gh.lazySingleton<_i114.GalleryDataSource>(
      () => _i114.ImagePickerGalleryDataSource(gh<_i183.ImagePicker>()),
    );
    gh.lazySingleton<_i2.ReceiptParser>(
      () => _i111.ReceiptTextParser(
        gh<_i989.ReceiptLineNormalizer>(),
        gh<_i696.LineClassifier>(),
      ),
    );
    gh.lazySingleton<_i431.OcrEngine>(
      () => _i12.TesseractOcrEngine(gh<_i13.ImagePreprocessor>()),
      instanceName: 'tesseract',
    );
    gh.lazySingleton<_i151.GuestsRepository>(
      () => _i899.GuestsRepositoryImpl(gh<_i616.GuestsLocalDataSource>()),
    );
    gh.lazySingleton<_i702.BillsLocalDataSource>(
      () => _i702.HiveBillsLocalDataSource(
        gh<_i738.Box<String>>(instanceName: 'bills_box'),
      ),
    );
    gh.lazySingleton<_i148.BillsRepository>(
      () => _i1034.BillsRepositoryImpl(gh<_i702.BillsLocalDataSource>()),
    );
    gh.lazySingleton<_i758.ReceiptScanRepository>(
      () => _i350.ReceiptScanRepositoryImpl(
        gh<_i431.OcrEngine>(instanceName: 'tesseract'),
        gh<_i431.OcrEngine>(instanceName: 'mlkit'),
        gh<_i2.ReceiptParser>(),
        gh<_i114.GalleryDataSource>(),
        gh<_i188.CameraPermissionDataSource>(),
      ),
    );
    gh.lazySingleton<_i135.DeleteGuest>(
      () => _i135.DeleteGuest(gh<_i151.GuestsRepository>()),
    );
    gh.lazySingleton<_i522.GetSavedGuests>(
      () => _i522.GetSavedGuests(gh<_i151.GuestsRepository>()),
    );
    gh.lazySingleton<_i290.SaveGuest>(
      () => _i290.SaveGuest(gh<_i151.GuestsRepository>()),
    );
    gh.lazySingleton<_i364.DeleteBill>(
      () => _i364.DeleteBill(gh<_i148.BillsRepository>()),
    );
    gh.lazySingleton<_i551.GetBillHistory>(
      () => _i551.GetBillHistory(gh<_i148.BillsRepository>()),
    );
    gh.lazySingleton<_i712.SaveBill>(
      () => _i712.SaveBill(gh<_i148.BillsRepository>()),
    );
    gh.factory<_i132.HistoryCubit>(
      () => _i132.HistoryCubit(
        gh<_i551.GetBillHistory>(),
        gh<_i364.DeleteBill>(),
        gh<_i662.CalculateShares>(),
      ),
    );
    gh.lazySingleton<_i1071.SplitCubit>(
      () => _i1071.SplitCubit(
        gh<_i662.CalculateShares>(),
        gh<_i712.SaveBill>(),
        gh<_i706.Uuid>(),
        gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i701.PickReceiptImage>(
      () => _i701.PickReceiptImage(gh<_i758.ReceiptScanRepository>()),
    );
    gh.lazySingleton<_i83.RecognizeReceipt>(
      () => _i83.RecognizeReceipt(gh<_i758.ReceiptScanRepository>()),
    );
    gh.factory<_i568.CaptureCubit>(
      () => _i568.CaptureCubit(
        gh<_i758.ReceiptScanRepository>(),
        gh<_i701.PickReceiptImage>(),
        gh<_i83.RecognizeReceipt>(),
        gh<_i188.CameraPermissionDataSource>(),
      ),
    );
    gh.lazySingleton<_i418.GuestsCubit>(
      () => _i418.GuestsCubit(
        gh<_i522.GetSavedGuests>(),
        gh<_i290.SaveGuest>(),
        gh<_i135.DeleteGuest>(),
        gh<_i706.Uuid>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
