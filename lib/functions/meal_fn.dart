import 'package:healthy/db_functions/user_meal_db_fn.dart';
import 'package:healthy/functions/weight_fn.dart';
import 'package:intl/intl.dart';
import '../db_functions/admin_meal_db_fn.dart';
import '../models/admin_meal_model.dart';
import '../models/user_meal_model.dart';
import 'functions.dart';

final List<AdminMealModel> meal = [];
List<AdminMealModel> breakFastList = [];
List<AdminMealModel> lunchList = [];
List<AdminMealModel> dinnerList = [];
double totalBreakFastCalorie = 0.0;
double totallunchCalorie = 0.0;
double totaldinnerCalorie = 0.0;
double targetBreakFastCalorie = 0.0;
double targetLunchCalorie = 0.0;
double targetDinnerCalorie = 0.0;
double totalProtein = 0.0;
double totalFat = 0.0;
double totalCarbs = 0.0;
double totalFiber = 0.0;
double targetProtein = 0.0;
double targetFat = 0.0;
double targetCarbs = 0.0;
double targetFiber = 0.0;
int nextday = 1;
bool mealProgress = false;

addMealTolist(String category) async {
  await adminGetMealList();

  for (AdminMealModel element in adminMealList.value) {
    if (element.mealCategory == category) {
      meal.add(element);
    }
  }
  // meal.addAll(
  //     adminMealList.value.where((element) => element.mealCategory == category));
}

breakFastCalorie(AdminMealModel value) {
  totalBreakFastCalorie = totalBreakFastCalorie + value.mealCalorie;
}

lunchCalorie(AdminMealModel value) {
  totallunchCalorie = totallunchCalorie + value.mealCalorie;
}

dinnerCalorie(AdminMealModel value) {
  totaldinnerCalorie = totaldinnerCalorie + value.mealCalorie;
}

targertFoodCalorie() async {
  await targetNutrients();
  targetBreakFastCalorie = ((35 / 100) * dailyCalorieIntake);
  targetLunchCalorie = ((40 / 100) * dailyCalorieIntake);
  targetDinnerCalorie == ((25 / 100) * dailyCalorieIntake);
  print(".....................");
  if (userMealList.value.isNotEmpty) {
    print(".....................");
    if (userMealList.value.last.userMealDate ==
        DateFormat('dd-MM-yyyy').format(DateTime.now())) {
      if (userMealList.value.last.listBreakFastModel!.isNotEmpty) {
        breakFastList = userMealList.value.last.listBreakFastModel!;
      } else if (userMealList.value.last.listLunchModel!.isNotEmpty) {
        lunchList = userMealList.value.last.listLunchModel!;
      } else if (userMealList.value.last.listDinnerModel!.isNotEmpty) {}
      dinnerList = userMealList.value.last.listDinnerModel!;
      print(".....................");
      calorieTaken = userMealList.value.last.totalMealCalorie;
      totalProtein = userMealList.value.last.totalProtein;
      totalCarbs = userMealList.value.last.totalCarbs;
      totalFat = userMealList.value.last.totalFat;
      totalFiber = userMealList.value.last.totalFiber;
      totalBreakFastCalorie = userMealList.value.last.totalBreakFastCalorie;
      totallunchCalorie = userMealList.value.last.totalLunchCalorie;
      totaldinnerCalorie = userMealList.value.last.totalDinnerCalorie;
      print(".......zzzzzzzzzzzzzzzz..............");
    }
  }
}

totalNutritioncalorie(AdminMealModel value) {
  calorieTaken = calorieTaken + value.mealCalorie;
  totalProtein = totalProtein + value.protein;
  totalFat = totalFat + value.fat;
  totalCarbs = totalCarbs + value.carbs;
  totalFiber = totalFiber + value.fiber;
}

