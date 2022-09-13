import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// part 'job_prefs_model.g.dart';

@HiveType(typeId: 5, adapterName: 'JobPrefsAdapterName')
class JobPrefsModel with ChangeNotifier {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final int? jobCategoryId;
  @HiveField(2)
  final int? sortId;

  JobPrefsModel({this.id, this.jobCategoryId, this.sortId});

  factory JobPrefsModel.fromJson(Map<String, dynamic> json) => JobPrefsModel(
        id: json['id'],
        jobCategoryId: json['job_category_id'],
        sortId: json['order_by'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'job_category_id': jobCategoryId,
        'order_by': sortId,
      };
}
