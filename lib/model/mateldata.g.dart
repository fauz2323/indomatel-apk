// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mateldata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MateldataAdapter extends TypeAdapter<Mateldata> {
  @override
  final int typeId = 3;

  @override
  Mateldata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mateldata(
      id: fields[0] as int,
      tipeKendaraan: fields[1] as String,
      nomorRangka: fields[2] as String,
      nomorMesin: fields[3] as String,
      nopol: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Mateldata obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.tipeKendaraan)
      ..writeByte(2)
      ..write(obj.nomorRangka)
      ..writeByte(3)
      ..write(obj.nomorMesin)
      ..writeByte(4)
      ..write(obj.nopol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MateldataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
