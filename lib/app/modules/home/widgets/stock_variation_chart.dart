import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lucky_investor/app/modules/home/models/stock_model.dart';

class StockVariationChart extends StatelessWidget {
  final StockModel stock;

  const StockVariationChart({
    required this.stock,
    Key? key,
  }) : super(key: key);

  List<FlSpot> get _chartSpots {
    return stock.variation.map((e) {
      return FlSpot(e.day.toDouble(), e.value);
    }).toList();
  }

  _getDate(int index) {
    return stock.variation[index].formattedDate;
  }

  _getFormatterdValue(int index) {
    return stock.variation[index].formattedValue;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          minX: 1,
          maxX: stock.variation.length.toDouble(),
          minY: (stock.variation.map((e) => e.value).reduce(min) - 1)
              .roundToDouble(),
          maxY: (stock.variation.map((e) => e.value).reduce(max) + 1)
              .roundToDouble(),
          lineBarsData: [
            LineChartBarData(
              spots: _chartSpots,
              isCurved: true,
              barWidth: 3,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.blue.withOpacity(0.10),
              ),
            )
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: Colors.black87,
                getTooltipItems: (data) {
                  return data.map((item) {
                    return LineTooltipItem(
                        _getFormatterdValue(item.spotIndex),
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: '\n${_getDate(item.spotIndex)}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ]);
                  }).toList();
                }),
          ),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          // borderData: FlBorderData(show: true),
        ),
      ),
    );
  }
}
