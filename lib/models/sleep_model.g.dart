// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SleepModelAdapter extends TypeAdapter<SleepModel> {
  @override
  final int typeId = 20;

  @override
  SleepModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SleepModel(
      sleepTaken: fields[0] as TimeOfDay,
      sleepDate: fields[1] as DateTime,
      nextBedTime: fields[3] as DateTime,
      alamtime: fields[4] as DateTime,
      sleepTarget: (fields[2] as List).cast<TimeOfDay>(),
    );
  }

  @override
  void write(BinaryWriter writer, SleepModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.sleepTaken)
      ..writeByte(1)
      ..write(obj.sleepDate)
      ..writeByte(2)
      ..write(obj.sleepTarget)
      ..writeByte(3)
      ..write(obj.nextBedTime)
      ..writeByte(4)
      ..write(obj.alamtime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SleepModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
