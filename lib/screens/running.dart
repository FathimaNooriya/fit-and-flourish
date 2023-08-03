// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:healthy/theme/fonds.dart';
import 'package:healthy/widgets/button.dart';
import '../functions/burn_fn.dart';
import '../theme/colors.dart';
import '../widgets/appbar.dart';
import '../widgets/drop_down.dart';
import '../widgets/fechingdatawidget.dart';
import 'burn_page.dart';

class RunningScreen extends StatelessWidget {
  const RunningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors().black,
            body: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: formkeyRunning,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: ListView(children: [
                    AppbarWigget(
                      appTitle: "Running...",
                      iconThere: true,
                      function: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const BurnScreen(),
                        ));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Image.asset("assets/images/run.jpg"),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ButtonWidget(
                        myText: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: DropDownWidget(
                                dropDownlist: const [
                                  'Slow (8 km/h)',
                                  'Moderate (9.6 km/h)',
                                  'Fast (12.9 km/h)'
                                ],
                                dropdownValue: "Slow (8 km/h)",
                              ),
                            )),
                        buttonColor: AppColors().grey),
                    const SizedBox(
                      height: 30,
                    ),
                    // ButtonWidget(
                    //   buttonColor: AppColors().black,
                    //   myText: fechingDataWidget(
                    //     controller: runningDistanceController,
                    //     validator: (value) {
                    //       // if (runningDistanceController.text.isEmpty) {
                    //       //   return "Please Enter the distace you run";
                    //       // }
                    //       // return null;
                    //       return runningDistanceValidation();
                    //     },
                    //     data: "Distance",
                    //     unit: "Km",
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    ButtonWidget(
                      buttonColor: AppColors().black,
                      myText: FechingDataWidget(
                        controller: runningTimeController,
                        validator: (value) {
                          // if (runningTimeController.text.isEmpty) {
                          //   return "Please Enter the time you run";
                          // }
                          // return null;
                          return runningTimeValidation();
                        },
                        data: "Time",
                        unit: 'Min',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                        onTapFunction: () {
                          trackRunning(context);
                        },
                        myText: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Track",
                            style: AppFonts().headding2black,
                          ),
                        ),
                        buttonColor: AppColors().grey)
                  ]),
                ))));
  }
}
