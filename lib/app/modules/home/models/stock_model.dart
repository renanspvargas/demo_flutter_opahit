class StockModel {
  final String name;
  final String code;
  final List<StockVariationModel> variation;

  StockModel({
    required this.name,
    required this.code,
    required this.variation,
  });
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
}
