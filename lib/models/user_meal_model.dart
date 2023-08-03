import 'package:hive/hive.dart';

import 'admin_meal_model.dart';
part 'user_meal_model.g.dart';

@HiveType(typeId: 14)
class UserMealModel {
  @HiveField(0)
  String userMealDate;
  @HiveField(1)
  List<AdminMealModel> listBreakFastModel;
  @HiveField(2)
  List<AdminMealModel> listLunchModel;
  @HiveField(3)
  List<AdminMealModel> listDinnerModel;
  @HiveField(4)
  double totalMealCalorie;
  @HiveField(5)
  double totalProtein;
  @HiveField(6)
  double totalFat;
  @HiveField(7)
  double totalCarbs;
  @HiveField(8)
  double totalFiber;
  @HiveField(9)
  double? totalLunchCalorie;
  @HiveField(10)
  double? totalBreakFastCalorie;
  @HiveField(11)
  double? totalDinnerCalorie;

  UserMealModel(
      {required this.userMealDate,
      required this.listBreakFastModel,
      required this.listLunchModel,
      required this.listDinnerModel,
      required this.totalMealCalorie,
      required this.totalProtein,
      required this.totalFat,
      required this.totalCarbs,
      required this.totalFiber,
      this.totalBreakFastCalorie,
      this.totalLunchCalorie,
      this.totalDinnerCalorie});
}
