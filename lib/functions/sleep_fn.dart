import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import '../db_functions/sleep_db_fn.dart';
import '../main.dart';
import '../models/sleep_model.dart';
import 'notification.dart';

late TimeOfDay sleepHours;
late TimeOfDay targetSleepHours;
late TimeOfDay targetSleepHours2;
TimeOfDay nextBedTime = const TimeOfDay(hour: 0, minute: 0);
TimeOfDay alamTime = const TimeOfDay(hour: 0, minute: 0);
Duration reminingTimeForbed =
    const Duration(days: 0, hours: 0, minutes: 0, seconds: 0);
late DateTime alam;
late DateTime bedTime;
late double sleepPerformance;
int sleepPerformancePercet = 0;
String sleepQuality = "";
int alarmId = 1;
Duration sleepingHours = const Duration(days: 0, hours: 0, minutes: 0, seconds: 0);
bool alarmSwich = false;
TimeOfDay sleepTakeninInt = const TimeOfDay(hour: 0, minute: 0);
bool sleepProgres = false;

sleepTaken() {
//  sleepHours = alamTime.difference(nextBedTime) as DateTime;
}

sleepTargetNeeded() {
  //dateTimeFormet('dd-MM-yyyy').format();
  targetSleepHours = const TimeOfDay(hour: 7, minute: 00);
  targetSleepHours2 = const TimeOfDay(hour: 9, minute: 00);
  bedTime = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, nextBedTime.hour, nextBedTime.minute);
  if (nextBedTime.period != alamTime.period) {
    alam = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 1, alamTime.hour, alamTime.minute);
   // print("PM");
  } else {
    alam = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, alamTime.hour, alamTime.minute);

  //  print("AM");
  }

  reminingTimeForbed = bedTime.difference(DateTime.now());
  sleepingHours = alam.difference(bedTime);
  sleepTakeninInt = TimeOfDay(
      hour: sleepingHours.inHours.round(),
      minute: sleepingHours.inMinutes % 60);

  if (alam == DateTime.now()) {
    Noti.showBigTextNotification(
        title: "New message title",
        body: "Your long body",
        fln: flutterLocalNotificationsPlugin);
  }

  if (sleepingHours.inHours >= targetSleepHours.hour &&
      sleepingHours.inHours <= targetSleepHours2.hour) {
    sleepPerformancePercet = 100;
    sleepQuality = "Good Sleep";
  } else if (sleepingHours.inHours <= targetSleepHours.hour) {
    sleepPerformance = (sleepingHours.inHours / targetSleepHours.hour) * 100;
    sleepPerformancePercet = sleepPerformance.round();
    sleepQuality = "Short Sleep";
  } else {
    sleepPerformance = (sleepingHours.inHours / targetSleepHours2.hour) * 100;
    sleepPerformancePercet = sleepPerformance.round();
    sleepQuality = "Over Sleep";
  }

  // print(sleepPerformance);
  // Duration targetSleepHours1 = DateTime.parse(date2) as Duration;
  // nextBedTime1 = targetSleepHours.difference(targetSleepHours1);
//  print(targetSleepHours.day);
  //print(targetSleepHours1);
  // print(nextBedTime1.day);
}

setAlarm() async {
  await sleepTargetNeeded();
  AndroidAlarmManager.oneShotAt(alam, alarmId, fireAlarm);
}

void fireAlarm() {
  Noti.showBigTextNotification(
      title: "Time to wake up",
      body: "Good morning....",
      fln: flutterLocalNotificationsPlugin);

  // AndroidAlarmManager.periodic(Duration(minutes: 01), 1, periodicAlarm);
}

// void periodicAlarm() {

//   Noti.showBigTextNotification(
//       title: "Time to drink a glass of water",
//       body: "Add it to your logs before it's too late",
//       fln: flutterLocalNotificationsPlugin);
//   print("Alam periodically Fiered At${DateTime.now()}");
// }

saveSleep() {
  if (sleepList.value.isEmpty) {
    addSleep(SleepModel(
      alamtime: alam,
      nextBedTime: bedTime,
      sleepDate: DateTime.now(),
      //sleepTaken: sleepingHours,
      sleepTaken: sleepTakeninInt,
      sleepTarget: [targetSleepHours, targetSleepHours2],
    ));
    return;
  }
  if (sleepList.value[sleepId].sleepDate.day == DateTime.now().day) {
    updateSleepList(
        sleepId,
        SleepModel(
          alamtime: alam,
          nextBedTime: bedTime,
          sleepDate: DateTime.now(),
          //sleepTaken: sleepingHours,
          sleepTaken: sleepTakeninInt,
          sleepTarget: [targetSleepHours, targetSleepHours2],
        ));
  } else {
    addSleep(SleepModel(
      alamtime: alam,
      nextBedTime: bedTime,
      sleepDate: DateTime.now(),
      //sleepTaken: sleepingHours,
      sleepTaken: sleepTakeninInt,
      sleepTarget: [targetSleepHours, targetSleepHours2],
    ));
  }
}
