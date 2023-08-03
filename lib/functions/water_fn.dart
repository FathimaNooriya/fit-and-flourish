import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:healthy/models/water_model.dart';
import '../db_functions/water_db_fn.dart';
import '../main.dart';
import 'first_page_fn.dart';
import 'package:intl/intl.dart';

import 'notification.dart';

late int waterNeeded;
int drinkedWater = 0;
int waterNeededPerGlass = 0;
bool addGlass = false;
String radioButtonValue = "Remind me every 1 Hour";
late DateTime remindingTime;
late int devideTime;
String myFormat = DateFormat('dd-MM-yyyy').format(DateTime.now());
int reminderId = 1;
bool waterProgress = false;

waterNeededPerDay() {
  if (genterValue == "Male") {
    // waterNeeded = 3;
    // (3 * 1000) / 250
    waterNeededPerGlass = 12;
  } else {
    // waterNeeded = 2.2;
    //(2.2 * 1000) / 250
    waterNeededPerGlass = 9;
  }
  // if (waterList.value.isEmpty) {
  //   return;
  // } else if (waterList.value[waterList.value.length - 1].waterDate.day ==
  //     DateTime.now().day) {
  //   drinkedWater = waterList.value[waterList.value.length - 1].waterIntake;
  // }
}

weterDrinkedInaDay() {
  if (addGlass) {
    drinkedWater++;
    addGlass = false;
  } else {
    drinkedWater--;
  }
}

weterNeedToDrink() {
  waterNeeded = waterNeededPerGlass - drinkedWater;
}

waterReminder() {
  if (radioButtonValue == "Remind me every 1 Hour") {
    remindingTime = DateTime.now().add(const Duration(hours: 1));
    AndroidAlarmManager.oneShotAt(remindingTime, reminderId, fireAlarm);
    // DateTime(2023, 07, 25, 14, 55, 00), reminderId, fireAlarm);
  } else if (radioButtonValue == "Remind me      5 Times") {
    devideTime = (24 * 60) ~/ 5;
    // devideTime = (1 * 60) ~/ 5;
    remindingTime = DateTime.now().add(Duration(minutes: devideTime));
    AndroidAlarmManager.oneShotAt(remindingTime, reminderId, fireAlarm);
  } else {
    devideTime = (24 * 60) ~/ 3;
    remindingTime = DateTime.now().add(Duration(minutes: devideTime));
    AndroidAlarmManager.oneShotAt(remindingTime, reminderId, fireAlarm);
  }
  //print(devideTime);
}

void fireAlarm() {
  Noti.showBigTextNotification(
      title: "Time to drink a glass of water",
      body: "Add it to your logs before it's too late",
      fln: flutterLocalNotificationsPlugin);
//  AndroidAlarmManager.periodic(Duration(minutes: devideTime), 1, periodicAlarm);
  AndroidAlarmManager.periodic(const Duration(hours: 1), 1, periodicAlarm);
}

void periodicAlarm() {
  Noti.showBigTextNotification(
      title: "Time to drink a glass of water",
      body: "Add it to your logs before it's too late",
      fln: flutterLocalNotificationsPlugin);
}

saveWaterDetails() async {
  await waterNeededPerDay();
  await weterNeedToDrink();
  await waterReminder();

  // final water_db = await openWater();
  // //if (water_db.isNotEmpty) {
  // print(water_db.values.first.waterTarget);
  // final waterInDay = await water_db.values.where(
  //     (element) => element.waterDate.day == DateTime(2023 - 02 - 02).day);

  // if (waterInDay.isNotEmpty) {
  //   print("11111111111111111111111");
  if (waterList.value.isEmpty) {
    addWaterCount(
      WaterModel(
          waterIntake: drinkedWater,
          waterReminder: radioButtonValue,
          waterDate: DateTime.now(),
          waterTarget: waterNeededPerGlass),
    );
    return;
  }

  if (
      //waterList.value[waterId].waterDate.day == DateTime.now().day ||
      waterList.value.last.waterDate.day == DateTime.now().day) {
    await updateWaterList(
      waterList.value.length - 1,
      WaterModel(
          waterIntake: drinkedWater,
          waterReminder: radioButtonValue,
          waterDate: DateTime.now(),
          //int.parse(DateFormat('dd-MM-yyyy').format(DateTime.now())),
          waterTarget: waterNeededPerGlass),
    );
  } else {
    await addWaterCount(
      WaterModel(
          waterIntake: drinkedWater,
          waterReminder: radioButtonValue,
          waterDate: DateTime.now(),
          waterTarget: waterNeededPerGlass),
    );
  }
}
