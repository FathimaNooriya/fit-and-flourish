// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:healthy/screens/admin_login.dart';
import 'package:healthy/screens/registration.dart';
import 'package:healthy/theme/colors.dart';
import 'package:healthy/theme/fonds.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../db_functions/register_db_fn.dart';
import '../functions/burn_fn.dart';
import '../functions/first_page_fn.dart';
import '../functions/functions.dart';
import '../functions/water_fn.dart';
import '../functions/weight_fn.dart';
import '../main.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToRegistration();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            Text("Be Healthy", style: AppFonts().headdingWhite)
          ],
        ),
      ),
    );
  }

  Future<void> goToRegistration() async {
    await Future.delayed(const Duration(seconds: 3));
    final sharedPref = await SharedPreferences.getInstance();
    if (registerList.value.isNotEmpty) {
      name = registerList.value.first.name;
      hight = registerList.value.first.height;
      currentWeight = registerList.value.first.currentWeight;
      genterValue = registerList.value.first.genter;
      age = registerList.value.first.age;
      activity = registerList.value.first.activityLevel;
      yourGoal = registerList.value.first.goal;
      if (registerList.value.first.goal != "Maintain Weight") {
        weeklyRate = registerList.value.first.weeklyRate!;
        targetWeight = registerList.value.first.targetWeight!;
      }
      await basalMetabolicRate();
      await totalDailyEneryExpenditure();
      await dailyCalorieNeeded();
      await waterNeededPerDay();
      await daysOfGoalWeight();
      await totalEneryShouldBurn();
      await weterNeedToDrink();
      await waterReminder();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => const HomeScreen())));
    } else {
      if (sharedPref.getBool(userSaveKey) == true) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => const RegisrationPage())));
      } else {
      
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => const AdminLogin())));
      }
    }
  }
}
