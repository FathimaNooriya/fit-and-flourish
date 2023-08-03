import 'package:flutter/material.dart';
import '../screens/burn_page.dart';
import 'first_page_fn.dart';
import 'functions.dart';

final formkeyRunning = GlobalKey<FormState>();
final formkeyWalking = GlobalKey<FormState>();
final formkeyCycling = GlobalKey<FormState>();
final formkeySwimming = GlobalKey<FormState>();
TextEditingController runningDistanceController = TextEditingController();
TextEditingController runningTimeController = TextEditingController();
TextEditingController walkingDistanceController = TextEditingController();
TextEditingController walkingTimeController = TextEditingController();
TextEditingController cyclingDistanceController = TextEditingController();
TextEditingController cyclingTimeController = TextEditingController();
TextEditingController swimmingTimeController = TextEditingController();
bool cycleprogres = false;
//late double targetBurnEnergy;
double targetBurnEnergy = 0;
late double burnedEnergy;
late double timeInMin;
late double met;
late String workouts;
String speed = "";
//late double Distance;
late double runSpeed;
late double walkSpeed;
double totalburnedCalorie = 0;

totalEneryShouldBurn() {
  targetBurnEnergy = tdee - bmr;
  if (targetBurnEnergy < 220) {
    targetBurnEnergy = 220;
  }
}

eneryBurnedFromWorkouts() {
  switch (workouts) {
    case 'Running':
      {
        // runSpeed = Distance * 60 / timeInMin;
        if (speed == "Slow (8 km/h)") {
          met = 7.5;
        } else if (speed == "Moderate (9.6 km/h)") {
          met = 9.8;
        } else if (speed == "Fast (12.9 km/h)") {
          met = 11.8;
        }
        break;
      }
    case "Walking":
      {
        //   walkSpeed = Distance * 60 / timeInMin;
        if (speed == "Slow (3.2 km/h)") {
          met = 2.9;
        } else if (speed == "Moderate (5.6 km/h)") {
          met = 3.9;
        } else if (speed == "Fast (7.2 km/h)") {
          met = 5.0;
        }
        break;
      }
    case "Cycling":
      {
        if (speed == "Leisurely biking(16 km/h)") {
          met = 4.0;
        } else if (speed == "Moderate biking(19.3-22.4 km/h)") {
          met = 3.9;
        } else if (speed == "Fast (22.5-25.7 km/h)") {
          met = 5.0;
        }
        break;
      }
    case "Swimming":
      {
        if (speed == "Light") {
          met = 5.0;
        } else if (speed == "Vigorous") {
          met = 8.0;
        }
        break;
      }
  }

  // Calories Burned = 1.05 * MET value * body weight (in kg) * exercise duration (in hours)
  burnedEnergy = 1.05 * met * currentWeight * timeInMin / 60;
  timeInMin = 0;
  // print(workouts);
  // print(speed);
  // print(met);
  // print(burnedEnergy);
}

// String? runningDistanceValidation() {
//   if (runningDistanceController.text == "") {
//     return "Please Enter the distace you run";
//   } else {
//     Distance = double.parse(runningDistanceController.text);
//     return null;
//   }
// }

String? runningTimeValidation() {
  if (runningTimeController.text == "") {
    return "Please Enter the time you run";
  } else {
    timeInMin = double.parse(runningTimeController.text);
    return null;
  }
}

trackRunning(context) async {
  final isValiedRun = formkeyRunning.currentState!.validate();
  if (!isValiedRun) {
    return;
  } else {
    await eneryBurnedFromWorkouts();
    totalburnedCalorie = totalburnedCalorie + burnedEnergy;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const BurnScreen()));
  }
}

// String? walkingDistanceValidation() {
//   if (walkingDistanceController.text == "") {
//     return "Please Enter the distace you walk";
//   } else {
//     Distance = double.parse(walkingDistanceController.text);
//     return null;
//   }
// }

String? walkingTimeValidation() {
  if (walkingTimeController.text == "") {
    return "Please Enter the time you walk";
  } else {
    timeInMin = double.parse(walkingTimeController.text);

    return null;
  }
}

trackWalking(context) {
  final isValiedwalk = formkeyWalking.currentState!.validate();
  if (!isValiedwalk) {
    return;
  } else {
    eneryBurnedFromWorkouts();
    totalburnedCalorie = totalburnedCalorie + burnedEnergy;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const BurnScreen()));
  }
}

// String? cyclingDistanceValidation(String s) {
//   if (cyclingDistanceController.text == "") {
//     return "Please Enter the distace you cycle";
//   } else {
//     Distance = double.parse(cyclingDistanceController.text);
//     return null;
//   }
// }

String? cyclingTimeValidation() {
  if (cyclingTimeController.text == "") {
    return "Please Enter the time you cycle";
  } else {
    timeInMin = double.parse(cyclingTimeController.text);
    return null;
  }
}

 trackCycling(context) {
  final isValiedCycling = formkeyCycling.currentState!.validate();
  if (!isValiedCycling) {
    return;
  } else {
    
    // await eneryBurnedFromWorkouts();
    // totalburnedCalorie = totalburnedCalorie + burnedEnergy;
    // cycleprogres = false;
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => BurnScreen()));
  }
}

String? swimmingTimeValidation() {
  if (swimmingTimeController.text == "") {
    return "Please Enter the time you swim";
  } else {
    timeInMin = double.parse(swimmingTimeController.text);
    return null;
  }
}

trackSwimming(context) {
  final isValiedSwimming = formkeySwimming.currentState!.validate();
  if (!isValiedSwimming) {
    return;
  } else {
    eneryBurnedFromWorkouts();
    totalburnedCalorie = totalburnedCalorie + burnedEnergy;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const BurnScreen()));
  }
}
