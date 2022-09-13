// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map<String, dynamic> json) => JobModel(
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
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
      category: json['job_category'] == null
          ? null
          : JobCategoryModel.fromJson(
              json['job_category'] as Map<String, dynamic>),
      featureImageUrl: json['featured_image_url'] as String?,
      hideSalary: json['hide_salary'] as String?,
      isActive: json['is_active'] as String?,
      isFeatured: json['is_featured'] as String?,
      jobDescription: json['description'] as String?,
      jobExperience: json['job_experience'] as String?,
      jobId: json['id'] as int?,
      jobTitle: json['title'] as String?,
      numberOfPositions: json['num_of_positions'] as String?,
      salaryCurrency: json['salary_currency'] as String?,
      salaryFrom: (json['salary_form'] as num?)?.toDouble(),
      salaryTo: (json['salary_to'] as num?)?.toDouble(),
      minExperience: json['min_experience'] as String?,
      applyBefore: json['expiry_date'] == null
          ? null
          : DateTime.parse(json['expiry_date'] as String),
      contactYear: json['contract_year'] as String?,
      nepSalary: json['nepali_salary'] as String?,
      workingDays: json['working_days'] as String?,
      workingHours: json['working_hours'] as String?,
      maxAge: json['max_age'] as String?,
      minAge: json['min_age'] as String?,
      requirements: json['requirements'],
      skills: json['skills'],
      annualVacation: json['annual_vacation'] as String?,
      overTime: json['over_time'] as String?,
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
      'working_hours': instance.workingHours,
      'min_age': instance.minAge,
      'max_age': instance.maxAge,
      'requirements': instance.requirements,
      'skills': instance.skills,
      'working_days': instance.workingDays,
      'nepali_salary': instance.nepSalary,
      'expiry_date': instance.applyBefore?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'contract_year': instance.contactYear,
      'annual_vacation': instance.annualVacation,
      'job_experience': instance.jobExperience,
      'is_active': instance.isActive,
      'is_featured': instance.isFeatured,
      'min_experience': instance.minExperience,
      'over_time': instance.overTime,
      'country': instance.country,
      'education_level': instance.educationLevel,
      'company': instance.company,
      'job_category': instance.category,
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
