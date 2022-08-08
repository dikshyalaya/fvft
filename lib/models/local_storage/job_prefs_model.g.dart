// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_prefs_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobPrefsAdapterName extends TypeAdapter<JobPrefsModel> {
  @override
  final int typeId = 5;

  @override
  JobPrefsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JobPrefsModel(
      id: fields[0] as int?,
      jobCategoryId: fields[1] as int?,
      sortId: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, JobPrefsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.jobCategoryId)
      ..writeByte(2)
      ..write(obj.sortId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobPrefsAdapterName &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
