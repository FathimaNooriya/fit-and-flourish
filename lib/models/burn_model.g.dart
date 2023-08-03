// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'burn_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BurnModelAdapter extends TypeAdapter<BurnModel> {
  @override
  final int typeId = 7;

  @override
  BurnModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BurnModel(
      swimCalorie: fields[0] as double?,
      runCalorie: fields[1] as double?,
      burnDate: fields[3] as DateTime,
      walkCalorie: fields[2] as double?,
      cyclingCalorie: fields[4] as double?,
      totelCalorieBurn: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BurnModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.swimCalorie)
      ..writeByte(1)
      ..write(obj.runCalorie)
      ..writeByte(2)
      ..write(obj.walkCalorie)
      ..writeByte(3)
      ..write(obj.burnDate)
      ..writeByte(4)
      ..write(obj.cyclingCalorie)
      ..writeByte(5)
      ..write(obj.totelCalorieBurn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BurnModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
