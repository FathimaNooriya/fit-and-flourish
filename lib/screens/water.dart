import 'dart:async';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import '../db_functions/water_db_fn.dart';
import '../functions/notification.dart';
import '../functions/water_fn.dart';
import '../main.dart';
import '../theme/colors.dart';
import '../theme/fonds.dart';
import '../widgets/appbar.dart';
import '../widgets/bargraph_water.dart';
import '../widgets/button.dart';
import '../widgets/linear_progres.dart';
import 'home.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _waterScreenState();
}

// ignore: camel_case_types
class _waterScreenState extends State<WaterScreen> {
  @override
  void initState() {
    super.initState();
    getWaterList();
    if (waterList.value.isNotEmpty) {
      radioButtonValue = waterList.value.last.waterReminder;
      waterNeededPerGlass = waterList.value.last.waterTarget;
      if (waterList.value.last.waterDate.day == DateTime.now().day) {
        drinkedWater = waterList.value.last.waterIntake;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().black,
      body: SafeArea(
          child: Column(
        children: [
          AppbarWigget(
            appTitle: "Water...",
            iconThere: true,
            function: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
              Text(
                "Today",
                style: AppFonts().headding2White,
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Align(
          //   alignment: Alignment.topRight,
          //   child: SizedBox(
          //     height: 40,
          //     width: 70,
          //     child: ButtonWidget(
          //         buttonColor: AppColors().white,
          //         myText: Text(
          //           "Edit",
          //           style: AppFonts().normalTextBlack,
          //         ),
          //         onTapFunction: () {}),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child:

                //  waterList.value[waterList.value.length - 1].waterDate.day ==
                //         DateTime.now().day
                //     ? Text(
                //         "${waterList.value[waterList.value.length - 1].waterIntake} of ${waterList.value[waterList.value.length - 1].waterTarget} glasses",
                //         style: AppFonts().normalTextWhite,
                //       )
                //     :
                Text(
              "$drinkedWater of $waterNeededPerGlass glasses",
              style: AppFonts().normalTextWhite,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 10, left: 10, bottom: 5, top: 5),
            child: linearProgressWdget(
                value:
                    // waterList
                    //             .value[waterList.value.length - 1].waterDate.day ==
                    //         DateTime.now().day
                    //     ? (waterList.value[waterList.value.length - 1].waterIntake /
                    //         waterList.value[waterList.value.length - 1].waterTarget)
                    //     :
                    (drinkedWater / waterNeededPerGlass),
                valueColor: AppColors().blue,
                height: 5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  weterDrinkedInaDay();
                  setState(() {});
                },
                icon: const Icon(Icons.remove_circle_rounded),
              ),
              Image.asset(
                "assets/images/water.png",
                height: 120,
              ),
              IconButton(
                  onPressed: () {
                    addGlass = true;
                    weterDrinkedInaDay();
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.add_circle_rounded,
                  )),
            ],
          ),
          Text(
            "1 Glass (250 ml)",
            style: AppFonts().headding2grey,
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
              myText: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Remainder",
                  style: AppFonts().headding2White,
                ),
              ),
              onTapFunction: () async {
                await showDialog(
                  context: context,
                  builder: ((context1) {
                    return AlertDialog(
                        title: const Text('Water Remainder'),
                        content: StatefulBuilder(
                          // You need this, notice the parameters below:
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Column(
                              // Then, the content of your dialog.
                              mainAxisSize: MainAxisSize.min,
                              children: List<Widget>.generate(1, (int index) {
                                return RadioGroup<String>.builder(
                                  direction: Axis.vertical,
                                  groupValue: radioButtonValue,
                                  horizontalAlignment:
                                      MainAxisAlignment.spaceAround,
                                  onChanged: (value) {
                                    setState(() {
                                      radioButtonValue = value ?? '';
                                    });
                                  },
                                  items: const [
                                    "Remind me every 1 Hour",
                                    "Remind me      5 Times",
                                    "Remind me      3 Times",
                                  ],
                                  textStyle: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                  itemBuilder: (item) => RadioButtonBuilder(
                                    item,
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                        actions: [
                          ButtonWidget(
                            onTapFunction: () {
                              waterReminder();
                              Noti.showBigTextNotification(
                                  title: "Time to drink a glass of water",
                                  body:
                                      "Add it to your logs before it's too late",
                                  fln: flutterLocalNotificationsPlugin);
                              Navigator.of(context).pop();
                            },
                            myText: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Save",
                                style: AppFonts().headding2black,
                              ),
                            ),
                            buttonColor: AppColors().white,
                          )
                        ]);
                  }),
                );
              },
              buttonColor: AppColors().black),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 250,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                    SizedBox(height: 220, width: 500, child: BarGraphWater())),
          ),
          waterProgress
              ? const SizedBox(
                  width: 60,
                  height: 50,
                  child: FittedBox(
                    child: CircularProgressIndicator(),
                  ))
              : SizedBox(
                  width: 250,
                  child: ButtonWidget(
                    myText: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Save",
                        style: AppFonts().normalTextBlack,
                      ),
                    ),
                    buttonColor: AppColors().white,
                    onTapFunction: () async {
                      setState(() {
                        waterProgress = true;
                      });
                      Timer(
                        const Duration(seconds: 2),
                        () async {
                          await saveWaterDetails();
                          waterProgress = false;
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => homeScreen()));
                          // ignore: use_build_context_synchronously
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute<HomeScreen>(
                            builder: (BuildContext context) {
                              return const HomeScreen();
                            },
                          ));
                        },
                      );
                    },
                  ),
                )
        ],
      )),
    );
  }
}
