// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:healthy/main.dart';
import 'package:healthy/widgets/button.dart';
import '../db_functions/sleep_db_fn.dart';
import '../functions/notification.dart';
import '../functions/sleep_fn.dart';
import '../theme/colors.dart';
import '../theme/fonds.dart';
import '../widgets/appbar.dart';
import 'home.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _sleepScreenState();
}

// ignore: camel_case_types
class _sleepScreenState extends State<SleepScreen> {
  @override
  void initState() {
    super.initState();
    if (sleepList.value.isNotEmpty) {
      if (sleepList.value.last.sleepDate.day == DateTime.now().day) {
        nextBedTime = TimeOfDay.fromDateTime(sleepList.value.last.nextBedTime);
        alamTime = TimeOfDay.fromDateTime(sleepList.value.last.alamtime);
      }
    }

    Noti.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().black,
      body: SafeArea(
        child: Column(
          children: [
            AppbarWigget(
              appTitle: "Sleep...",
              iconThere: true,
              function: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
              },
            ),
            // Row(
            //   children: [
            //     IconButton(
            //         onPressed: () {
            //           Navigator.of(context).pop();
            //         },
            //         icon: Icon(Icons.arrow_back)),
            //     Text(
            //       "Sleep...",
            //       style: AppFonts().headdingWhite,
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new)),
                Text(
                  "Today",
                  style: AppFonts().headding2White,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios)),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: sleepProgres
                  ? const SizedBox(
                      width: 60,
                      height: 50,
                      child: FittedBox(
                        child: CircularProgressIndicator(),
                      ))
                  : SizedBox(
                      height: 40,
                      width: 80,
                      child: ButtonWidget(
                        buttonColor: AppColors().white,
                        myText: Text(
                          "Save",
                          style: AppFonts().normalTextBlack,
                        ),
                        onTapFunction: () async {
                          sleepProgres = true;
                          await saveSleep();
                          sleepProgres = false;
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute<HomeScreen>(
                            builder: (BuildContext context) {
                              return const HomeScreen();
                            },
                          ));

                          // Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (context) => homeScreen()));
                          //await sleepTargetNeeded();
                          // Noti.showBigTextNotification(
                          //     title: "New message title",
                          //     body: "Your long body",
                          //     fln: flutterLocalNotificationsPlugin);
                        },
                      ),
                    ),
            ),
            ButtonWidget(
                myText: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Sleep Performance",
                          style: AppFonts().headding2White,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Your sleep  ",
                                style: AppFonts().headding2grey,
                              ),
                              CircleAvatar(
                                backgroundColor: AppColors().lavender,
                                radius: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 38,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: sleepingHours.inHours == 0
                                          ? const Text("0")
                                          : Text(
                                              "${sleepingHours.inHours}:${(sleepingHours.inMinutes / 10).floor()}",
                                              style: AppFonts().headding2White,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors().white,
                            radius: 53,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 50,
                                child: Text(
                                  "${sleepPerformancePercet}%",
                                  style: AppFonts().headding2White,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Target sleep",
                                style: AppFonts().headding2grey,
                              ),
                              CircleAvatar(
                                backgroundColor: AppColors().lavender,
                                radius: 38,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 35,
                                    child: Text(
                                      "7-9",
                                      style: AppFonts().headding2White,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       "Hours of sleep",
                      //       style: AppFonts().headding2grey,
                      //     ),
                      //     Text(
                      //       "Hours of sleep",
                      //       style: AppFonts().headding2grey,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                buttonColor: AppColors().black),
            ButtonWidget(
              buttonColor: AppColors().black,
              myText: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Expanded(
                      //   child: ButtonWidget(
                      //     buttonColor: AppColors().blue,
                      //     myText: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           IconButton(
                      //               onPressed: () {},
                      //               icon: const Icon(
                      //                 Icons.add_circle_rounded,
                      //               )),
                      Expanded(
                        child: Center(
                          child: Text(
                            sleepQuality,
                            style: AppFonts().headding2White,
                          ),
                        ),
                      ),
                      //         IconButton(
                      //           onPressed: () {},
                      //         ),                      //           icon: const Icon(Icons.remove_circle_rounded),

                      //       ]),
                      // ),
                      //  ),
                      // Text((reminingTimeForbed.inHours)
                      //     .toString()
                      //     .padRight(4, ';')
                      //     ),
                      Image.asset(
                        "assets/images/sleep2.png",
                        height: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ButtonWidget(
                myText: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: reminingTimeForbed.inHours == 0 &&
                          reminingTimeForbed.inMinutes == 0
                      ? Text(
                          "Set next bed time",
                          style: AppFonts().headding2White,
                        )
                      : reminingTimeForbed.inHours.isNegative ||
                              reminingTimeForbed.inMinutes.isNegative
                          ? Text(
                              "It's your Bed time",
                              style: AppFonts().headding2White,
                            )
                          : Text(
                              "${reminingTimeForbed.inHours}:${(reminingTimeForbed.inMinutes / 10).floor()} hr Remaining for next bed",
                              style: AppFonts().headding2White,
                            ),
                ),
                buttonColor: AppColors().black),
            ButtonWidget(
                myText: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Alarm",
                        style: AppFonts().headding2White,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Switch(
                            value: alarmSwich,
                            onChanged: (value) async {
                              setState(() {
                                alarmSwich = value;
                              });
                              await setAlarm();
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 150,
                            child: ButtonWidget(
                              myText: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Set Alarm",
                                  style: AppFonts().headding2black,
                                ),
                              ),
                              buttonColor: AppColors().lavender2,
                              onTapFunction: () async {
                                alamTime == const TimeOfDay(hour: 0, minute: 0)
                                    ? alamTime = await showTimePicker1(context)
                                    : alamTime = await showTimePicker1(
                                        context, alamTime);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: ButtonWidget(
                              myText: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Bed Time",
                                  style: AppFonts().headding2black,
                                ),
                              ),
                              buttonColor: AppColors().lavender2,
                              onTapFunction: () async {
                                nextBedTime == const TimeOfDay(hour: 0, minute: 0)
                                    ? nextBedTime =
                                        await showTimePicker1(context)
                                    : nextBedTime = await showTimePicker1(
                                        context, nextBedTime);
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                buttonColor: AppColors().black)
          ],
        ),
      ),
    );
  }
}

showTimePicker1(context, [TimeOfDay? time]) async {
  TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: time ?? TimeOfDay.now(),
      builder: (context, childWidget) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(
                // Using 24-Hour format
                alwaysUse24HourFormat: false),
            // If you want 12-Hour format, just change alwaysUse24HourFormat to false or remove all the builder argument
            child: childWidget!);
      });
  return selectedTime;
}
