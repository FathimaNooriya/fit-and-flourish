
import 'package:hive/hive.dart';
part 'running_model.g.dart';
@HiveType(typeId: 8)
class RunningModel {
  @HiveField(0)
  double runDistance;
  @HiveField(1)
  double runTime;
  @HiveField(2)
  String runSpeed;
  @HiveField(3)
  DateTime runDate;
  @HiveField(4)
  double? runCalorie;
  RunningModel(
      {required this.runDistance,
      required this.runTime,
      required this.runSpeed,
      required this.runDate,
      this.runCalorie});
}
