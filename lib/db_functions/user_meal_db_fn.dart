import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/user_meal_model.dart';

int userMealId = 0;
ValueNotifier<List<UserMealModel>> userMealList = ValueNotifier([]);
Future<void> addUserMealList(UserMealModel value) async {
  final userMealListDb = await Hive.openBox<UserMealModel>('user_meal_db');
  userMealId = await userMealListDb.add(value);
  getUserMealList();
}

Future<void> getUserMealList() async {
  final userMealListDb = await Hive.openBox<UserMealModel>('user_meal_db');
  userMealList.value.clear();
  userMealList.value.addAll(userMealListDb.values);
}

Future<void> updateUserMealList(int index, UserMealModel value) async {
  final userMealListDb = await Hive.openBox<UserMealModel>('user_meal_db');
  userMealListDb.putAt(index, value);
  getUserMealList();
}
