// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegistrationModelAdapter extends TypeAdapter<RegistrationModel> {
  @override
  final int typeId = 1;

  @override
  RegistrationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegistrationModel(
      name: fields[0] as String,
      age: fields[1] as int,
      genter: fields[2] as String,
      height: fields[3] as double,
      currentWeight: fields[4] as double,
      targetWeight: fields[5] as double?,
      goal: fields[6] as String,
      activityLevel: fields[7] as String,
      weeklyRate: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RegistrationModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.genter)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.currentWeight)
      ..writeByte(5)
      ..write(obj.targetWeight)
      ..writeByte(6)
      ..write(obj.goal)
      ..writeByte(7)
      ..write(obj.activityLevel)
      ..writeByte(8)
      ..write(obj.weeklyRate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistrationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
