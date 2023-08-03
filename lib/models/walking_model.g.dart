// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walking_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WalkingModelAdapter extends TypeAdapter<WalkingModel> {
  @override
  final int typeId = 9;

  @override
  WalkingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WalkingModel(
      walkDistance: fields[0] as double,
      walkTime: fields[1] as double,
      walkSpeed: fields[2] as String,
      walkDate: fields[3] as DateTime,
      walkCalorie: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, WalkingModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.walkDistance)
      ..writeByte(1)
      ..write(obj.walkTime)
      ..writeByte(2)
      ..write(obj.walkSpeed)
      ..writeByte(3)
      ..write(obj.walkDate)
      ..writeByte(4)
      ..write(obj.walkCalorie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WalkingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
