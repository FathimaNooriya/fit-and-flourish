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
List<AdminMealModel> constMealList = [
  AdminMealModel(
      mealName: "Chapati",
      mealCategory: "Dinner",
      mealCalorie: 85,
      mealImage: "assets/images/Chapatis.jpg",
      carbs: 17.4,
      fat: 0.4,
      protein: 3,
      fiber: 2.7,
      mealAmount: "1"),
  AdminMealModel(
      mealName: "Milk",
      mealCategory: "Brakefast",
      mealCalorie: 168,
      mealImage: 'assets/images/milk.jpg',
      carbs: 11,
      fat: 10.3,
      protein: 8,
      fiber: 0,
      mealAmount: "1 glass"),
  AdminMealModel(
      mealName: "Cheaken Biriyani",
      mealCategory: "Lunch",
      mealCalorie: 167,
      mealImage: 'assets/images/chiken biriyani.webp',
      // 'assets/images/chicken_biriyani.jpg',
      carbs: 17.7,
      fat: 6.8,
      protein: 8,
      fiber: .6,
      mealAmount: "1 bowl"),
  AdminMealModel(
      mealName: "Fried Rice",
      mealCategory: "Lunch",
      mealCalorie: 136,
      mealImage: 'assets/images/fried-rice.jpg',
      // 'assets/images/chicken_biriyani.jpg',
      carbs: 22.3,
      fat: 3.9,
      protein: 2.3,
      fiber: 0.9,
      mealAmount: "1 bowl"),
  AdminMealModel(
      mealName: "Kuboos",
      mealCategory: "Dinner",
      mealCalorie: 124,
      mealImage: "assets/images/kuboos.jpg",
      carbs: 20.7,
      fat: 3.1,
      protein: 3,
      fiber: .9,
      mealAmount: "1"),
  AdminMealModel(
      mealName: "Idly",
      mealCategory: "Brakefast",
      mealCalorie: 73,
      mealImage: 'assets/images/idly.webp',
      carbs: 15.2,
      fat: 0.3,
      protein: 2.2,
      fiber: 1.3,
      mealAmount: "1 "),
  AdminMealModel(
      mealName: "Tea",
      mealCategory: "Brakefast",
      mealCalorie: 73,
      mealImage: 'assets/images/tea.png',
      carbs: 8.3,
      fat: 3.2,
      protein: 3,
      fiber: 0,
      mealAmount: "1 glass"),
];

addMealTolist(String category) async {
  await adminGetMealList();
  List<AdminMealModel> myMealList = constMealList + adminMealList.value;

  for (AdminMealModel element in myMealList) {
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
  if (userMealList.value.isNotEmpty) {
    if (userMealList.value.last.userMealDate ==
        DateFormat('dd-MM-yyyy').format(DateTime.now())) {
      if (userMealList.value.last.listBreakFastModel!.isNotEmpty) {
        breakFastList = userMealList.value.last.listBreakFastModel!;
      } else if (userMealList.value.last.listLunchModel!.isNotEmpty) {
        lunchList = userMealList.value.last.listLunchModel!;
      } else if (userMealList.value.last.listDinnerModel!.isNotEmpty) {}
      dinnerList = userMealList.value.last.listDinnerModel!;
      calorieTaken = userMealList.value.last.totalMealCalorie;
      totalProtein = userMealList.value.last.totalProtein;
      totalCarbs = userMealList.value.last.totalCarbs;
      totalFat = userMealList.value.last.totalFat;
      totalFiber = userMealList.value.last.totalFiber;
      totalBreakFastCalorie = userMealList.value.last.totalBreakFastCalorie;
      totallunchCalorie = userMealList.value.last.totalLunchCalorie;
      totaldinnerCalorie = userMealList.value.last.totalDinnerCalorie;
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
