import 'package:hive/hive.dart';

import '../models/burn_model.dart';

import 'package:flutter/material.dart';

ValueNotifier<List<BurnModel>> burnList = ValueNotifier([]);
Future<void> addToBurnList(BurnModel value) async {
  final burnListDb = await Hive.openBox<BurnModel>('burn_db');
  await burnListDb.add(value);
}

Future<void> getburnList() async {
  final burnListDb = await Hive.openBox<BurnModel>('burn_db');
  burnList.value.clear();
  burnList.value.addAll(burnListDb.values);
}
