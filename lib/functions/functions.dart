import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthy/functions/water_fn.dart';
import 'package:healthy/functions/weight_fn.dart';
import '../db_functions/register_db_fn.dart';
import '../models/registration_model.dart';
import 'burn_fn.dart';
import 'first_page_fn.dart';

final formkeyRegistration2 = GlobalKey<FormState>();

late double bmr;
late double tdee;
bool regi2progress = false;
double calorieTaken = 0;
String activity = "Sedentary";
String selectedChoiceChip = 'Hi User..';

String? targetWeightValidation() {
  if (targetWeightController.text == "") {
    return "Please Enter your target weight";
  } else {
    targetWeight = double.parse(targetWeightController.text);
    return null;
  }
}

basalMetabolicRate() {
//double weight, double hight, int age

  if (genterValue == "Male") {
    bmr = (10 * currentWeight) + (6.25 * hight) - (5 * age) + 5;
  } else {
    bmr = (10 * currentWeight) + (6.25 * hight) - (5 * age) - 161;
  }
}

totalDailyEneryExpenditure() {
  switch (activity) {
    case 'Sedentary':
      {
        tdee = 1.2 * bmr;
        break;
      }
    case "Lightly Active":
      {
        tdee = 1.375 * bmr;
        break;
      }
    case "Moderately Active":
      {
        tdee = 1.55 * bmr;
        break;
      }
    case "Very Active":
      {
        tdee = 1.725 * bmr;
        break;
      }
    case "Extremely Active":
      {
        tdee = 1.9 * bmr;
        break;
      }
  }
}

saveRegistration() async {
  if (formkeyRegistration2.currentState!.validate()) {
    //  await bodyMassIndex();
    await basalMetabolicRate();
    await totalDailyEneryExpenditure();
    await dailyCalorieNeeded();
    await waterNeededPerDay();
    await daysOfGoalWeight();
    await totalEneryShouldBurn();
    await weterNeedToDrink();
    await waterReminder();

    //await openWater();
    await newRegister(RegistrationModel(
      name: nameController.text,
      genter: genterValue,
      height: double.parse(heightController.text),
      currentWeight: double.parse(currentWeightController.text),
      targetWeight: double.parse(targetWeightController.text),
      age: age,
      activityLevel: activity,
      goal: yourGoal,
      weeklyRate: weeklyRate,
    ));
    // print("Your bmr");
    // print(bmr);
    // print("Your tdee");
    // print(tdee);
    // print("Your Daily Calorie intake.....................................");
    // print(await dailyCalorieIntake);
    cleardata();
  }
}

cleardata() {
  nameController.clear();
  ageController.clear();
  heightController.clear();
  currentWeightController.clear();
  targetWeightController.clear();
  sexController.clear();
  runningDistanceController.clear();
  runningTimeController.clear();
}





// weightGoalOntap(){
//   if(yourGoal.codeUnits){

//   }
// }

// DateTimePicker(
//   type: DateTimePickerType.dateTimeSeparate,
//   dateMask: 'd MMM, yyyy',
//   initialValue = DateTime.now().toString(),
//   firstDate: DateTime(2000),
//   lastDate: DateTime(2100),
//   icon: Icon(Icons.event),
//   dateLabelText: 'Date',
//   timeLabelText: "Hour",
//   selectableDayPredicate: (date) {
//     // Disable weekend days to select from the calendar
//     if (date.weekday == 6 || date.weekday == 7) {
//       return false;
//     }

//     return true;
//   },
//   onChanged: (val) => print(val),
//   validator: (val) {
//     print(val);
//     return null;
//   },
//   onSaved: (val) => print(val),
// );