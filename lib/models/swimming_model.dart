import 'package:hive/hive.dart';
part 'swimming_model.g.dart';

@HiveType(typeId: 12)
class SwimmingModel {
  @HiveField(0)
  double swimTime;
  @HiveField(1)
  String swimSpeed;
  @HiveField(2)
  DateTime swimDate;
  @HiveField(3)
  double? swimCalorie;
  SwimmingModel(
      {required this.swimTime,
      required this.swimSpeed,
      required this.swimDate,
      this.swimCalorie});
}
