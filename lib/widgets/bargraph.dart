import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../db_functions/weight_db_fn.dart';

class BarGraphWidget extends StatelessWidget {
  const BarGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> weightChartGroups() {
      List<BarChartGroupData> graphData = [];
      for (int i = 0; i < weightList.value.length; i++) {
        graphData.add(BarChartGroupData(
            x: weightList.value[i].weightDate.day,
            barRods: [
              BarChartRodData(toY: weightList.value[i].weightAmount.toDouble())
            ]));
      }
      return graphData;
    }

    return BarChart(BarChartData(
      maxY: 100,
      minY: 40,
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
      barGroups: weightChartGroups(),
      //        [
      //         BarChartGroupData(x: 1, barRods: [
      //           BarChartRodData(
      //               toY: 58, width: 10, color: Color.fromARGB(255, 116, 91, 230)),
      //         ]),
      //         BarChartGroupData(x: 2, barRods: [
      //           BarChartRodData(
      //               toY: 57, width: 10, color: Color.fromARGB(255, 116, 91, 230)),
      //         ]),
      //         BarChartGroupData(x: 3, barRods: [
      //           BarChartRodData(
      //               toY: 56, width: 10, color: Color.fromARGB(255, 116, 91, 230)),
      //         ]),
      //         BarChartGroupData(x: 4, barRods: [
      //           BarChartRodData(
      //               toY: 54, width: 10, color: Color.fromARGB(255, 116, 91, 230)),
      //         ]),
      //         BarChartGroupData(x: 5, barRods: [
      //           BarChartRodData(
      //               toY: 53, width: 10, color: Color.fromARGB(255, 116, 91, 230)),
      //         ]),
      //         BarChartGroupData(x: 6, barRods: [
      //           BarChartRodData(
      //               toY: 55, width: 10, color: Color.fromARGB(255, 116, 91, 230)),
      //         ]),
      //         BarChartGroupData(x: 7, barRods: [
      //           BarChartRodData(
      //               toY: 56, width: 10, color: Color.fromARGB(255, 116, 91, 230)),
      //         ]),
      //         BarChartGroupData(x: 8, barRods: [
      //           BarChartRodData(
      //               toY: 57, width: 10, color: Color.fromARGB(255, 116, 91, 230)),
      //         ]),
      //       ])
    ));
  }
}
