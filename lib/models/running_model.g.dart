// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'running_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RunningModelAdapter extends TypeAdapter<RunningModel> {
  @override
  final int typeId = 8;

  @override
  RunningModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RunningModel(
      runDistance: fields[0] as double,
      runTime: fields[1] as double,
      runSpeed: fields[2] as String,
      runDate: fields[3] as DateTime,
      runCalorie: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, RunningModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.runDistance)
      ..writeByte(1)
      ..write(obj.runTime)
      ..writeByte(2)
      ..write(obj.runSpeed)
      ..writeByte(3)
      ..write(obj.runDate)
      ..writeByte(4)
      ..write(obj.runCalorie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RunningModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
