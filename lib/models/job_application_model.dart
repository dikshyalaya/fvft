import 'package:flutter/material.dart';
import 'package:free_visa_free_ticket/models/jobs_model.dart';


class JobApplicationModel with ChangeNotifier {
  final int? jobApplicationId;
  final JobModel? job;

  JobApplicationModel({
    this.job,
    this.jobApplicationId,
  });

  factory JobApplicationModel.fromJson(Map<String, dynamic> json) =>
      JobApplicationModel(
        job: json['job'] == null ? null : JobModel.fromJson(json['job']),
        jobApplicationId: json['application_id'] != null
            ? int.parse(json['application_id'].toString())
            : null,
      );
}
