import 'package:flutter/material.dart';
import 'package:healthy/functions/weight_fn.dart';

final formkeyRegistration = GlobalKey<FormState>();
late double bmi;
late double currentWeight;
late double hight;
late String yourFitness;
late String weeklyRate;
late String goalCalegory;
late double targetWeight;
String genterValue = "Male";
bool registation1Progress = false;
TextEditingController nameController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController heightController = TextEditingController();
TextEditingController currentWeightController = TextEditingController();
TextEditingController targetWeightController = TextEditingController();
TextEditingController sexController = TextEditingController();
String yourGoal = "Weight Loss";
late DateTime dateOfBirth;
late int age;
String name = "";

String? nameValidation(value) {
  if (value == "") {
    return "Please Enter your name";
  } else if (nameController.text.length < 3) {
    return "Enter your name properly";
  } else {
    name = nameController.text;
    return null;
  }
}

ageValidation() {
  age = dateOfBirth.year - DateTime.now().year;
}


String? heightValidation(value) {
  if (value == "") {
    return "Please Enter your height";
  } else {
    hight = double.parse(heightController.text);
    return null;
  }
}

String? currentWeightValidation(value) {
  if (value == "") {
    return "Please Enter your weight";
  } else {
    currentWeight = double.parse(currentWeightController.text);
    todaysWeight = currentWeight;
    return null;
  }
}

bodyMassIndex() {
  bmi = currentWeight * 10000 / (hight * hight);
  if (bmi < 18.5) {
    yourFitness = "You are under weight";
    yourGoal = "Weight Gain";
    goalCalegory = "Gain";
    weeklyRate = "Gain 1Kg/week";
  } else if (bmi > 25 && bmi < 30) {
    yourFitness = "You are  At risk of overweight";
    yourGoal = "Weight Loss";
    weeklyRate = "Lose 1Kg/week";
    goalCalegory = "Loss";
  } else if (bmi > 30) {
    yourFitness = "You are  overweight";
    yourGoal = "Weight Loss";
    weeklyRate = "Lose 1Kg/week";
    goalCalegory = "Loss";
  } else {
    yourFitness = "You are perfectly fit";
    yourGoal = "Maintain Weight";
    targetWeight = currentWeight;
    goalCalegory = "Maintain Weight";
    weeklyRate = "No need";
  }
}

gotoNext() async {
  if (formkeyRegistration.currentState!.validate()) {
    await bodyMassIndex();
  } else {
    return;
  }
}
