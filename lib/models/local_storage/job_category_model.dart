import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_category_model.g.dart';

@HiveType(typeId: 1, adapterName: 'JobCategoryAdapter')
@JsonSerializable()
class JobCategoryModel with ChangeNotifier {
  @HiveField(0)
  @JsonKey(name: 'id')
  final int? id;

  @HiveField(1)
  @JsonKey(name: 'functional_area')
  final String? jobCategory;

  @HiveField(2)
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @HiveField(3)
  @JsonKey(name: 'sort_order')
  final String? sortOrder;

  @HiveField(4)
  @JsonKey(name: 'lang')
  final String? lang;

  @HiveField(5)
  @JsonKey(name: 'is_default')
  final bool? isDefault;

  @HiveField(6)
  @JsonKey(name: 'is_active')
  final bool? isActive;

  JobCategoryModel(
      {required this.id,
      this.jobCategory,
      this.imageUrl,
      this.sortOrder,
      this.isActive,
      this.isDefault,
      this.lang});

  factory JobCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$JobCategoryModelFromJson(json);
}
