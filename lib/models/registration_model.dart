import 'package:hive/hive.dart';
part 'registration_model.g.dart';

@HiveType(typeId: 1)
class RegistrationModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  @HiveField(2)
  String genter;
  @HiveField(3)
  double height;
  @HiveField(4)
  double currentWeight;
  @HiveField(5)
  double? targetWeight;
  @HiveField(6)
  String goal;
  @HiveField(7)
  String activityLevel;
  @HiveField(8)
  String? weeklyRate;
  RegistrationModel(
      {required this.name,
      required this.age,
      required this.genter,
      required this.height,
      required this.currentWeight,
      this.targetWeight,
      required this.goal,
      required this.activityLevel,
      this.weeklyRate});
}
