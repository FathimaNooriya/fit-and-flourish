import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'sleep_model.g.dart';

@HiveType(typeId: 20)
class SleepModel {
  @HiveField(0)
 // Duration sleepTaken;
  TimeOfDay sleepTaken;
  @HiveField(1)
  DateTime sleepDate;
  @HiveField(2)
  List<TimeOfDay> sleepTarget;
  @HiveField(3)
  DateTime nextBedTime;
  @HiveField(4)
  DateTime alamtime;

  SleepModel(
      {required this.sleepTaken,
      required this.sleepDate,
      required this.nextBedTime,
      required this.alamtime,
      required this.sleepTarget});
}
