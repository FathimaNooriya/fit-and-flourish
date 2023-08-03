import 'package:hive/hive.dart';
part 'water_model.g.dart';

@HiveType(typeId: 3)
class WaterModel extends HiveObject {
  @HiveField(0)
  int waterIntake;
  @HiveField(1)
  String waterReminder;
  @HiveField(2)
  DateTime waterDate;
  @HiveField(3)
  int waterTarget;
  @HiveField(4)
  int? waterId;

  WaterModel(
      {required this.waterIntake,
      required this.waterReminder,
      required this.waterDate,
      required this.waterTarget,
      this.waterId});
}
