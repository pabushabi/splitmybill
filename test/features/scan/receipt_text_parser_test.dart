import 'package:flutter_test/flutter_test.dart';
import 'package:splitmybill/features/scan/data/parser/line_classifier.dart';
import 'package:splitmybill/features/scan/data/parser/receipt_line_kind.dart';
import 'package:splitmybill/features/scan/data/parser/receipt_line_normalizer.dart';
import 'package:splitmybill/features/scan/data/parser/receipt_text_parser.dart';
import 'package:splitmybill/features/scan/domain/entities/ocr_result.dart';
import 'package:splitmybill/features/scan/domain/entities/parsed_item.dart';
import 'package:splitmybill/features/scan/domain/entities/parsed_receipt.dart';

void main() {
  const ReceiptTextParser parser = ReceiptTextParser(
    ReceiptLineNormalizer(),
    LineClassifier(),
  );

  ParsedReceipt parse(String text) =>
      parser.parse(OcrResult.fromPlainText(text, engineId: 'test'));

  ParsedItem itemNamed(ParsedReceipt receipt, String namePart) {
    return receipt.items.firstWhere(
      (ParsedItem item) =>
          item.title.toLowerCase().contains(namePart.toLowerCase()),
      orElse: () => throw StateError(
        'Позиция "$namePart" не найдена среди '
        '${receipt.items.map((ParsedItem i) => i.title).toList()}',
      ),
    );
  }

  group('Классификация строк', () {
    const LineClassifier classifier = LineClassifier();

    test('итог распознаётся по ключевому слову', () {
      expect(classifier.classify('ИТОГО  4150.00'), ReceiptLineKind.total);
      expect(classifier.classify('К ОПЛАТЕ 4150'), ReceiptLineKind.total);
    });

    test('подытог не путается с итогом', () {
      expect(
        classifier.classify('ПОДЫТОГ  3800.00'),
        ReceiptLineKind.subtotal,
      );
    });

    test('сервисный сбор и скидка', () {
      expect(
        classifier.classify('Обслуживание 10%  380.00'),
        ReceiptLineKind.service,
      );
      expect(classifier.classify('Скидка  -200.00'), ReceiptLineKind.discount);
    });

    test('реквизиты и служебные строки — шум', () {
      expect(classifier.classify('ИНН 7701234567'), ReceiptLineKind.noise);
      expect(classifier.classify('Кассир: Иванова А.'), ReceiptLineKind.noise);
      expect(classifier.classify('24.08.2026 19:42'), ReceiptLineKind.noise);
      expect(classifier.classify('СПАСИБО ЗА ВИЗИТ'), ReceiptLineKind.noise);
    });

    test('строка без цены не является позицией', () {
      expect(classifier.classify('Салат Цезарь'), ReceiptLineKind.noise);
    });
  });

  group('Разбор позиций', () {
    test('простая строка «название — цена»', () {
      final ParsedReceipt receipt = parse('Салат Цезарь  450,00');
      final ParsedItem item = receipt.items.single;

      expect(item.title, 'Салат Цезарь');
      expect(item.quantity, 1);
      expect(item.unitPriceMinor, 45000);
      expect(item.totalMinor, 45000);
    });

    test('количество через x, цена за штуку и сумма', () {
      final ParsedReceipt receipt = parse('Борщ  2 x 350,00  700,00');
      final ParsedItem item = receipt.items.single;

      expect(item.quantity, 2);
      expect(item.unitPriceMinor, 35000);
      expect(item.totalMinor, 70000);
    });

    test('русская «х» в качестве знака умножения', () {
      final ParsedItem item = parse('Морс 3х120,00 360,00').items.single;

      expect(item.quantity, 3);
      expect(item.totalMinor, 36000);
    });

    test('три числа подряд читаются как количество, цена и сумма', () {
      final ParsedItem item = parse('Пельмени  2  320,00  640,00').items.single;

      expect(item.quantity, 2);
      expect(item.unitPriceMinor, 32000);
      expect(item.totalMinor, 64000);
    });

    test('колонки цена / количество шт / сумма не попадают в название', () {
      final ParsedItem item = parse(
        'Лимонад Мохито безалкогольный 300мл  390,00  1,00шт  390,00',
      ).items.single;

      expect(item.title.toLowerCase(), contains('лимонад'));
      expect(item.title, contains('300мл'));
      expect(item.title.toLowerCase(), isNot(contains('шт')));
      expect(item.title, isNot(contains('1,00')));
      expect(item.title, isNot(contains('390')));
      expect(item.quantity, 1);
      expect(item.unitPriceMinor, 39000);
      expect(item.totalMinor, 39000);
    });

    test('OCR-мусор вместо шт не попадает в название', () {
      const List<String> suffixes = <String>['щт', 'wr', 'uwt', 'uwr'];
      for (final String suffix in suffixes) {
        for (final String column in <String>['1,00$suffix', '1,00 $suffix']) {
          final ParsedItem item = parse(
            'Лимонад Мохито безалкогольный 300мл  390,00  $column  390,00',
          ).items.single;

          expect(item.title.toLowerCase(), contains('лимонад'), reason: column);
          expect(item.title, contains('300мл'), reason: column);
          expect(
            item.title.toLowerCase(),
            isNot(contains(suffix)),
            reason: column,
          );
          expect(item.title, isNot(contains('1,00')), reason: column);
          expect(item.title, isNot(contains('390')), reason: column);
          expect(item.quantity, 1, reason: column);
          expect(item.unitPriceMinor, 39000, reason: column);
          expect(item.totalMinor, 39000, reason: column);
        }
      }
    });

    test('слова вроде «2 сыра» не вырезаются как количество', () {
      final ParsedItem item = parse('Пицца 2 сыра  590,00').items.single;

      expect(item.title.toLowerCase(), contains('сыра'));
      expect(item.quantity, 1);
      expect(item.totalMinor, 59000);
    });

    test('объём в названии не принимается за цену', () {
      final ParsedItem item = parse('Кока-кола 0,5 л  250,00').items.single;

      expect(item.title, contains('Кока-кола'));
      expect(item.title, contains('0,5'));
      expect(item.totalMinor, 25000);
      expect(item.quantity, 1);
    });

    test('количество с пробелом перед шт тоже вырезается', () {
      final ParsedItem item = parse(
        'Ролл Калифорния  350,00  1,00 шт  350,00',
      ).items.single;

      expect(item.title.toLowerCase(), contains('калифорния'));
      expect(item.title.toLowerCase(), isNot(contains('шт')));
      expect(item.quantity, 1);
      expect(item.totalMinor, 35000);
    });

    test('2,00шт даёт количество 2, последняя сумма — итог строки', () {
      final ParsedItem item = parse(
        'Ролл Филадельфия  450,00  2,00шт  900,00',
      ).items.single;

      expect(item.title.toLowerCase(), contains('филадельфия'));
      expect(item.title.toLowerCase(), isNot(contains('шт')));
      expect(item.quantity, 2);
      expect(item.unitPriceMinor, 45000);
      expect(item.totalMinor, 90000);
    });

    test('перенос названия вставляется перед колонками цены', () {
      final ParsedItem item = parse(
        'Темпура ролл с  750,00  1,00шт  750,00\n'
        'лососем и тунцом',
      ).items.single;

      expect(item.title.toLowerCase(), contains('темпура'));
      expect(item.title.toLowerCase(), contains('лососем'));
      expect(item.title.toLowerCase(), contains('тунцом'));
      expect(item.title.toLowerCase(), isNot(contains('шт')));
      expect(item.quantity, 1);
      expect(item.totalMinor, 75000);
    });

    test('порядковый номер позиции отбрасывается', () {
      final ParsedItem item = parse('1. Том ям  690,00').items.single;

      expect(item.title, 'Том ям');
      expect(item.totalMinor, 69000);
    });

    test('разделитель тысяч не ломает сумму', () {
      final ParsedItem item = parse('Стейк рибай  1 850,00').items.single;

      expect(item.totalMinor, 185000);
    });

    test('копейки через дефис', () {
      expect(parse('Чай  180-00').items.single.totalMinor, 18000);
    });

    test('буквы внутри числа исправляются', () {
      expect(parse('Латте  25O,OO').items.single.totalMinor, 25000);
    });

    test('капс приводится к обычному регистру', () {
      expect(parse('ПАСТА КАРБОНАРА  520,00').items.single.title,
          'Паста карбонара');
    });

    test('перенос строки склеивается с ценой', () {
      final ParsedReceipt receipt = parse(
        'Салат с креветками и авокадо\n'
        '  620,00',
      );

      expect(receipt.items.single.totalMinor, 62000);
      expect(receipt.items.single.title, contains('креветками'));
    });

    test('нечитаемое название помечается и заменяется заглушкой', () {
      final ParsedItem item = parse('Гк  450,00').items.single;

      expect(item.hasSuspiciousTitle, isTrue);
      expect(item.title, 'Позиция 1');
      expect(item.totalMinor, 45000);
    });

    test('строка из одной цены не считается позицией', () {
      expect(parse('  450,00').isEmpty, isTrue);
    });
  });

  group('Целый чек', () {
    const String receiptText = '''
Кафе Веранда
ИНН 7701234567
Чек № 1024   24.08.2026 19:42
Официант: Мария
--------------------------------
1. Салат Цезарь           450,00
2. Борщ            2 x 350,00  700,00
3. Стейк рибай          1 850,00
4. Плато сыров            980,00
5. Лимонад домашняя  3х120,00  360,00
--------------------------------
ПОДЫТОГ                  4340,00
Обслуживание 10%          434,00
ИТОГО                    4774,00
НАЛИЧНЫМИ                5000,00
СДАЧА                     226,00
СПАСИБО ЗА ВИЗИТ
''';

    test('находит все пять позиций', () {
      final ParsedReceipt receipt = parse(receiptText);

      expect(receipt.items.length, 5);
      expect(itemNamed(receipt, 'цезарь').totalMinor, 45000);
      expect(itemNamed(receipt, 'борщ').quantity, 2);
      expect(itemNamed(receipt, 'рибай').totalMinor, 185000);
      expect(itemNamed(receipt, 'сыров').totalMinor, 98000);
      expect(itemNamed(receipt, 'лимонад').quantity, 3);
    });

    test('берёт итог, сервисный сбор и название заведения', () {
      final ParsedReceipt receipt = parse(receiptText);

      expect(receipt.totalMinor, 477400);
      expect(receipt.serviceChargeMinor, 43400);
      expect(receipt.placeName, 'Кафе Веранда');
    });

    test('расхождение с итогом видно, когда есть сервисный сбор', () {
      final ParsedReceipt receipt = parse(receiptText);

      expect(receipt.itemsTotalMinor, 434000);
      expect(receipt.hasTotalMismatch, isTrue);
      expect(receipt.mismatchMinor, 434000 - 477400);
    });

    test('служебные строки не попадают в позиции', () {
      final ParsedReceipt receipt = parse(receiptText);

      final Iterable<String> titles = receipt.items.map(
        (ParsedItem i) => i.title.toLowerCase(),
      );
      expect(titles.any((String t) => t.contains('сдача')), isFalse);
      expect(titles.any((String t) => t.contains('наличн')), isFalse);
      expect(titles.any((String t) => t.contains('инн')), isFalse);
    });

    test('сумма позиций совпадает с подытогом чека', () {
      final ParsedReceipt receipt = parse(receiptText);

      expect(receipt.itemsTotalMinor, 434000);
    });
  });

  group('Пограничные случаи', () {
    test('пустой текст даёт пустой чек', () {
      final ParsedReceipt receipt = parse('');

      expect(receipt.isEmpty, isTrue);
      expect(receipt.hasTotalMismatch, isFalse);
    });

    test('текст без цен не даёт позиций', () {
      expect(parse('СПАСИБО ЗА ПОКУПКУ\nПРИХОДИТЕ ЕЩЁ').isEmpty, isTrue);
    });

    test('нулевая цена отбрасывается', () {
      expect(parse('Хлеб  0,00').isEmpty, isTrue);
    });
  });
}
