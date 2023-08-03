// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycling_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CyclingModelAdapter extends TypeAdapter<CyclingModel> {
  @override
  final int typeId = 10;

  @override
  CyclingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CyclingModel(
      cycleDistance: fields[0] as double,
      cycleTime: fields[1] as double,
      cycleDate: fields[2] as DateTime,
      cycleCalorie: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, CyclingModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.cycleDistance)
      ..writeByte(1)
      ..write(obj.cycleTime)
      ..writeByte(2)
      ..write(obj.cycleDate)
      ..writeByte(3)
      ..write(obj.cycleCalorie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CyclingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
