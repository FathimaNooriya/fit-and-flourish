import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BargraphSteps extends StatelessWidget {
  const BargraphSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
        maxY: 13000,
        minY: 400,
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          // leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        // borderData: FlBorderData(show: false),
        borderData: FlBorderData(
          border: const Border(
            top: BorderSide.none,
            right: BorderSide.none,
            left: BorderSide(width: 1),
            bottom: BorderSide(width: 1),
          ),
        ),
        groupsSpace: 50,

        // add bars
        barGroups: [
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(
                toY: 11500,
                width: 10,
                color: const Color.fromARGB(255, 116, 91, 230)),
          ]),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(
                toY: 10500,
                width: 10,
                color: const Color.fromARGB(255, 116, 91, 230)),
          ]),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(
                toY: 8500, width: 10, color: const Color.fromARGB(255, 116, 91, 230)),
          ]),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(
                toY: 12000,
                width: 10,
                color: const Color.fromARGB(255, 116, 91, 230)),
          ]),
          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(
                toY: 10000,
                width: 10,
                color: const Color.fromARGB(255, 116, 91, 230)),
          ]),
          BarChartGroupData(x: 6, barRods: [
            BarChartRodData(
                toY: 5500, width: 10, color: const Color.fromARGB(255, 116, 91, 230)),
          ]),
          BarChartGroupData(x: 7, barRods: [
            BarChartRodData(
                toY: 11000,
                width: 10,
                color: const Color.fromARGB(255, 116, 91, 230)),
          ]),
          BarChartGroupData(x: 8, barRods: [
            BarChartRodData(
                toY: 500, width: 10, color: const Color.fromARGB(255, 116, 91, 230)),
          ]),
        ]));
  }
}
