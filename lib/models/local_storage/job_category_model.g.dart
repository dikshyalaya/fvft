// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobCategoryAdapter extends TypeAdapter<JobCategoryModel> {
  @override
  final int typeId = 1;

  @override
  JobCategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JobCategoryModel(
      id: fields[0] as int?,
      jobCategory: fields[1] as String?,
      imageUrl: fields[2] as String?,
      sortOrder: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, JobCategoryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.jobCategory)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.sortOrder);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
