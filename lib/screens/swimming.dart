// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../functions/burn_fn.dart';
import '../theme/colors.dart';
import '../theme/fonds.dart';
import '../widgets/appbar.dart';
import '../widgets/button.dart';
import '../widgets/drop_down.dart';
import '../widgets/fechingdatawidget.dart';
import 'burn_page.dart';

class SwimmingScreen extends StatelessWidget {
  const SwimmingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors().black,
            body: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: formkeySwimming,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: ListView(children: [
                     AppbarWigget(
                      appTitle: "Swimming...",
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
                                dropDownlist: const ["Light", "Vigorous"],
                                dropdownValue: "Light",
                              ),
                            )),
                        buttonColor: AppColors().grey),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // ButtonWidget(
                    //   buttonColor: AppColors().black,
                    //   myText: fechingDataWidget(
                    //     controller: runningDistanceController,
                    //     validator: runningDistanceValidation(),
                    //     data: "Distance",
                    //     unit: "Km",
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                      buttonColor: AppColors().black,
                      myText: FechingDataWidget(
                        controller: swimmingTimeController,
                        validator: (value) {
                          return swimmingTimeValidation();
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
                          trackSwimming(context);
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
