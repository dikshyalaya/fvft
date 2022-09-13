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
      sortOrder: fields[3] as String?,
      isActive: fields[6] as String?,
      isDefault: fields[5] as String?,
      lang: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, JobCategoryModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.jobCategory)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.sortOrder)
      ..writeByte(4)
      ..write(obj.lang)
      ..writeByte(5)
      ..write(obj.isDefault)
      ..writeByte(6)
      ..write(obj.isActive);
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobCategoryModel _$JobCategoryModelFromJson(Map<String, dynamic> json) =>
    JobCategoryModel(
      id: json['id'] as int?,
      jobCategory: json['functional_area'] as String?,
      imageUrl: json['image_url'] as String?,
      sortOrder: json['sort_order'] as String?,
      isActive: json['is_active'] as String?,
      isDefault: json['is_default'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$JobCategoryModelToJson(JobCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'functional_area': instance.jobCategory,
      'image_url': instance.imageUrl,
      'sort_order': instance.sortOrder,
      'lang': instance.lang,
      'is_default': instance.isDefault,
      'is_active': instance.isActive,
    };
