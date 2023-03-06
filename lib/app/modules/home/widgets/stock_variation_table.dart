import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_investor/app/modules/home/models/stock_model.dart';
import 'package:lucky_investor/app/modules/home/widgets/stock_table_text.dart';

class StockVariationTable extends StatelessWidget {
  final StockModel stock;

  final _tableColumsTitle = [
    'Dia',
    'Data',
    'Valor',
    'Variação em relaçào a D-1',
    'Variação em relação a primeira data'
  ];

  StockVariationTable({
    required this.stock,
    Key? key,
  }) : super(key: key);

  List<DataColumn> _getColums(BuildContext context) {
    return _tableColumsTitle
        .map(
          (e) => DataColumn(
            label: SizedBox(
              width: context.width * 0.18,
              child: StockTableText(e, fontWeight: FontWeight.bold),
            ),
          ),
        )
        .toList();
  }

  List<DataRow> get _rows {
    return stock.variation.map((value) {
      return DataRow(cells: [
        DataCell(StockTableText(value.dayAsString)),
        DataCell(StockTableText(value.formattedDate)),
        DataCell(StockTableText(value.formattedValue)),
        DataCell(StockTableText(value.formattedD1Variation)),
        DataCell(StockTableText(value.formattedFirstDayVariation)),
      ]);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      border: TableBorder.all(),
      headingRowHeight: 100,
      horizontalMargin: 0,
      columnSpacing: 0,
      columns: _getColums(context),
      rows: _rows,
    );
  }
}
