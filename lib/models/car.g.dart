// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarAdapter extends TypeAdapter<Car> {
  @override
  final int typeId = 4;

  @override
  Car read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Car(
      carownername: fields[0] as String,
      carnum: fields[1] as String,
      carmodel: fields[2] as String,
      carlicense: fields[3] as String,
      id: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Car obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.carownername)
      ..writeByte(1)
      ..write(obj.carnum)
      ..writeByte(2)
      ..write(obj.carmodel)
      ..writeByte(3)
      ..write(obj.carlicense)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
