// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swimming_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SwimmingModelAdapter extends TypeAdapter<SwimmingModel> {
  @override
  final int typeId = 12;

  @override
  SwimmingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SwimmingModel(
      swimTime: fields[0] as double,
      swimSpeed: fields[1] as String,
      swimDate: fields[2] as DateTime,
      swimCalorie: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, SwimmingModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.swimTime)
      ..writeByte(1)
      ..write(obj.swimSpeed)
      ..writeByte(2)
      ..write(obj.swimDate)
      ..writeByte(3)
      ..write(obj.swimCalorie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SwimmingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
