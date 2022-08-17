import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// part 'job_category_model.g.dart';

@HiveType(typeId: 1, adapterName: 'JobCategoryAdapter')
class JobCategoryModel with ChangeNotifier {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? jobCategory;
  @HiveField(2)
  final String? imageUrl;
  @HiveField(3)
  final int? sortOrder;

  JobCategoryModel({this.id, this.jobCategory, this.imageUrl, this.sortOrder});

  factory JobCategoryModel.fromJson(Map<String, dynamic> json) =>
      JobCategoryModel(
        jobCategory: json['category'],
        id: json['id'],
        imageUrl: json['image_url'],
        sortOrder: json['sort_order'],
      );
}
