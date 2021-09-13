// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelsAdapter extends TypeAdapter<Models> {
  @override
  final int typeId = 1;

  @override
  Models read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Models(
      name: fields[1] as String,
      username: fields[2] as String,
      email: fields[3] as String,
      id: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Models obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
