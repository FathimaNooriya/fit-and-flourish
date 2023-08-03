// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthy/main.dart';
import 'package:healthy/screens/burn_page.dart';
import 'package:healthy/screens/meal.dart';
import 'package:healthy/screens/sleep.dart';
import 'package:healthy/screens/steps.dart';
import 'package:healthy/theme/colors.dart';
import 'package:healthy/theme/fonds.dart';
import 'package:healthy/widgets/home_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../functions/admin_functions.dart';
import '../functions/burn_fn.dart';
import '../functions/first_page_fn.dart';
import '../functions/functions.dart';
import '../functions/meal_fn.dart';
import '../functions/sleep_fn.dart';
import '../functions/water_fn.dart';
import '../functions/weight_fn.dart';
import 'admin_login.dart';
import 'water.dart';
import 'weight.dart';
import '../widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _homeScreenState();
}

// ignore: camel_case_types
class _homeScreenState extends State<HomeScreen> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors().black,
          body: Column(
            children: [
              AppbarWigget(
                appTitle: "Hi $name..",
                iconThere: false,
                actions: [
                  IconButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                title: const Text('Wannig'),
                                content: const Text(
                                    "Are you sure you want to Log out"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () async {
                                        final sharedPref =
                                            await SharedPreferences
                                                .getInstance();
                                        await sharedPref.setBool(
                                            userSaveKey, false);
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: ((context2) =>
                                                        const AdminLogin())),
                                                (route) => false);
                                        adminLogoutFn();
                                      },
                                      child: const Text("yes")),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("no"))
                                ],
                              );
                            }));
                      },
                      icon: const Icon(Icons.logout)),
                ],
              ),
              // Text(
              //   "Hi Fathima..",
              //   style: AppFonts().headdingWhite,
              // ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          "assets/images/meal1.png",
                          height: 170,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: CircularProgressIndicator(
                              backgroundColor: AppColors().orange,
                              color: AppColors().green,
                              strokeWidth: 8,
                              value: (calorieTaken / dailyCalorieIntake),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '''     $calorieTaken   of   
 ${dailyCalorieIntake.toStringAsFixed(2)} Cal''',
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts().headding2White,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  children: [
                    HomeContainer(
                      color: AppColors().blue,
                      image: "assets/images/fire1.png",
                      text: "Burn at least",
                      value: targetBurnEnergy.toStringAsFixed(2),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BurnScreen(),
                        ));
                      },
                    ),
                    HomeContainer(
                      color: AppColors().orange,
                      image: "assets/images/weight.png",
                      text: "Weight in Kg",
                      value: "$currentWeight",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const WeightScreen(),
                        ));
                      },
                    ),
                    HomeContainer(
                      color: AppColors().pink,
                      image: "assets/images/water.png",
                      text: "Drink $waterNeededPerGlass glass",
                      value: "of water",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const WaterScreen(),
                        ));
                      },
                    ),
                    HomeContainer(
                      color: AppColors().lavender,
                      image: "assets/images/step.png",
                      text: "Steps walked",
                      value: "",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const StepsScreen(),
                        ));
                      },
                    ),
                    HomeContainer(
                      color: AppColors().green,
                      image: "assets/images/sleep.png",
                      text: "Sleep in hr",
                      value:
                          "${sleepTakeninInt.hour}:${sleepTakeninInt.minute} hr",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SleepScreen(),
                        ));
                      },
                    ),
                    HomeContainer(
                      color: AppColors().yellow,
                      image: "assets/images/meal.png",
                      text: "Add meal",
                      value: "${calorieTaken.round()} Cal",
                      onTap: () async {
                        targertFoodCalorie();
                        await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MealScreen(),
                        ));
                        setState(() {});
                      },
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
