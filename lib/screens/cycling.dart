import 'dart:async';
import 'package:flutter/material.dart';
import '../functions/burn_fn.dart';
import '../theme/colors.dart';
import '../theme/fonds.dart';
import '../widgets/appbar.dart';
import '../widgets/button.dart';
import '../widgets/drop_down.dart';
import '../widgets/fechingdatawidget.dart';
import 'burn_page.dart';

class CyclingScreen extends StatefulWidget {
  const CyclingScreen({super.key});

  @override
  State<CyclingScreen> createState() => _cyclingScreenState();
}

// ignore: camel_case_types
class _cyclingScreenState extends State<CyclingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors().black,
            body: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: formkeyCycling,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: ListView(children: [
                    AppbarWigget(
                      appTitle: "Cycling...",
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
                                  'Leisurely biking(16 km/h)',
                                  'Moderate biking(19.3-22.4 km/h)',
                                  'Fast (22.5-25.7 km/h)'
                                ],
                                dropdownValue: "Leisurely biking(16 km/h)",
                              ),
                            )),
                        buttonColor: AppColors().grey),
                    const SizedBox(
                      height: 30,
                    ),
//                     ButtonWidget(
//                       buttonColor: AppColors().black,
//                       myText: fechingDataWidget(
//                         controller: cyclingDistanceController,
//                         validator: (value){
// cyclingDistanceValidation(value!);
//                         },

//                         data: "Distance",
//                         unit: "Km",
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
                    ButtonWidget(
                      buttonColor: AppColors().black,
                      myText: FechingDataWidget(
                        controller: cyclingTimeController,
                        validator: (value) {
                          return cyclingTimeValidation();
                        },
                        data: "Time",
                        unit: 'Min',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    cycleprogres
                        ? const SizedBox(
                            width: 60,
                            height: 50,
                            child: FittedBox(
                              child: CircularProgressIndicator(),
                            ))
                        : ButtonWidget(
                            onTapFunction: () async {
                              setState(() {
                                cycleprogres = true;
                              });
                              Timer(const Duration(seconds: 1), () async {
                                return trackCycling(context);
                              });
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
