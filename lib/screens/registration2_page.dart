// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthy/screens/starting.dart';

import '../functions/first_page_fn.dart';
import '../functions/functions.dart';
import '../theme/colors.dart';
import '../theme/fonds.dart';
import '../theme/text_field.dart';
import '../widgets/button.dart';
import '../widgets/drop_down.dart';

class Registration2Page extends StatefulWidget {
  const Registration2Page({super.key});

  @override
  State<Registration2Page> createState() => _registration2PageState();
}

// ignore: camel_case_types
class _registration2PageState extends State<Registration2Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors().black,
          body: SafeArea(
              child: Form(
            key: formkeyRegistration2,
            //  autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(children: [
              // appbarWigget(
              //   appTitle: "Hey there...!",
              //   iconThere: false,
              // ),
              const SizedBox(
                height: 40,
              ),
              ButtonWidget(
                  myText: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      yourFitness,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors().lavender,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  buttonColor: AppColors().lavender2),

              yourGoal == "Maintain Weight"
                  ? const SizedBox(
                      height: 5,
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        ButtonWidget(
                          buttonColor: AppColors().black,
                          myText: TextFieldWidget(
                              number: true,
                              hintText: "What is your target weight?",
                              controller: targetWeightController,
                              validatorFn: (value) {
                                return targetWeightValidation();
                              }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
              ButtonWidget(
                  buttonColor: AppColors().black,
                  myText: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Goal:  $yourGoal",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors().lavender,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    // Text(
                    //   "Weight Goal: ${yourGoal}",
                    //   style: AppFonts().headding2White,
                    // ),
                  )
                  //  Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     SizedBox(
                  //       width: (MediaQuery.of(context).size.width) / 2.1,
                  //       child: ButtonWidget(
                  //         buttonColor: AppColors().lavender2,
                  //         myText: const Padding(
                  //           padding: EdgeInsets.all(8.0),
                  //           child: Text("Weight Goal:"),
                  //         ),
                  //       ),
                  //     ),
                  //     // SizedBox(
                  //     //   height: 15,
                  //     // ),
                  //     SizedBox(
                  //       width: (MediaQuery.of(context).size.width) / 2.1,
                  //       child: ButtonWidget(
                  //           myText: Padding(
                  //             padding: const EdgeInsets.all(10.0),
                  //             child: Text(
                  //               yourGoal,
                  //               style: AppFonts().normalTextBlack,
                  //             ),
                  //           ),
                  //           // DropDownWidget(dropDownlist: const [
                  //           //   "Weight Loss",
                  //           //   "Weight Gain",
                  //           //   "Maintain Weight",
                  //           // ], dropdownValue: yourGoal),
                  //           // onsecondry: () {
                  //           //   setState(() {});
                  //           // },
                  //           // onTapFunction: () {

                  //           //   setState(() {});
                  //           // },
                  //           buttonColor: AppColors().grey),
                  //     ),
                  //   ],
                  // ),
                  ),
              // ButtonWidget(
              //         buttonColor: AppColors().lavender2,
              //         myText: const Padding(
              //           padding: EdgeInsets.all(8.0),
              //           child: Text("What is you Goal?"),
              //         ),
              //       ),
              //       // SizedBox(
              //       //   height: 15,
              //       // ),
              //       ButtonWidget(
              //           myText: Padding(
              //             padding: const EdgeInsets.all(10.0),
              //             child: Text(
              //               yourGoal,
              //               style: AppFonts().normalTextBlack,
              //             ),
              //           ),
              //           // DropDownWidget(dropDownlist: const [
              //           //   "Weight Loss",
              //           //   "Weight Gain",
              //           //   "Maintain Weight",
              //           // ], dropdownValue: yourGoal),
              //           // onsecondry: () {
              //           //   setState(() {});
              //           // },
              //           // onTapFunction: () {

              //           //   setState(() {});
              //           // },
              //           buttonColor: AppColors().grey),

              const SizedBox(
                height: 10,
              ),
              // SizedBox(
              //   height: 20,
              // ),
              ButtonWidget(
                buttonColor: AppColors().lavender2,
                myText: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("When were you born?"),
                ),
              ),
              ButtonWidget(
                buttonColor: AppColors().black,
                myText: SizedBox(
                  height: 200,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    minimumDate: DateTime(1940, 1, 1),
                    maximumYear: 2023,
                    initialDateTime: DateTime(2000, 1, 1),
                    onDateTimeChanged: (DateTime newDateTime) {
                      // Do something
                      dateOfBirth = newDateTime;
                      ageValidation();
                      // print(newDateTime);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              ButtonWidget(
                buttonColor: AppColors().lavender2,
                myText: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("How active you are?"),
                ),
              ),

              ButtonWidget(
                  myText: DropDownWidget(dropDownlist: const [
                    "Sedentary",
                    "Lightly Active",
                    "Moderately Active",
                    "Very Active",
                    "Extremely Active"
                  ], dropdownValue: activity),
                  buttonColor: AppColors().grey),
              yourGoal == "Maintain Weight"
                  ? const SizedBox(
                      height: 20,
                    )
                  : ButtonWidget(
                      buttonColor: AppColors().lavender2,
                      myText: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Select your weekly rate"),
                      ),
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
                            const SizedBox(
                              height: 15,
                            ),
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
                      : SizedBox(),
              // regi2progress == true
              //     ? const SizedBox(
              //         width: 60,
              //         height: 50,
              //         child: FittedBox(
              //           child: CircularProgressIndicator(),
              //         ))
              //     :
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: ButtonWidget(
                  buttonColor: AppColors().white,
                  myText: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Next",
                          style: AppFonts().normalTextWhite,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_sharp,
                        color: AppColors().greyText,
                      ),
                    ],
                  ),
                  onTapFunction: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const StartingPage(),
                    ));
                    await saveRegistration();
                    //             Navigator.of(context).pushReplacement(
                    // MaterialPageRoute(builder: ((context) => homeScreen())));
                    // print(targetWeightController.text);
                    // regi2progress = false;
                    // setState(() {});
                  },
                ),
              ),
            ]),
          ))),
    );
  }
}
