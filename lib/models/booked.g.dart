// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booked.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookedAdapter extends TypeAdapter<Booked> {
  @override
  final int typeId = 13;

  @override
  Booked read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Booked(
      category: fields[0] as String?,
      slotnumber: fields[1] as int?,
      id: fields[11] as int,
      ownername: fields[2] as String?,
      license: fields[5] as String,
      vehiclenum: fields[3] as String,
      model: fields[4] as String,
      entreDate: fields[6] as String,
      enterTime: fields[8] as String,
      exitDate: fields[7] as String,
      exitTime: fields[9] as String,
      payment: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Booked obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.slotnumber)
      ..writeByte(2)
      ..write(obj.ownername)
      ..writeByte(3)
      ..write(obj.vehiclenum)
      ..writeByte(4)
      ..write(obj.model)
      ..writeByte(5)
      ..write(obj.license)
      ..writeByte(6)
      ..write(obj.entreDate)
      ..writeByte(7)
      ..write(obj.exitDate)
      ..writeByte(8)
      ..write(obj.enterTime)
      ..writeByte(9)
      ..write(obj.exitTime)
      ..writeByte(10)
      ..write(obj.payment)
      ..writeByte(11)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
