/// Пути и имена маршрутов.
abstract final class AppRoutes {
  static const String home = '/';
  static const String homeName = 'home';

  static const String guests = '/guests';
  static const String guestsName = 'guests';

  static const String capture = '/capture';
  static const String captureName = 'capture';

  static const String crop = '/capture/crop';
  static const String cropName = 'crop';

  static const String review = '/review';
  static const String reviewName = 'review';

  static const String split = '/split';
  static const String splitName = 'split';

  static const String summary = '/split/summary';
  static const String summaryName = 'summary';

  static const String history = '/history';
  static const String historyName = 'history';

  static const String historyDetail = '/history/:billId';
  static const String historyDetailName = 'historyDetail';

  static String historyDetailPath(String billId) => '/history/$billId';
}
