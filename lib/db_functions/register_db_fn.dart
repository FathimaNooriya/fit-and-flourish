import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/registration_model.dart';

ValueNotifier<List<RegistrationModel>> registerList = ValueNotifier([]);
Future<void> newRegister(RegistrationModel value) async {
  final registerDB = await Hive.openBox<RegistrationModel>('register_db');
  await registerDB.add(value);
  // registerList.value.clear();
  // registerList.value.addAll(registerDB.values);
  getRegister();
}

Future<void> getRegister() async {
  final registerDB = await Hive.openBox<RegistrationModel>('register_db');
  registerList.value.clear();
  registerList.value.addAll(registerDB.values);
}
