// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'truck.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TruckAdapter extends TypeAdapter<Truck> {
  @override
  final int typeId = 11;

  @override
  Truck read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Truck(
      truckownername: fields[0] as String,
      trucknum: fields[1] as String,
      truckmodel: fields[2] as String,
      trucklicense: fields[3] as String,
      id: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Truck obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.truckownername)
      ..writeByte(1)
      ..write(obj.trucknum)
      ..writeByte(2)
      ..write(obj.truckmodel)
      ..writeByte(3)
      ..write(obj.trucklicense)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TruckAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
