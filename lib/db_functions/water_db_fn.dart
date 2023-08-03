// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member


import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/water_model.dart';

late int waterId;
ValueNotifier<List<WaterModel>> waterList = ValueNotifier([]);
Future<void> addWaterCount(WaterModel value) async {
  //{required int waterIntake, required DateTime waterDate, required int waterTarget}
  final waterListDb = await Hive.openBox<WaterModel>('water_db');
  waterId = await waterListDb.add(value);
  getWaterList();
//  await updateWaterList(value.waterDate, value);
  waterList.notifyListeners();
}


Future<void> getWaterList() async {
  final waterListDb = await Hive.openBox<WaterModel>('water_db');
  //await waterListDb.clear();
  waterList.value.clear();
  waterList.value.addAll(waterListDb.values);
  waterList.notifyListeners();
}

Future<void> updateWaterList(int id, WaterModel value) async {
  final waterListDb = await Hive.openBox<WaterModel>('water_db');
  waterListDb.put(id, value);

  getWaterList();
  waterList.notifyListeners();
}
