// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_meal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdminMealModelAdapter extends TypeAdapter<AdminMealModel> {
  @override
  final int typeId = 11;

  @override
  AdminMealModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdminMealModel(
      meal_id: fields[0] as int?,
      mealName: fields[1] as String,
      mealCategory: fields[2] as String,
      mealCalorie: fields[3] as double,
      mealImage: fields[8] as String,
      carbs: fields[6] as double,
      fat: fields[5] as double,
      protein: fields[4] as double,
      fiber: fields[7] as double,
      mealAmount: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AdminMealModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.meal_id)
      ..writeByte(1)
      ..write(obj.mealName)
      ..writeByte(2)
      ..write(obj.mealCategory)
      ..writeByte(3)
      ..write(obj.mealCalorie)
      ..writeByte(4)
      ..write(obj.protein)
      ..writeByte(5)
      ..write(obj.fat)
      ..writeByte(6)
      ..write(obj.carbs)
      ..writeByte(7)
      ..write(obj.fiber)
      ..writeByte(8)
      ..write(obj.mealImage)
      ..writeByte(9)
      ..write(obj.mealAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdminMealModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
