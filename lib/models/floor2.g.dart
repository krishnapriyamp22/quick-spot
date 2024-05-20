// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor2.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Floor2Adapter extends TypeAdapter<Floor2> {
  @override
  final int typeId = 6;

  @override
  Floor2 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Floor2(
      slotcount: fields[0] as String,
      id: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Floor2 obj) {
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
      other is Floor2Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
