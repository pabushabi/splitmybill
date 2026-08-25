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

  /// Количество с коротким суффиксом: `1,00шт`, `1,00uwt`, `2 шт`.
  ///
  /// Объём в названии (`300мл`, `0,5 л`) отсекается в [isQuantityColumnMatch].
  static final RegExp quantityWithUnit = RegExp(
    r'(?<![\d])(\d+(?:[.,]\d{1,3})?)\s*([A-Za-zА-Яа-яЁё]{1,4})\.?(?![A-Za-zА-Яа-яЁё])',
    caseSensitive: false,
  );

  static final RegExp _volumeSuffix = RegExp(
    r'^(мл|л|кг|г|гр|см|мм|ml|cl|l|kg|g|cm)\.?$',
    caseSensitive: false,
  );

  static final RegExp _knownCountSuffix = RegExp(
    r'^(шт|щт|порц|пор|pcs|pc|sht)\.?$',
    caseSensitive: false,
  );

  /// Буквы, в которые OCR чаще всего превращает «шт».
  static final RegExp _ocrPieceLetters = RegExp(
    r'^[штщwurtmnиhspyv]+$',
    caseSensitive: false,
  );

  static bool isVolumeSuffix(String suffix) =>
      _volumeSuffix.hasMatch(suffix.trim());

  /// Суффикс колонки количества, включая OCR-мусор вместо «шт».
  static bool looksLikePieceUnit(String suffix) {
    final String trimmed = suffix.trim();
    if (trimmed.isEmpty) return false;
    if (isVolumeSuffix(trimmed)) return false;
    if (_knownCountSuffix.hasMatch(trimmed)) return true;
    if (trimmed.length < 2 || trimmed.length > 4) return false;
    return _ocrPieceLetters.hasMatch(trimmed.replaceAll('.', ''));
  }

  static bool isQuantityColumnMatch(RegExpMatch match) {
    final String? suffix = match.group(2);
    if (suffix == null) return false;
    return looksLikePieceUnit(suffix);
  }

  static Iterable<RegExpMatch> quantityColumnMatches(String line) {
    return quantityWithUnit.allMatches(line).where(isQuantityColumnMatch);
  }

  static String stripQuantityColumns(String line) {
    final List<RegExpMatch> matches = quantityColumnMatches(line).toList();
    if (matches.isEmpty) return line;

    final StringBuffer buffer = StringBuffer();
    int last = 0;
    for (final RegExpMatch match in matches) {
      buffer.write(line.substring(last, match.start));
      buffer.write(' ');
      last = match.end;
    }
    buffer.write(line.substring(last));
    return buffer.toString();
  }

  static bool isQuantityUnitOnly(String token) => looksLikePieceUnit(token);

  static bool isQuantityToken(String token) {
    if (isQuantityUnitOnly(token)) return true;
    final RegExpMatch? match = quantityWithUnit.firstMatch(token);
    if (match == null || match.start != 0 || match.end != token.length) {
      return false;
    }
    return isQuantityColumnMatch(match);
  }

  /// Токен из одних цифр и разделителей.
  static final RegExp numericToken = RegExp(r'^[\d.,\-]*\d[\d.,\-]*$');

  /// Числовой токен хвоста или количество с единицей / OCR-мусором.
  static bool isAmountOrQuantityToken(String token) {
    if (numericToken.hasMatch(token)) return true;
    return isQuantityToken(token);
  }

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
