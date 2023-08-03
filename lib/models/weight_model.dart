import 'package:hive/hive.dart';
part 'weight_model.g.dart';

@HiveType(typeId: 2)
class WeightModel {
  @HiveField(0)
  double weightAmount;
  @HiveField(1)
  String? weightImage;
  @HiveField(2)
  DateTime weightDate;
  @HiveField(3)
  double weightTarget;
  @HiveField(4)
  String weightTargetTime;
  @HiveField(5)
  int reminingDaysNeeded;


  WeightModel(
      {required this.weightAmount,
      this.weightImage,
      required this.weightDate,
      required this.weightTarget,
      required this.weightTargetTime,
      required this.reminingDaysNeeded});
}
