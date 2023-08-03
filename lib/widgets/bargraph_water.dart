import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../db_functions/water_db_fn.dart';
import '../models/water_model.dart';

class BarGraphWater extends StatefulWidget {
  const BarGraphWater({super.key});

  @override
  State<BarGraphWater> createState() => _BarGraphWaterState();
}

class _BarGraphWaterState extends State<BarGraphWater> {
  List<BarChartGroupData> chartGroups() {
    List<BarChartGroupData> graphData = [];
    for (int i = 0; i < waterList.value.length; i++) {
      graphData.add(BarChartGroupData(
          x: waterList.value[i].waterDate.day,
          barRods: [
            BarChartRodData(toY: waterList.value[i].waterIntake.toDouble())
          ]));
    }
    return graphData;
  }

  //int y1;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: waterList,
        builder: (BuildContext ctx, List<WaterModel> studentListView,
            Widget? child) {
          return BarChart(BarChartData(
            maxY: 15,
            minY: 0,
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(
              show: true,
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              // leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
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

            barGroups: chartGroups(),
            //  [
            //   BarChartGroupData(
            //     x: 1,
            //     barRods: [
            //       BarChartRodData(
            //           toY: drinkedWater.toDouble(),
            //           width: 10,
            //           color: Color.fromARGB(255, 116, 91, 230)),
            //     ],
            //   ),
            //   BarChartGroupData(x: 2, barRods: [
            //     BarChartRodData(
            //         toY: drinkedWater.toDouble(),
            //         width: 10,
            //         color: Color.fromARGB(255, 116, 91, 230)),
            //   ]),
            //   BarChartGroupData(x: 3, barRods: [
            //     BarChartRodData(
            //         toY: drinkedWater.toDouble(),
            //         width: 10,
            //         color: Color.fromARGB(255, 116, 91, 230)),
            //   ]),
            //   BarChartGroupData(x: 4, barRods: [
            //     BarChartRodData(
            //         toY: 15, width: 10, color: Color.fromARGB(255, 116, 91, 230)),
            //   ]),
            //   BarChartGroupData(x: 5, barRods: [
            //     BarChartRodData(
            //         toY: 8.9, width: 10, color: Color.fromARGB(255, 116, 91, 230)),
            //   ]),
            //   BarChartGroupData(x: 6, barRods: [
            //     BarChartRodData(
            //         toY: 9, width: 10, color: Color.fromARGB(255, 116, 91, 230)),
            //   ]),
            //   BarChartGroupData(x: 7, barRods: [
            //     BarChartRodData(
            //         toY: 7, width: 10, color: Color.fromARGB(255, 116, 91, 230)),
            //   ]),
            //   BarChartGroupData(x: 8, barRods: [
            //     BarChartRodData(
            //         toY: 10, width: 10, color: Color.fromARGB(255, 116, 91, 230)),
            //   ]),
            // ]
          ));
        });
  }

  // List<BarChartGroupData> _chartGroups() {
  //   List<BarChartGroupData> graphData = [];
  //   for (int i = 0; i < waterList.value.length; i++) {
  //     graphData.add(BarChartGroupData(
  //         x: waterList.value[i].waterDate.day,
  //         barRods: [
  //           BarChartRodData(toY: waterList.value[i].waterIntake.toDouble())
  //         ]));
  //   }
  //   return graphData;
  //   // points
  //   //     .map((point) => BarChartGroupData(
  //   //         x: point.x.toInt(), barRods: [BarChartRodData(toY: point.y)]))
  //   //     .toList();
  // }
}
