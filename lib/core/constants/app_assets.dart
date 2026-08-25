/// Пути к ассетам.
abstract final class AppAssets {
  static const String tessdataDir = 'assets/tessdata';
  static const String tessdataConfig = 'assets/tessdata_config.json';

  static const String tessRussian = 'rus';
  static const String tessEnglish = 'eng';

  /// Языки, передаваемые в Tesseract: русский с латинским добором.
  static const String tessLanguages = '$tessRussian+$tessEnglish';
}
