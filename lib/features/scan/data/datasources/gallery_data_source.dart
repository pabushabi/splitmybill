import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import 'package:splitmybill/core/error/exceptions.dart';

abstract interface class GalleryDataSource {
  Future<String?> pickImage();
}

@LazySingleton(as: GalleryDataSource)
class ImagePickerGalleryDataSource implements GalleryDataSource {
  const ImagePickerGalleryDataSource(this._picker);

  final ImagePicker _picker;

  @override
  Future<String?> pickImage() async {
    try {
      final XFile? file = await _picker.pickImage(
        source: ImageSource.gallery,
        // Чек мельче 2000 px по ширине распознаётся заметно хуже.
        maxWidth: 2400,
        imageQuality: 95,
      );
      return file?.path;
    } catch (e) {
      throw CameraException('Не удалось открыть галерею: $e');
    }
  }
}
