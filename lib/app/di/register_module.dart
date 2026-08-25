import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:hive_ce/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../core/storage/hive_boxes.dart';

/// Регистрация сторонних зависимостей, которые нельзя пометить аннотацией.
@module
abstract class RegisterModule {
  @preResolve
  @Named(HiveBoxes.guests)
  Future<Box<String>> get guestsBox => Hive.openBox<String>(HiveBoxes.guests);

  @preResolve
  @Named(HiveBoxes.bills)
  Future<Box<String>> get billsBox => Hive.openBox<String>(HiveBoxes.bills);

  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @lazySingleton
  Uuid get uuid => const Uuid();

  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();

  /// Латинская модель ML Kit: кириллицу она не читает, но уверенно берёт
  /// цифры и раскладку колонок, поэтому используется как быстрый запасной путь.
  @lazySingleton
  TextRecognizer get textRecognizer =>
      TextRecognizer(script: TextRecognitionScript.latin);
}
