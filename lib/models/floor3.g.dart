// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor3.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Floor3Adapter extends TypeAdapter<Floor3> {
  @override
  final int typeId = 7;

  @override
  Floor3 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Floor3(
      slotcount: fields[0] as String,
      id: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Floor3 obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.slotcount)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Floor3Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
