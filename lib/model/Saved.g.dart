// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Saved.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedAdapter extends TypeAdapter<Saved> {
  @override
  final int typeId = 1;

  @override
  Saved read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Saved(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Saved obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.albumName)
      ..writeByte(1)
      ..write(obj.artistName)
      ..writeByte(2)
      ..write(obj.trackID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
