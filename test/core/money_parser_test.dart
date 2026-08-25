import 'package:flutter_test/flutter_test.dart';
import 'package:splitmybill/core/utils/money_formatter.dart';
import 'package:splitmybill/core/utils/money_parser.dart';

void main() {
  group('MoneyParser.parse', () {
    test('целое число рублей', () {
      expect(MoneyParser.parse('450'), 45000);
    });

    test('запятая как десятичный разделитель', () {
      expect(MoneyParser.parse('450,50'), 45050);
    });

    test('точка как десятичный разделитель', () {
      expect(MoneyParser.parse('450.05'), 45005);
    });

    test('дефис вместо копеек, как в кассовых чеках', () {
      expect(MoneyParser.parse('450-00'), 45000);
    });

    test('пробел как разделитель тысяч', () {
      expect(MoneyParser.parse('1 234,56'), 123456);
      expect(MoneyParser.parse('1\u00A0234,56'), 123456);
    });

    test('точка как разделитель тысяч', () {
      expect(MoneyParser.parse('1.234,56'), 123456);
      expect(MoneyParser.parse('1.234'), 123400);
    });

    test('запятая как разделитель тысяч', () {
      expect(MoneyParser.parse('1,234.56'), 123456);
    });

    test('одна цифра после разделителя — это десятые', () {
      expect(MoneyParser.parse('450,5'), 45050);
    });

    test('символ валюты и лишние пробелы игнорируются', () {
      expect(MoneyParser.parse(' 1 250,00 ₽ '), 125000);
      expect(MoneyParser.parse('350 руб.'), 35000);
    });

    test('отрицательная сумма для скидок', () {
      expect(MoneyParser.parse('-100,50'), -10050);
    });

    test('мусор не разбирается', () {
      expect(MoneyParser.parse(''), isNull);
      expect(MoneyParser.parse('   '), isNull);
      expect(MoneyParser.parse('Салат Цезарь'), isNull);
      expect(MoneyParser.parse(null), isNull);
    });
  });

  group('MoneyParser.parseQuantity', () {
    test('целое количество', () {
      expect(MoneyParser.parseQuantity('2'), 2);
    });

    test('весовая позиция считается одной порцией', () {
      expect(MoneyParser.parseQuantity('0,250'), 1);
    });

    test('дробное количество округляется', () {
      expect(MoneyParser.parseQuantity('1,5'), 2);
    });

    test('ноль и мусор не разбираются', () {
      expect(MoneyParser.parseQuantity('0'), isNull);
      expect(MoneyParser.parseQuantity('шт'), isNull);
    });
  });

  group('MoneyFormatter', () {
    test('целые суммы показываются без копеек', () {
      expect(MoneyFormatter.format(125000, withSymbol: false), '1 250');
    });

    test('копейки показываются, если они есть', () {
      expect(MoneyFormatter.format(125050, withSymbol: false), '1 250,50');
    });

    test('символ валюты добавляется по умолчанию', () {
      expect(MoneyFormatter.format(45000), contains('₽'));
    });

    test('значение для поля ввода без разделителей тысяч', () {
      expect(MoneyFormatter.toInput(125000), '1250');
      expect(MoneyFormatter.toInput(125050), '1250,50');
    });

    test('форматирование и разбор дают исходное значение', () {
      for (final int amount in <int>[0, 1, 99, 45000, 123456, 9999999]) {
        final String formatted = MoneyFormatter.format(
          amount,
          withSymbol: false,
        );
        expect(MoneyParser.parse(formatted), amount, reason: formatted);
      }
    });
  });
}
