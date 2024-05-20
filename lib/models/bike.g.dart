// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bike.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BikeAdapter extends TypeAdapter<Bike> {
  @override
  final int typeId = 9;

  @override
  Bike read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bike(
      bikeownername: fields[0] as String,
      bikenum: fields[1] as String,
      bikemodel: fields[2] as String,
      bikelicense: fields[3] as String,
      id: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Bike obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.bikeownername)
      ..writeByte(1)
      ..write(obj.bikenum)
      ..writeByte(2)
      ..write(obj.bikemodel)
      ..writeByte(3)
      ..write(obj.bikelicense)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BikeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
