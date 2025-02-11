class StringCalculator {
  static const defaultDelimiter = ',';

  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    final parsedInput = _parseInput(numbers);
    final numbersList =
        _extractNumbers(parsedInput.numbers, parsedInput.delimiter);
    _validateNegativeNumbers(numbersList);

    return numbersList.fold(0, (sum, num) => sum + num);
  }

  ({String delimiter, String numbers}) _parseInput(String input) {
    if (!input.startsWith('//')) {
      return (delimiter: defaultDelimiter, numbers: input);
    }

    final delimiterAndNumbers = input.split('\n');
    return (
      delimiter: delimiterAndNumbers[0].substring(2),
      numbers: delimiterAndNumbers[1]
    );
  }

  List<int> _extractNumbers(String numbers, String delimiter) {
    final processedInput = numbers.replaceAll('\n', delimiter);

    return processedInput
        .split(delimiter)
        .where((str) => str.isNotEmpty)
        .map(int.parse)
        .toList();
  }

  void _validateNegativeNumbers(List<int> numbers) {
    final negativeNumbers = numbers.where((num) => num < 0).toList();
    if (negativeNumbers.isNotEmpty) {
      throw Exception(
          'negative numbers not allowed ${negativeNumbers.join(',')}');
    }
  }
}
