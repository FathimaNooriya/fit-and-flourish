// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeightModelAdapter extends TypeAdapter<WeightModel> {
  @override
  final int typeId = 2;

  @override
  WeightModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeightModel(
      weightAmount: fields[0] as double,
      weightImage: fields[1] as String?,
      weightDate: fields[2] as DateTime,
      weightTarget: fields[3] as double,
      weightTargetTime: fields[4] as String,
      reminingDaysNeeded: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WeightModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.weightAmount)
      ..writeByte(1)
      ..write(obj.weightImage)
      ..writeByte(2)
      ..write(obj.weightDate)
      ..writeByte(3)
      ..write(obj.weightTarget)
      ..writeByte(4)
      ..write(obj.weightTargetTime)
      ..writeByte(5)
      ..write(obj.reminingDaysNeeded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeightModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
