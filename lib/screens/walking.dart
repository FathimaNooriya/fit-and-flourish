import 'package:flutter/material.dart';
import '../functions/burn_fn.dart';
import '../theme/colors.dart';
import '../theme/fonds.dart';
import '../widgets/appbar.dart';
import '../widgets/button.dart';
import '../widgets/drop_down.dart';
import '../widgets/fechingdatawidget.dart';
import 'burn_page.dart';

class WalkingScreen extends StatelessWidget {
  const WalkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors().black,
            body: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: formkeyWalking,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: ListView(children: [
                     AppbarWigget(
                      appTitle: "Walking...",
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
                      child: Image.asset("assets/images/run.jpg"),
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
                                  'Slow (3.2 km/h)',
                                  'Moderate (5.6 km/h)',
                                  'Fast (7.2 km/h)'
                                ],
                                dropdownValue: 'Slow (3.2 km/h)',
                              ),
                            )),
                        buttonColor: AppColors().grey),
                    const SizedBox(
                      height: 30,
                    ),
                    // ButtonWidget(
                    //   buttonColor: AppColors().black,
                    //   myText: fechingDataWidget(
                    //     controller: walkingDistanceController,
                    //     validator: (value) {
                    //      return walkingDistanceValidation();
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
                        controller: walkingTimeController,
                        validator: (value) {
                        return  walkingTimeValidation();
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
                          trackWalking(context);
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
