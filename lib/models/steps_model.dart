

import 'package:hive/hive.dart';
part 'steps_model.g.dart';
@HiveType(typeId: 4)
class StepsModel {
   @HiveField(0)
  int stepsWalked;
   @HiveField(1)
  DateTime stepsDate;
   @HiveField(2)
  int stepsTarget;

  StepsModel(
      {required this.stepsWalked,
      required this.stepsDate,
      required this.stepsTarget});
}
