import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:splitmybill/features/scan/data/parser/line_classifier.dart';
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

  ParsedReceipt parseFile(String name) {
    final String text = File(
      'test/features/scan/parser/fixtures/$name',
    ).readAsStringSync();
    return parser.parse(OcrResult.fromPlainText(text, engineId: 'test'));
  }

  test('фикстура кафе Веранда разбирается целиком', () {
    final ParsedReceipt receipt = parseFile('cafe_veranda.txt');

    expect(receipt.items.length, 5);
    expect(receipt.placeName, 'Кафе Веранда');
    expect(receipt.totalMinor, 477400);
    expect(receipt.itemsTotalMinor, 434000);
    expect(receipt.hasTotalMismatch, isTrue);
    expect(
      receipt.items.any((ParsedItem i) => i.title.toLowerCase().contains('цезарь')),
      isTrue,
    );
    expect(
      receipt.items.any((ParsedItem i) => i.title.toLowerCase().contains('борщ')),
      isTrue,
    );
    expect(
      receipt.items.any((ParsedItem i) => i.title.toLowerCase().contains('рибай')),
      isTrue,
    );
  });

  test('простой чек из двух позиций без расхождения', () {
    final ParsedReceipt receipt = parseFile('simple_two_items.txt');

    expect(receipt.items.length, 2);
    expect(receipt.itemsTotalMinor, 131000);
    expect(receipt.totalMinor, 131000);
    expect(receipt.hasTotalMismatch, isFalse);
  });

  test('колонки цены и 1,00шт на фискальном чеке', () {
    final ParsedReceipt receipt = parseFile('sushi_columns.txt');

    expect(receipt.items.length, 7);
    expect(receipt.placeName, 'Суши-бар Сакура');
    expect(receipt.totalMinor, 329000);
    expect(receipt.itemsTotalMinor, 329000);

    final ParsedItem lemonade = receipt.items.firstWhere(
      (ParsedItem item) => item.title.toLowerCase().contains('лимонад'),
    );
    expect(lemonade.title, contains('300мл'));
    expect(lemonade.title.toLowerCase(), isNot(contains('шт')));
    expect(lemonade.quantity, 1);
    expect(lemonade.totalMinor, 39000);

    final ParsedItem wrapped = receipt.items.firstWhere(
      (ParsedItem item) => item.title.toLowerCase().contains('лососем'),
    );
    expect(wrapped.title.toLowerCase(), contains('темпура'));
    expect(wrapped.totalMinor, 75000);

    final ParsedItem philadelphia = receipt.items.firstWhere(
      (ParsedItem item) => item.title.toLowerCase().contains('филадельфия'),
    );
    expect(philadelphia.quantity, 2);
    expect(philadelphia.unitPriceMinor, 45000);
    expect(philadelphia.totalMinor, 90000);

    expect(
      receipt.items.any(
        (ParsedItem item) => item.title.toLowerCase().contains('тарелка'),
      ),
      isFalse,
    );
  });
}
