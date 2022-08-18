import 'package:free_visa_free_ticket/models/local_storage/company_model.dart';
import 'package:free_visa_free_ticket/models/local_storage/country_ls_model.dart';
import 'package:json_annotation/json_annotation.dart';
import './local_storage/country_ls_model.dart';

part 'jobs_model.g.dart';

@JsonSerializable()
class JobModel {
  @JsonKey(name: 'id')
  final int? jobId;

  @JsonKey(name: 'title')
  final String? jobTitle;

  @JsonKey(name: 'description')
  final String? jobDescription;
  @JsonKey(name: 'featured_image_url')
  final String? featureImageUrl;
  @JsonKey(name: 'benefits')
  final String? benefits;
  @JsonKey(name: 'salary_form')
  final double? salaryFrom;
  @JsonKey(name: 'salary_to')
  final double? salaryTo;
  @JsonKey(name: 'salary_currency')
  final String? salaryCurrency;
  @JsonKey(name: 'hide_salary')
  final bool? hideSalary;
  @JsonKey(name: 'num_of_positions')
  final int? numberOfPositions;
  @JsonKey(name: 'expiry_date')
  final DateTime? expiryDate;

  @JsonKey(name: 'job_experience')
  final String? jobExperience;

  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'is_featured')
  final bool? isFeatured;
  // final List<JobShiftModel>? jobShifts;
  // final int? countryId;
  // final SiteLocationModel? siteLocation;

  @JsonKey(name: 'country')
  final CountryLSModel? country;

  @JsonKey(name: 'education_level')
  final EducationLevelModel? educationLevel;

  @JsonKey(name: 'company')
  final CompanyModel? company;

  // final int? job

  JobModel({
    this.company,
    this.benefits,
    this.country,
    this.educationLevel,
    this.expiryDate,
    this.featureImageUrl,
    this.hideSalary,
    this.isActive,
    this.isFeatured,
    this.jobDescription,
    this.jobExperience,
    this.jobId,
    this.jobTitle,
    this.numberOfPositions,
    this.salaryCurrency,
    this.salaryFrom,
    this.salaryTo,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);

  Map<String, dynamic> toJson() => _$JobModelToJson(this);
}

@JsonSerializable()
class EducationLevelModel {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'is_active')
  final String? isActive;

  @JsonKey(name: 'sort_order')
  final String? sortOrder;

  EducationLevelModel({this.id, this.isActive, this.sortOrder, this.title});
  factory EducationLevelModel.fromJson(Map<String, dynamic> json) =>
      _$EducationLevelModelFromJson(json);

  Map<String, dynamic> toJson() => _$EducationLevelModelToJson(this);
}
