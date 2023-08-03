// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';


@HiveType(typeId: 6)
class MealModel {
  @HiveField(0)
  int? meal_id;
  @HiveField(1)
  String mealName;
  @HiveField(2)
  String mealCategory;
  @HiveField(3)
  double mealCalorie;
  @HiveField(4)
  double? protein;
  @HiveField(5)
  double? fat;
  @HiveField(6)
  double? carbs;
  @HiveField(7)
  double? fiber;
  @HiveField(8)
  int mealAmount;
  @HiveField(9)
  double? totalMealCategoryCalorie;
  @HiveField(10)
  double? totalMealCalorie;
  @HiveField(11)
  DateTime mealDate;
  @HiveField(12)
  String mealImage;

  MealModel(
      {this.meal_id,
      required this.mealName,
      required this.mealCategory,
      required this.mealCalorie,
      required this.mealAmount,
      required this.mealImage,
      this.carbs,
      this.fat,
      this.protein,
      this.fiber,
      this.totalMealCalorie,
      this.totalMealCategoryCalorie,
      required this.mealDate});
}
