// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectionAdapter extends TypeAdapter<Selection> {
  @override
  final int typeId = 12;

  @override
  Selection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Selection(
      categorey: fields[0] as String,
      index: fields[1] as int,
      isBooked: fields[2] as bool,
      id: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Selection obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.categorey)
      ..writeByte(1)
      ..write(obj.index)
      ..writeByte(2)
      ..write(obj.isBooked)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
