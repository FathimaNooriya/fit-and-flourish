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
    );
  }

  @override
  void write(BinaryWriter writer, UserMealModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userMealDate)
      ..writeByte(1)
      ..write(obj.listBreakFastModel)
      ..writeByte(2)
      ..write(obj.listLunchModel)
      ..writeByte(3)
      ..write(obj.listDinnerModel);
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
