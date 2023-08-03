import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../models/weight_model.dart';
import 'burn_fn.dart';
import 'first_page_fn.dart';
import 'functions.dart';
import '../db_functions/weight_db_fn.dart';

late double todaysWeight;
bool addWeight = false;
bool addTrgetWeight = false;
File? weightImage;
//String weeklyRate = "Gain 1Kg/week";
double weightDifferece = 10;
int reminingWeeks = 0;
//late double dailyCalorieIntake;
late double dailyCalorieIntake;

weightInaDay() {
  if (addWeight) {
    todaysWeight += .5;
    addWeight = false;
  } else {
    todaysWeight -= .5;
  }
}

setWeightGoal() {
  if (addTrgetWeight) {
    targetWeight += .5;
    addTrgetWeight = false;
  } else {
    targetWeight -= .5;
  }
}

dailyCalorieNeeded() {
  if (yourGoal == "Weight Loss") {
    switch (weeklyRate) {
      case "Lose 1Kg/week":
        {
          dailyCalorieIntake = tdee - ((7716 / 7) / 2);
          reminingWeeks = (weightDifferece / 1).ceil();
          targetBurnEnergy = (tdee - bmr) + ((7716 / 7) / 2);
          break;
        }
      case "Lose 0.75 Kg/week":
        {
          dailyCalorieIntake = tdee - (((7716 * 0.75) / 7) / 2);
          targetBurnEnergy = (tdee - bmr) + (((7716 * 0.75) / 7) / 2);
          reminingWeeks = (weightDifferece / 0.75).ceil();
          break;
        }
      case "Lose 0.50 Kg/week":
        {
          dailyCalorieIntake = tdee - (((7716 * 0.50) / 7)) / 2;
          targetBurnEnergy = (tdee - bmr) + (((7716 * 0.50) / 7) / 2);
          reminingWeeks = (weightDifferece / .50).ceil();
          break;
        }
      case "Lose 0. 25 Kg/week":
        {
          dailyCalorieIntake = tdee - (((7716 * 0.25) / 7) / 2);
          targetBurnEnergy = (tdee - bmr) + (((7716 * 0.25) / 7) / 2);
          reminingWeeks = (weightDifferece / .25).ceil();
          break;
        }
      case "Lose 0.15 Kg/week":
        {
          dailyCalorieIntake = tdee - (((7716 * 0.15) / 7) / 2);
          targetBurnEnergy = (tdee - bmr) + (((7716 * 0.15) / 7) / 2);
          reminingWeeks = (weightDifferece / .15).ceil();
          break;
        }
    }
    //dailyCalorieIntake = (tdee * 75) / 100;
  } else if (yourGoal == "Weight Gain") {
    switch (weeklyRate) {
      case 'Gain 1Kg/week':
        {
          dailyCalorieIntake = tdee + (7716 / 7) + ((7716 / 7) * 0.25);
          reminingWeeks = (weightDifferece / 1).ceil();
          break;
        }
      case "Gain 0.75 Kg/week":
        {
          dailyCalorieIntake =
              tdee + ((7716 * 0.75) / 7) + (((7716 * 0.75) / 7) * 0.25);
          reminingWeeks = (weightDifferece / 0.75).ceil();
          break;
        }
      case "Gain 0.50 Kg/week":
        {
          dailyCalorieIntake =
              tdee + ((7716 * 0.50) / 7) + (((7716 * 0.50) / 7) * 0.25);
          reminingWeeks = (weightDifferece / 0.50).ceil();
          break;
        }
      case "Gain 0. 25 Kg/week":
        {
          dailyCalorieIntake =
              tdee + ((7716 * 0.25) / 7) + (((7716 * 0.25) / 7) * 0.25);
          reminingWeeks = (weightDifferece / 0.25).ceil();
          break;
        }
      case "Gain 0.15 Kg/week":
        {
          dailyCalorieIntake =
              tdee + ((7716 * 0.15) / 7) + (((7716 * 0.15) / 7) * 0.25);
          reminingWeeks = (weightDifferece / 0.15).ceil();
          break;
        }
    }
    //dailyCalorieIntake = (tdee * 110) / 100;
  } else {
    dailyCalorieIntake = (tdee * 0.15);
  }
}

daysOfGoalWeight() {
  if (yourGoal == "Weight Loss") {
    weightDifferece = currentWeight - targetWeight;
  } else {
    weightDifferece = targetWeight - currentWeight;
  }
}

saveWeightDetails() {
  if (weightList.value.isEmpty) {
    addWeightToDb(WeightModel(
      weightAmount: todaysWeight,
      weightImage: weightImage!.path,
      weightDate: DateTime.now(),
      weightTarget: targetWeight,
      weightTargetTime: weeklyRate,
      reminingDaysNeeded: reminingWeeks,
    ));
    return;
  }
  if (
      //weightList.value[weightId].weightDate.day == DateTime.now().day
      weightList.value[weightList.value.length - 1].weightDate.day ==
          DateTime.now().day) {
    updateWeightToDb(
        weightList.value.length - 1,
        WeightModel(
          weightAmount: todaysWeight,
          weightImage: weightImage!.path,
          weightDate: DateTime.now(),
          weightTarget: targetWeight,
          weightTargetTime: weeklyRate,
          reminingDaysNeeded: reminingWeeks,
        ));
  } else {
    addWeightToDb(WeightModel(
      weightAmount: todaysWeight,
      weightImage: weightImage!.path,
      // weightDate: DateTime(2023, 07, 4, 11, 12, 10),
      weightDate: DateTime.now(),
      weightTarget: targetWeight,
      weightTargetTime: weeklyRate,
      reminingDaysNeeded: reminingWeeks,
    ));
  }
}

Future pickWeightImage(ImageSource source1) async {
  try {
    final imagePic = await ImagePicker().pickImage(source: source1);
    if (imagePic == null) {
      return;
    }
    final imagePath = File(imagePic.path);

    weightImage = imagePath;

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
