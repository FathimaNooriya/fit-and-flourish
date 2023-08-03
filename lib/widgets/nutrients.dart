// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:healthy/widgets/linear_progres.dart';
import '../theme/colors.dart';
import '../theme/fonds.dart';

class NutrientsWidget extends StatelessWidget {
  const NutrientsWidget(
      {super.key,
      this.nutrientName,
      this.nutrientValue,
      required this.nutrientPercent});
  final nutrientName;
  final nutrientValue;
  final double nutrientPercent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            nutrientName,
            style: AppFonts().headding2White,
          ),
          Text(
            nutrientValue,
            style: AppFonts().headding2grey,
          ),
          SizedBox(
            width: 70,
            child: linearProgressWdget(
                value: nutrientPercent == 0 ? 0 : nutrientPercent / 100,
                valueColor: AppColors().pink,
                height: 5),
          ),
          Text(
            "${nutrientPercent.round()}",
            style: AppFonts().headding2grey,
          ),
        ],
      ),
    );
  }
}
