// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cv_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CVModelAdapter extends TypeAdapter<CVModel> {
  @override
  final int typeId = 3;

  @override
  CVModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CVModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      cvUrl: fields[2] as String?,
      localPath: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CVModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.cvUrl)
      ..writeByte(3)
      ..write(obj.localPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CVModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
