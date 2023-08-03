// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';
part 'admin_meal_model.g.dart';

@HiveType(typeId: 11)
class AdminMealModel {
  @HiveField(0)
  int? meal_id;
  @HiveField(1)
  String mealName;
  @HiveField(2)
  String mealCategory;
  @HiveField(3)
  double mealCalorie;
  @HiveField(4)
  double protein;
  @HiveField(5)
  double fat;
  @HiveField(6)
  double carbs;
  @HiveField(7)
  double fiber;
  @HiveField(8)
  String mealImage;
  @HiveField(9)
  String mealAmount;

  AdminMealModel({
    this.meal_id,
    required this.mealName,
    required this.mealCategory,
    required this.mealCalorie,
    required this.mealImage,
    required this.carbs,
    required this.fat,
    required this.protein,
    required this.fiber,
    required this.mealAmount,
  });
}
