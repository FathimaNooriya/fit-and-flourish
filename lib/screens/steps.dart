import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import '../theme/colors.dart';
import '../widgets/appbar.dart';
import 'home.dart';
class StepsScreen extends StatefulWidget {
  const StepsScreen({super.key});

  @override
  State<StepsScreen> createState() => _stepsScreenState();
}

// ignore: camel_case_types
class _stepsScreenState extends State<StepsScreen> {
  StreamSubscription<StepCount>? _stepCountStream;
  int _currentStepCount = 0;

  @override
  void initState() {
    super.initState();
    startListeningForSteps();
  }

  @override
  void dispose() {
    stopListeningForSteps();
    super.dispose();
  }

  void startListeningForSteps() {
    _stepCountStream = Pedometer.stepCountStream.listen((stepCount) {
      setState(() {
        _currentStepCount = stepCount.steps;
      });
    });
  }

  void stopListeningForSteps() {
    _stepCountStream?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().black,
        body: SafeArea(
            child: Column(children: [
          AppbarWigget(
            appTitle: "Daily Steps...",
            iconThere: true,
            function: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
            },
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     IconButton(
          //         onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
          //     Text(
          //       "Today",
          //       style: AppFonts().headding2White,
          //     ),
          //     IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
          //   ],
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // Align(
          //   alignment: Alignment.topRight,
          //   child: SizedBox(
          //     height: 40,
          //     width: 70,
          //     child: buttonWidget(
          //         buttonColor: AppColors().white,
          //         myText: Text(
          //           "Edit",
          //           style: AppFonts().normalTextBlack,
          //         )),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 10),
          //   child: Text(
          //     "${_currentStepCount} of 12000 steps walked",
          //     style: AppFonts().normalTextWhite,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
          //   child: linearProgressWdget(
          //       value: (_currentStepCount / 12000),
          //       valueColor: AppColors().blue,
          //       height: 5),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.directions_walk,
                  size: 90,
                  color: Colors.blue,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Step Count:',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  '$_currentStepCount',
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 20),
          //   child: buttonWidget(
          //     buttonColor: AppColors().black,
          //     myText: Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: Row(
          //         children: [
          //           Image.asset(
          //             "assets/images/step2.png",
          //             height: 70,
          //           ),
          //           Expanded(
          //             child: buttonWidget(
          //               buttonColor: AppColors().blue,
          //               myText: Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   IconButton(
          //                       onPressed: () {},
          //                       icon: Icon(
          //                         Icons.add_circle_rounded,
          //                       )),
          //                   Text(
          //                     "5500",
          //                     style: AppFonts().headding2black,
          //                   ),
          //                   IconButton(
          //                       onPressed: () {},
          //                       icon: Icon(Icons.remove_circle_rounded)),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Container(
          //   height: 300,
          //   width: 330,
          //   child: BargraphSteps(),
          // )
        ])));
  }
}
