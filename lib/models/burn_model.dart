

import 'package:hive/hive.dart';
part 'burn_model.g.dart';
@HiveType(typeId:  7)
class BurnModel {
  @HiveField(0)
  double? swimCalorie;
  @HiveField(1)
  double? runCalorie;
  @HiveField(2)
  double? walkCalorie;
  @HiveField(3)
  DateTime burnDate;
  @HiveField(4)
  double? cyclingCalorie;
  @HiveField(5)
  double totelCalorieBurn;
  BurnModel(
      {this.swimCalorie,
      this.runCalorie,
      required this.burnDate,
      this.walkCalorie,
      this.cyclingCalorie,
      required this.totelCalorieBurn});
}
