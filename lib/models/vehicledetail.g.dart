// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicledetail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehicleAdapter extends TypeAdapter<Vehicle> {
  @override
  final int typeId = 3;

  @override
  Vehicle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vehicle(
      ownername: fields[0] as String,
      vehiclenum: fields[1] as String,
      model: fields[2] as String,
      license: fields[3] as String,
      id: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Vehicle obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.ownername)
      ..writeByte(1)
      ..write(obj.vehiclenum)
      ..writeByte(2)
      ..write(obj.model)
      ..writeByte(3)
      ..write(obj.license)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
