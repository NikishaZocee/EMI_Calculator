import 'package:ding/data/barData.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;
  const MyBarGraph({super.key,
  required this.weeklySummary,
  });

  @override
  Widget build(BuildContext context) {
    BarData myBarData= BarData(
        sunAmount: weeklySummary[0],
        monAmount: weeklySummary[1],
        tueAmount: weeklySummary[2],
        wedAmount: weeklySummary[3],
        thusAmount:weeklySummary[4],
        friAmount: weeklySummary[5],
        satAmount: weeklySummary[6]);
    return BarChart(
        BarChartData(
          maxY: 200,
          minY: 0,
          barGroups: myBarData.barData.map((data) => BarChartGroupData(x: data.x,
          barRods: [
            BarChartRodData(toY: data.y)
          ]
          ))
        .toList()
        )
    );
  }
}