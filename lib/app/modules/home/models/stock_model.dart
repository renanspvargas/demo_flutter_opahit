import 'dart:convert';
import 'package:intl/intl.dart';

class StockModel {
  final String name;
  final String code;
  final List<StockVariationModel> variation;

  StockModel({
    required this.name,
    required this.code,
    required this.variation,
  });

  factory StockModel.fromMap(Map<String, dynamic> map) {
    final variationList = <StockVariationModel>[];

    final name = map['name'] as String;
    final code = map['code'] as String;
    var variationJsonList = map['variation'] as List;

    variationJsonList.sort((a, b) {
      var adate = a['date'];
      var bdate = b['date'];
      return adate.compareTo(bdate);
    });

    variationJsonList = variationJsonList.take(30).toList();

    variationJsonList.asMap().forEach((index, stockVariation) {
      final day = index + 1;
      final value = variationJsonList[index]['value'];
      final date = variationJsonList[index]['date'];

      double previusValue = 0;
      double firstDayValue = 0;

      if (index > 0) {
        previusValue = variationJsonList[index - 1]['value'];
        firstDayValue = variationJsonList[0]['value'];
      }

      variationList.add(StockVariationModel(
        day: day,
        value: value,
        date: DateTime.parse(date),
        previousValue: previusValue,
        firstDayValue: firstDayValue,
      ));
    });

    return StockModel(
      name: name,
      code: code,
      variation: variationList,
    );
  }

  factory StockModel.fromJson(String source) =>
      StockModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class StockVariationModel {
  final double value;
  final DateTime date;
  final int day;
  final double _previousValue;
  final double _firstDayValue;

  StockVariationModel({
    required this.value,
    required this.date,
    required this.day,
    required double previousValue,
    required double firstDayValue,
  })  : _previousValue = previousValue,
        _firstDayValue = firstDayValue;

  String get dayAsString => day.toString();

  String get formattedDate {
    return DateFormat('dd/MM/yy').format(date);
  }

  String get formattedValue => 'R\$ ${value.toStringAsFixed(2)}';

  String get formattedFirstDayVariation => _calculateVariation(_firstDayValue);

  String get formattedD1Variation => _calculateVariation(_previousValue);

  String _calculateVariation(double previousValue) {
    if (previousValue == 0) return '-';

    final result = ((value - previousValue) / previousValue) * 100;
    return '${result.toStringAsFixed(2)}%';
  }
}
