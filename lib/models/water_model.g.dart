// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WaterModelAdapter extends TypeAdapter<WaterModel> {
  @override
  final int typeId = 3;

  @override
  WaterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WaterModel(
      waterIntake: fields[0] as int,
      waterReminder: fields[1] as String,
      waterDate: fields[2] as DateTime,
      waterTarget: fields[3] as int,
      waterId: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, WaterModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.waterIntake)
      ..writeByte(1)
      ..write(obj.waterReminder)
      ..writeByte(2)
      ..write(obj.waterDate)
      ..writeByte(3)
      ..write(obj.waterTarget)
      ..writeByte(4)
      ..write(obj.waterId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
