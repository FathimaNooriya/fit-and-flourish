import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthy/functions/functions.dart';
import 'package:healthy/functions/sign_fn.dart';
import 'package:healthy/models/admin_meal_model.dart';
import 'package:healthy/screens/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../db_functions/admin_meal_db_fn.dart';
import '../db_functions/register_db_fn.dart';
import '../main.dart';
import '../screens/admin_home.dart';
import '../screens/registration.dart';
import 'burn_fn.dart';
import 'first_page_fn.dart';
import 'water_fn.dart';
import 'weight_fn.dart';

final formkeyAdminLogin = GlobalKey<FormState>();
final formkeyAddMeal = GlobalKey<FormState>();
TextEditingController adminUsername = TextEditingController();
TextEditingController adminPassword = TextEditingController();
TextEditingController mealNameController = TextEditingController();
TextEditingController mealAmountController = TextEditingController();
TextEditingController mealCalorieController = TextEditingController();
TextEditingController proteinController = TextEditingController();
TextEditingController fatsController = TextEditingController();
TextEditingController carbsController = TextEditingController();
TextEditingController fiberController = TextEditingController();
late double mealCalorie;
late double protein;
late double fat;
late double carbs;
late double fiber;
bool addMealImage = false;
File? mealImage;
String adminDropDownValue = "Brakefast";

String? userNameValidation() {
  if (adminUsername.text.isEmpty) {
    return "Please Enter the user name";
  }
  return null;
}

String? passwordValidation() {
  if (adminPassword.text.isEmpty) {
    return "Please Enter the password name";
  } else {
    return null;
  }
}

String? mealNameValidation(String value) {
  if (value == "") {
    return "Please Enter the meal name";
  } else {
    return null;
  }
}

String? mealAmountValidation(String value) {
  if (value == "") {
    return "Please Enter the meal Amount";
  } else {
    return null;
  }
}

String? mealCalorieValidation(String value) {
  if (value == "") {
    return "Please Enter the calorie Amount";
  } else {
    mealCalorie = double.parse(value);
    return null;
  }
}

String? mealProteinValidation(String value) {
  protein = double.parse(value);
  return null;
}

String? mealFatsValidation(String value) {
  fat = double.parse(value);
  return null;
}

String? mealCarbsValidation(String value) {
  carbs = double.parse(value);
  return null;
}

String? mealFiberValidation(String value) {
  fiber = double.parse(value);
  return null;
}

Future pickImage(ImageSource source1) async {
  try {
    final imagePic = await ImagePicker().pickImage(source: source1);
    if (imagePic == null) {
      return;
    }
    final imagePath = File(imagePic.path);

    mealImage = imagePath;

    // imageList.value[0] = await ImagePicker().pickImage(source: source1);
    // print("oooooooooooooooooooooooooo");
    // print(imageList.value[0]);
    //  if (imageList.value[0] == null) {
    //    return;
    //  }
    // final imageTemporary = File(imageList.value[0]!.path);
    // this.imageList.value[0] = imageTemporary as XFile?;
  } on PlatformException catch (e) {
    return e;
  }
}

Future<void> saveAdminMeal(bool editMeal, context, [int? id]) async {
  if (mealImage != null) {
    bool isValidateAddMeal = formkeyAddMeal.currentState!.validate();
    if (isValidateAddMeal) {
      if (editMeal == false) {
        await adminAddToMealList(AdminMealModel(
            mealName: mealNameController.text.trim(),
            mealCategory: adminDropDownValue,
            mealCalorie: mealCalorie,
            mealImage: mealImage!.path,
            carbs: carbs,
            fat: fat,
            protein: protein,
            mealAmount: mealAmountController.text.trim(),
            fiber: fiber));
        Navigator.of(context).pop();
      } else {
        await adminUpdateMeal(
            AdminMealModel(
                mealName: mealNameController.text.trim(),
                mealCategory: adminDropDownValue,
                mealAmount: mealAmountController.text.trim(),
                mealCalorie: mealCalorie,
                mealImage: mealImage!.path,
                carbs: carbs,
                fat: fat,
                protein: protein,
                fiber: fiber),
            id!);
        // openBox();
        Navigator.of(context).pop();
      }
      addMealImage = false;
    } else {
      addMealImage = true;
      return;
    }
    clearData();
  }
}

void clearData() {
  mealNameController.clear();
  mealAmountController.clear();
  mealCalorieController.clear();
  proteinController.clear();
  fatsController.clear();
  carbsController.clear();
  fiberController.clear();
  mealImage = null;
}

adminlogin(context) async {
  if (!formkeyAdminLogin.currentState!.validate()) {
    return;
  } else {
    final sharedpre = await SharedPreferences.getInstance();
    if (adminPassword.text == "1234" && adminUsername.text == "fathima") {
      await sharedpre.setBool(adminSaveKey, true);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AdminHomeScreen()),
      );
    } else if (sharedpre.getString(userName) == adminUsername.text &&
        sharedpre.getString(userPassword) == adminPassword.text) {
      await sharedpre.setBool(userSaveKey, true);

      if (registerList.value.isNotEmpty) {
        name = registerList.value.first.name;
        hight = registerList.value.first.height;
        currentWeight = registerList.value.first.currentWeight;
        genterValue = registerList.value.first.genter;
        age = registerList.value.first.age;
        activity = registerList.value.first.activityLevel;
        yourGoal = registerList.value.first.goal;
        if (registerList.value.first.goal != "Maintain Weight") {
          weeklyRate = registerList.value.first.weeklyRate!;
          targetWeight = registerList.value.first.targetWeight!;
        }
        await basalMetabolicRate();
        await totalDailyEneryExpenditure();
        await dailyCalorieNeeded();
        await waterNeededPerDay();
        await daysOfGoalWeight();
        await totalEneryShouldBurn();
        await weterNeedToDrink();
        await waterReminder();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => const HomeScreen())));
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const RegisrationPage()),
        );
      }
    } else {
      const Text("User Name & password does not mach");
    }
    adminClearData();
  }
}

adminClearData() {
  adminPassword.clear();
  adminUsername.clear();
}

adminLogoutFn() {}
