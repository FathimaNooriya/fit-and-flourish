import 'package:hive/hive.dart';
import '../models/weight_model.dart';
import 'package:flutter/material.dart';

ValueNotifier<List<WeightModel>> weightList = ValueNotifier([]);
late int weightId;
Future<void> addWeightToDb(WeightModel value) async {
  final weightListDb = await Hive.openBox<WeightModel>('weight_db');
  weightId = await weightListDb.add(value);
  getWeightList();
}

Future<void> getWeightList() async {
  final weightListDb = await Hive.openBox<WeightModel>('weight_db');
  weightList.value.clear();
  weightList.value.addAll(weightListDb.values);
}

Future<void> updateWeightToDb(int index, WeightModel value) async {
  final weightListDb = await Hive.openBox<WeightModel>('weight_db');
  weightListDb.putAt(index, value);
  getWeightList();
}
