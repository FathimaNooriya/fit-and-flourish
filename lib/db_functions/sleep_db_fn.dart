import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/sleep_model.dart';

int sleepId = 0;
ValueNotifier<List<SleepModel>> sleepList = ValueNotifier([]);
Future<void> addSleep(SleepModel value) async {
  final sleepListDb = await Hive.openBox<SleepModel>('sleep_db');
  sleepId = await sleepListDb.add(value);
  getSleepList();
}

Future<void> getSleepList() async {
  final sleepListDb = await Hive.openBox<SleepModel>('sleep_db');
  sleepList.value.clear();
  sleepList.value.addAll(sleepListDb.values);
}

Future<void> updateSleepList(int index, SleepModel value) async {
  final sleepListDb = await Hive.openBox<SleepModel>('sleep_db');
  sleepListDb.putAt(index, value);
  getSleepList();
}