deleteNutritioncalorie(AdminMealModel value) {
  calorieTaken = calorieTaken - value.mealCalorie;
  totalProtein = totalProtein - value.protein;
  totalFat = totalFat - value.fat;
  totalCarbs = totalCarbs - value.carbs;
  totalFiber = totalFiber - value.fiber;
}

deleteBreakFastCalorie(AdminMealModel value) {
  totalBreakFastCalorie = totalBreakFastCalorie - value.mealCalorie;
}

deletelunchCalorie(AdminMealModel value) {
  totallunchCalorie = totallunchCalorie - value.mealCalorie;
}

deletedinnerCalorie(AdminMealModel value) {
  totaldinnerCalorie = totaldinnerCalorie - value.mealCalorie;
}

targetNutrients() {
  targetProtein = (23 / 100) * dailyCalorieIntake;
  targetFat = (10 / 100) * dailyCalorieIntake;
  targetCarbs = (55 / 100) * dailyCalorieIntake;
  targetFiber = (30 / 100) * dailyCalorieIntake;
}

deleteMealFunction(AdminMealModel data, int index) {
  deleteNutritioncalorie(data);
  if (data.mealCategory == "Brakefast") {
    deleteBreakFastCalorie(data);
    breakFastList.removeAt(index);
  } else if (data.mealCategory == "Lunch") {
    deletelunchCalorie(data);
    lunchList.removeAt(index);
  } else {
    deletedinnerCalorie(data);
    dinnerList.removeAt(index);
  }
}

saveUserMeal() {
  if (userMealList.value.isEmpty) {
    addUserMealList(UserMealModel(
      userMealDate: DateFormat('dd-MM-yyyy').format(DateTime.now()),
      listBreakFastModel: breakFastList,
      listLunchModel: lunchList,
      listDinnerModel: dinnerList,
      totalMealCalorie: calorieTaken,
      totalProtein: totalProtein,
      totalCarbs: totalCarbs,
      totalFat: totalFat,
      totalFiber: totalFiber,
      totalBreakFastCalorie: totalBreakFastCalorie,
      totalDinnerCalorie: totallunchCalorie,
      totalLunchCalorie: totaldinnerCalorie,
    ));
    return;
  }
  if (userMealList.value.last.userMealDate ==
      DateFormat('dd-MM-yyyy').format(DateTime.now())) {
    updateUserMealList(
        userMealList.value.length - 1,
        UserMealModel(
          userMealDate: DateFormat('dd-MM-yyyy').format(DateTime.now()),
          listBreakFastModel: breakFastList,
          listLunchModel: lunchList,
          listDinnerModel: dinnerList,
          totalMealCalorie: calorieTaken,
          totalProtein: totalProtein,
          totalCarbs: totalCarbs,
          totalFat: totalFat,
          totalFiber: totalFiber,
          totalBreakFastCalorie: totalBreakFastCalorie,
          totalDinnerCalorie: totaldinnerCalorie,
          totalLunchCalorie: totallunchCalorie,
        ));
  } else {
    addUserMealList(UserMealModel(
      //userMealDate: '27-07-2023',
      userMealDate: DateFormat('dd-MM-yyyy').format(DateTime.now()),
      listBreakFastModel: breakFastList,
      listLunchModel: lunchList,
      listDinnerModel: dinnerList,
      totalMealCalorie: calorieTaken,
      totalProtein: totalProtein,
      totalCarbs: totalCarbs,
      totalFat: totalFat,
      totalFiber: totalFiber,
      totalBreakFastCalorie: totalBreakFastCalorie,
      totalDinnerCalorie: totaldinnerCalorie,
      totalLunchCalorie: totallunchCalorie,
    ));
  }
}

// UserMealModel? mealOfNextDay() {
//   if (userMealList.value.last.userMealDate ==
//       DateFormat('dd-MM-yyyy').format(DateTime.now())) {
//     return userMealList.value[userMealList.value.length - 1];
//   }
//   return null;
// }
