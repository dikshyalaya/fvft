import 'package:free_visa_free_ticket/models/local_storage/company_model.dart';
import 'package:free_visa_free_ticket/models/local_storage/country_ls_model.dart';
import 'package:free_visa_free_ticket/models/local_storage/job_category_model.dart';
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
  final String? hideSalary;
  @JsonKey(name: 'num_of_positions')
  final String? numberOfPositions;

  @JsonKey(name: 'working_hours')
  final String? workingHours;
  @JsonKey(name: 'min_age')
  final String? minAge;
  @JsonKey(name: 'max_age')
  final String? maxAge;

  @JsonKey(name: 'requirements')
  final dynamic requirements;

  @JsonKey(name: 'skills')
  final dynamic skills;

  @JsonKey(name: 'working_days')
  final String? workingDays;

  @JsonKey(name: 'nepali_salary')
  final String? nepSalary;

  @JsonKey(name: 'expiry_date')
  final DateTime? applyBefore;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'contract_year')
  final String? contactYear;



  @JsonKey(name: 'annual_vacation')
  final String? annualVacation;

  @JsonKey(name: 'job_experience')
  final String? jobExperience;

  @JsonKey(name: 'is_active')
  final String? isActive;
  @JsonKey(name: 'is_featured')
  final String? isFeatured;

  @JsonKey(name: 'min_experience')
  final String? minExperience;

  @JsonKey(name: 'over_time')
  final String? overTime;

  // final List<JobShiftModel>? jobShifts;
  // final int? countryId;
  // final SiteLocationModel? siteLocation;

  @JsonKey(name: 'country')
  final CountryLSModel? country;

  @JsonKey(name: 'education_level')
  final EducationLevelModel? educationLevel;

  @JsonKey(name: 'company')
  final CompanyModel? company;

  @JsonKey(name: 'job_category')
  final JobCategoryModel? category;

  // final int? job

  JobModel({
    this.createdAt,
    this.company,
    this.benefits,
    this.country,
    this.educationLevel,
    this.category,
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
    this.minExperience,
    this.applyBefore,
    this.contactYear,
    this.nepSalary,
    this.workingDays,
    this.workingHours,
  
    this.maxAge,
    this.minAge,
    this.requirements,
    this.skills,
    this.annualVacation,
    this.overTime,
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
