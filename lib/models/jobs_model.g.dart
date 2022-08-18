// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map<String, dynamic> json) => JobModel(
      company: json['company'] == null
          ? null
          : CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
      benefits: json['benefits'] as String?,
      country: json['country'] == null
          ? null
          : CountryLSModel.fromJson(json['country'] as Map<String, dynamic>),
      educationLevel: json['education_level'] == null
          ? null
          : EducationLevelModel.fromJson(
              json['education_level'] as Map<String, dynamic>),
      expiryDate: json['expiry_date'] == null
          ? null
          : DateTime.parse(json['expiry_date'] as String),
      featureImageUrl: json['featured_image_url'] as String?,
      hideSalary: json['hide_salary'] as bool?,
      isActive: json['is_active'] as bool?,
      isFeatured: json['is_featured'] as bool?,
      jobDescription: json['description'] as String?,
      jobExperience: json['job_experience'] as String?,
      jobId: json['id'] as int?,
      jobTitle: json['title'] as String?,
      numberOfPositions: json['num_of_positions'] as int?,
      salaryCurrency: json['salary_currency'] as String?,
      salaryFrom: (json['salary_form'] as num?)?.toDouble(),
      salaryTo: (json['salary_to'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$JobModelToJson(JobModel instance) => <String, dynamic>{
      'id': instance.jobId,
      'title': instance.jobTitle,
      'description': instance.jobDescription,
      'featured_image_url': instance.featureImageUrl,
      'benefits': instance.benefits,
      'salary_form': instance.salaryFrom,
      'salary_to': instance.salaryTo,
      'salary_currency': instance.salaryCurrency,
      'hide_salary': instance.hideSalary,
      'num_of_positions': instance.numberOfPositions,
      'expiry_date': instance.expiryDate?.toIso8601String(),
      'job_experience': instance.jobExperience,
      'is_active': instance.isActive,
      'is_featured': instance.isFeatured,
      'country': instance.country,
      'education_level': instance.educationLevel,
      'company': instance.company,
    };

EducationLevelModel _$EducationLevelModelFromJson(Map<String, dynamic> json) =>
    EducationLevelModel(
      id: json['id'] as int?,
      isActive: json['is_active'] as String?,
      sortOrder: json['sort_order'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$EducationLevelModelToJson(
        EducationLevelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'is_active': instance.isActive,
      'sort_order': instance.sortOrder,
    };
