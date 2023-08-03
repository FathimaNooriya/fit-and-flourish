
import 'package:hive/hive.dart';
 part 'walking_model.g.dart';
@HiveType(typeId: 9)
class WalkingModel {
  @HiveField(0)
  double walkDistance;
  @HiveField(1)
  double walkTime;
  @HiveField(2)
  String walkSpeed;
  @HiveField(3)
  DateTime walkDate;
  @HiveField(4)
  double? walkCalorie;
  WalkingModel(
      {required this.walkDistance,
      required this.walkTime,
      required this.walkSpeed,
      required this.walkDate,
      this.walkCalorie});
}
