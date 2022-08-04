// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workplace.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkplaceAdapter extends TypeAdapter<Workplace> {
  @override
  final int typeId = 1;

  @override
  Workplace read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Workplace(
      id: fields[0] as int?,
      name: fields[1] as String?,
      location: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Workplace obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkplaceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
