import 'package:test/test.dart';
import '../lib/string_calculator.dart';

void main() {
  late StringCalculator calculator;

  setUp(() {
    calculator = StringCalculator();
  });

  group('String Calculator', () {
    test('empty string returns 0', () {
      expect(calculator.add(''), equals(0));
    });

    test('single number returns the number', () {
      expect(calculator.add('1'), equals(1));
    });

    test('two numbers returns their sum', () {
      expect(calculator.add('1,2'), equals(3));
    });

    test('multiple numbers returns their sum', () {
      expect(calculator.add('1,2,3,4,5'), equals(15));
    });

    test('numbers with newlines returns their sum', () {
      expect(calculator.add('1\n2,3'), equals(6));
    });

    test('custom delimiter returns sum', () {
      expect(calculator.add('//;\n1;2'), equals(3));
    });

    test('negative numbers throw exception with the number', () {
      expect(
        () => calculator.add('-1,2'),
        throwsA(predicate((e) =>
            e is Exception &&
            e.toString() == 'Exception: negative numbers not allowed -1')),
      );
    });

    test('multiple negative numbers include all in exception message', () {
      expect(
        () => calculator.add('-1,-2,3,-4'),
        throwsA(predicate((e) =>
            e is Exception &&
            e.toString() ==
                'Exception: negative numbers not allowed -1,-2,-4')),
      );
    });
  });
}
