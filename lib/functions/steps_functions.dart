

import 'first_page_fn.dart';

late int todaysSteps;
late int targetSteps;

targetStepsFn() {
  if (age >= 12 && age <= 19) {
    targetSteps = 6000;
  } else if (age > 19 && age <= 65) {
    targetSteps = 3000;
  }
}
