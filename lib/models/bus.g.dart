// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BusAdapter extends TypeAdapter<Bus> {
  @override
  final int typeId = 10;

  @override
  Bus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bus(
      busownername: fields[0] as String,
      busnum: fields[1] as String,
      busmodel: fields[2] as String,
      buslicense: fields[3] as String,
      id: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Bus obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.busownername)
      ..writeByte(1)
      ..write(obj.busnum)
      ..writeByte(2)
      ..write(obj.busmodel)
      ..writeByte(3)
      ..write(obj.buslicense)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
