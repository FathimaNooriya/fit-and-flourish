import 'package:hive/hive.dart';
part 'cycling_model.g.dart';
@HiveType(typeId: 10)
class CyclingModel {
  @HiveField(0)
  double cycleDistance;
  @HiveField(1)
  double cycleTime;
  @HiveField(2)
  DateTime cycleDate;
  @HiveField(3)
  double? cycleCalorie;
  CyclingModel(
      {required this.cycleDistance,
      required this.cycleTime,
      required this.cycleDate,
      this.cycleCalorie});
}
