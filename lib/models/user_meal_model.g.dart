// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_meal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserMealModelAdapter extends TypeAdapter<UserMealModel> {
  @override
  final int typeId = 14;

  @override
  UserMealModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserMealModel(
      userMealDate: fields[0] as String,
      listBreakFastModel: (fields[1] as List).cast<AdminMealModel>(),
      listLunchModel: (fields[2] as List).cast<AdminMealModel>(),
      listDinnerModel: (fields[3] as List).cast<AdminMealModel>(),
      totalMealCalorie: fields[4] as double,
      totalProtein: fields[5] as double,
      totalFat: fields[6] as double,
      totalCarbs: fields[7] as double,
      totalFiber: fields[8] as double,
      totalBreakFastCalorie: fields[10] as double?,
      totalLunchCalorie: fields[9] as double?,
      totalDinnerCalorie: fields[11] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, UserMealModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.userMealDate)
      ..writeByte(1)
      ..write(obj.listBreakFastModel)
      ..writeByte(2)
      ..write(obj.listLunchModel)
      ..writeByte(3)
      ..write(obj.listDinnerModel)
      ..writeByte(4)
      ..write(obj.totalMealCalorie)
      ..writeByte(5)
      ..write(obj.totalProtein)
      ..writeByte(6)
      ..write(obj.totalFat)
      ..writeByte(7)
      ..write(obj.totalCarbs)
      ..writeByte(8)
      ..write(obj.totalFiber)
      ..writeByte(9)
      ..write(obj.totalLunchCalorie)
      ..writeByte(10)
      ..write(obj.totalBreakFastCalorie)
      ..writeByte(11)
      ..write(obj.totalDinnerCalorie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserMealModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
