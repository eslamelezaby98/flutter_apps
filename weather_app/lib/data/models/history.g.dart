// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistroyAdapter extends TypeAdapter<Histroy> {
  @override
  final int typeId = 0;

  @override
  Histroy read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Histroy()..countryName = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, Histroy obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.countryName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistroyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
