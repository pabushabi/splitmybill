/// Регулярные выражения и словари ключевых слов для разбора чека.
abstract final class ReceiptPatterns {
  /// Денежный токен: `450`, `450,00`, `1 234.56`, `450-00`.
  ///
  /// Границы обязательны, иначе `4774,00` разобьётся на `477` и `4,00`.
  static final RegExp money = RegExp(
    r'(?<![\d.,\-])(?:\d{1,3}(?:[ \u00A0]\d{3})+|\d+)(?:[.,\-]\d{1,2})?(?!\d)',
  );

  /// Количество перед ценой: `2 x 350`, `2х350`, `2*350`.
  static final RegExp quantityByPrice = RegExp(
    r'(\d+(?:[.,]\d{1,3})?)\s*[xXхХ*]\s*'
    r'(\d{1,3}(?:[ \u00A0]\d{3})*(?:[.,\-]\d{1,2})?)',
  );

  /// Токен из одних цифр и разделителей.
  static final RegExp numericToken = RegExp(r'^[\d.,\-]*\d[\d.,\-]*$');

  /// Небольшое целое — кандидат в колонку количества.
  static final RegExp countToken = RegExp(r'^\d{1,2}$');

  /// Группа разряда тысяч, оторванная пробелом: `850,00` в `1 850,00`.
  static final RegExp thousandsTail = RegExp(r'^\d{3}(?:[.,\-]\d{1,2})?$');

  static final RegExp thousandsHead = RegExp(r'^\d{1,3}$');

  /// Ведущий порядковый номер позиции: `1. Салат`, `01 Салат`.
  static final RegExp leadingIndex = RegExp(r'^\s*\d{1,2}\s*[.)]\s+');

  /// Единицы измерения рядом с количеством.
  static final RegExp units = RegExp(
    r'\b(шт|кг|г|гр|л|мл|порц|пор)\.?\b',
    caseSensitive: false,
  );

  static final RegExp currency = RegExp(
    r'(₽|руб\.?|р\.|rub|RUB)',
    caseSensitive: false,
  );

  static final RegExp hasLetters = RegExp(r'[A-Za-zА-Яа-яЁё]');

  static final RegExp cyrillic = RegExp(r'[А-Яа-яЁё]');

  static final RegExp digitsOnly = RegExp(r'^[\d\s.,\-]+$');

  static final RegExp multipleSpaces = RegExp(r'[ \t]{2,}');

  static final RegExp date = RegExp(r'\d{2}[./]\d{2}[./]\d{2,4}');

  static final RegExp time = RegExp(r'\b\d{1,2}:\d{2}(:\d{2})?\b');

  static final RegExp phone = RegExp(r'(\+7|8)[\s\-(]*\d{3}[\s\-)]*\d{3}');

  static final RegExp longDigitCode = RegExp(r'\d{9,}');

  /// Итоговая сумма чека.
  static const List<String> totalKeywords = <String>[
    'итог',
    'итого',
    'к оплате',
    'коплате',
    'всего',
    'сумма к оплате',
    'total',
    'amount due',
  ];

  /// Промежуточная сумма — не путать с итогом.
  static const List<String> subtotalKeywords = <String>[
    'подытог',
    'предытог',
    'subtotal',
    'сумма заказа',
  ];

  static const List<String> serviceKeywords = <String>[
    'обслуживание',
    'сервисный сбор',
    'сервис',
    'чаевые',
    'service',
    'tips',
  ];

  static const List<String> discountKeywords = <String>[
    'скидка',
    'дисконт',
    'discount',
  ];

  /// Служебные строки кассового чека и шапки заведения.
  static const List<String> noiseKeywords = <String>[
    'инн',
    'кпп',
    'ккт',
    'фн',
    'фд',
    'фп',
    'фпд',
    'рн ккт',
    'смена',
    'кассир',
    'касса',
    'чек',
    'наличные',
    'наличными',
    'безналичными',
    'безнал',
    'карта',
    'сдача',
    'ндс',
    'без ндс',
    'нал.',
    'оплата',
    'терминал',
    'официант',
    'стол',
    'гостей',
    'заказ',
    'счет',
    'счёт',
    'спасибо',
    'приходите',
    'добро пожаловать',
    'сайт',
    'www',
    'тел',
    'адрес',
    'г.',
    'ул.',
    'сно',
    'осн',
    'усн',
    'номер смены',
    'место расчетов',
    'сайт фнс',
    'qr',
    'предоплата',
    'аванс',
    'зачет',
  ];

  static bool containsAny(String lowerLine, List<String> keywords) {
    for (final String keyword in keywords) {
      if (lowerLine.contains(keyword)) return true;
    }
    return false;
  }
}
