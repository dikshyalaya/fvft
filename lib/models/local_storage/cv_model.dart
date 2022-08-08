import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'cv_model.g.dart';

@HiveType(typeId: 3, adapterName: 'CVModelAdapter')
class CVModel with ChangeNotifier {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? cvUrl;
  @HiveField(3)
  final String? localPath;

  CVModel({
    required this.id,
    required this.title,
    required this.cvUrl,
    this.localPath,
  });

  factory CVModel.fromJson(Map<String, dynamic> json) => CVModel(
        id: json['id'],
        title: json['title'] ?? '',
        cvUrl: json['cv_file'],
      );
}
