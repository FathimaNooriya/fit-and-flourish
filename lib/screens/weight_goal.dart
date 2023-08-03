// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:healthy/theme/fonds.dart';
import 'package:healthy/widgets/button.dart';
import 'package:healthy/widgets/drop_down.dart';
import '../functions/burn_fn.dart';
import '../functions/first_page_fn.dart';
import '../functions/weight_fn.dart';
import '../theme/colors.dart';
import '../widgets/appbar.dart';

class WeightGoalScreen extends StatefulWidget {
  const WeightGoalScreen({super.key});

  @override
  State<WeightGoalScreen> createState() => _weightGoalScreenState();
}

// ignore: camel_case_types
class _weightGoalScreenState extends State<WeightGoalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().black,
      body: ListView(children: [
        const AppbarWigget(
          appTitle: "Weight Goal",
          iconThere: true,
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Set  Weight Goal ",
            style: AppFonts().headding2White,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ButtonWidget(
          buttonColor: AppColors().blue,
          myText: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    setWeightGoal();
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.remove_circle_rounded,
                  )),
              Text(
                "$targetWeight",
                style: AppFonts().headding2black,
              ),
              IconButton(
                  onPressed: () {
                    addTrgetWeight = true;
                    setWeightGoal();
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.add_circle_rounded,
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        yourGoal == "Weight Loss"
            ? Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonWidget(
                      myText: DropDownWidget(dropDownlist: const [
                        "Lose 1Kg/week",
                        "Lose 0.75 Kg/week",
                        "Lose 0.50 Kg/week",
                        "Lose 0. 25 Kg/week",
                        "Lose 0.15 Kg/week"
                      ], dropdownValue: weeklyRate),
                      buttonColor: AppColors().grey),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              )
            : yourGoal == "Weight Gain"
                ? Column(
                    children: [
                      ButtonWidget(
                          myText: DropDownWidget(dropDownlist: const [
                            "Gain 1Kg/week",
                            "Gain 0.75 Kg/week",
                            "Gain 0.50 Kg/week",
                            "Gain 0. 25 Kg/week",
                            "Gain 0.15 Kg/week"
                          ], dropdownValue: weeklyRate),
                          buttonColor: AppColors().grey),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  )
                : const SizedBox(),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 230,
              child: ButtonWidget(
                  myText: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Eat Less Than",
                          style: AppFonts().headding2White,
                        ),
                      ),
                      SizedBox(
                        width: 110,
                        child: ButtonWidget(
                            myText: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "${dailyCalorieIntake.toStringAsFixed(2)}"),
                            ),
                            buttonColor: AppColors().black),
                      ),
                      Text(
                        "Cal EveryDay",
                        style: AppFonts().normalTextWhite,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  buttonColor: AppColors().pink),
            ),
            const SizedBox(
              width: 50,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 230,
                child: ButtonWidget(
                    myText: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Burn More Than",
                            style: AppFonts().headding2White,
                          ),
                        ),
                        SizedBox(
                          width: 110,
                          child: ButtonWidget(
                              myText: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    targetBurnEnergy.toStringAsFixed(2)),
                              ),
                              buttonColor: AppColors().black),
                        ),
                        Text(
                          "Cal EveryDay",
                          style: AppFonts().normalTextWhite,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    buttonColor: AppColors().lavender),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: ButtonWidget(
              myText: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Done",
                  style: AppFonts().headding2black,
                ),
              ),
              onTapFunction: () async {
                await daysOfGoalWeight();
                await dailyCalorieNeeded();
                await totalEneryShouldBurn();
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
              buttonColor: AppColors().grey),
        )
      ]),
    );
  }
}
