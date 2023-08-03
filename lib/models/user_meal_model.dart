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

  UserMealModel({
    required this.userMealDate,
    required this.listBreakFastModel,
    required this.listLunchModel,
    required this.listDinnerModel,
  });
}
