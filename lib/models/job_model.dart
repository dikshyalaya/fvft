// import 'package:flutter/material.dart';
// import '../core/utilities/app_utils.dart';

// import 'local_storage/country_ls_model.dart';

// class CompanyModel with ChangeNotifier {
//   final int? companyId;
//   final String? name;
//   final String? logoUrl;
//   final String? coverImageUrl;
//   final String? companyPhone;
//   final String? companyEmail;

//   CompanyModel(
//       {this.name,
//       this.coverImageUrl,
//       this.companyEmail,
//       this.companyId,
//       this.companyPhone,
//       this.logoUrl});

//   factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
//       name: json['name'],
//       coverImageUrl: json['cover_image_url'],
//       companyEmail: json['email'],
//       companyId: json['id'],
//       companyPhone: json['phone'],
//       logoUrl: json['logo_url']);
// }

// class JobShiftModel with ChangeNotifier {
//   final int? id;
//   final String? jobShift;

//   JobShiftModel({this.id, this.jobShift});

//   factory JobShiftModel.fromJson(Map<String, dynamic> json) =>
//       JobShiftModel(id: json['id'], jobShift: json['shift']);
// }

// class StateModel with ChangeNotifier {
//   final int? id;
//   final String? stateName;

//   StateModel({this.id, this.stateName});

//   factory StateModel.fromJson(Map<String, dynamic> json) =>
//       StateModel(id: json['id'], stateName: json['name']);
// }

// class CityModel with ChangeNotifier {
//   final int? id;
//   final String? cityName;

//   CityModel({this.id, this.cityName});
// }

// class SiteLocationModel with ChangeNotifier {
//   final CountryLSModel? country;
//   final CityModel? city;
//   final StateModel? state;

//   SiteLocationModel({this.country, this.state, this.city});

//   factory SiteLocationModel.fromJson(Map<String, dynamic> json) =>
//       SiteLocationModel(
//           city: json['city'] == null ? null : CityModel.fromJson(json['city']),
//           country: json['country'] == null
//               ? null
//               : CountryLSModel.fromJson(json['country']),
//           state: json['state'] == null
//               ? null
//               : StateModel.fromJson(json['state']));
// }

// class JobModel with ChangeNotifier {
//   final int? jobId;
//   final CompanyModel? companyModel;
//   final String? jobTitle;
//   final String? jobDescription;
//   final String? featureImageUrl;
//   final String? benefits;
//   final double? salaryFrom;
//   final double? salaryTo;
//   final String? salaryCurrency;
//   final bool? hideSalary;
//   final String? jobCategory;
//   final int? numberOfPositions;
//   final DateTime? expiryDate;
//   final String? educationLevel;
//   final String? jobExperience;
//   final bool? isActive;
//   final bool? isFeatured;
//   final List<JobShiftModel>? jobShifts;
//   final int? countryId;
//   final SiteLocationModel? siteLocation;

//   // final int? job

//   JobModel({
//     this.companyModel,
//     this.featureImageUrl,
//     this.benefits,
//     this.jobDescription,
//     this.jobId,
//     this.jobTitle,
//     this.salaryCurrency,
//     this.salaryFrom = 0,
//     this.salaryTo = 0,
//     this.isActive = true,
//     this.educationLevel,
//     this.expiryDate,
//     this.hideSalary = false,
//     this.isFeatured = false,
//     this.jobCategory,
//     this.jobExperience,
//     this.jobShifts = const [],
//     this.numberOfPositions = 0,
//     this.countryId,
//     this.siteLocation,
//   });

//   factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
//       salaryTo: json['salary_to'] == null
//           ? 0.0
//           : double.parse(json['salary_to'].toString()),
//       isActive: json['is_active'],
//       benefits: json['benefits'],
//       companyModel: json['company'] == null
//           ? null
//           : CompanyModel.fromJson(json['company']),
//       educationLevel: json['education_level'],
//       expiryDate: DateTime.parse(json['expiry_date']).toLocal(),
//       featureImageUrl: json['feature_image_url'],
//       hideSalary: json['hide_salary'],
//       isFeatured: json['is_featured'],
//       jobCategory: json['job_category'],
//       jobDescription: json['description'],
//       jobExperience: json['job_experience'],
//       jobId: json['id'],
//       jobShifts: json['job_shifts'] == null
//           ? []
//           : convertDynamicListToJobShift(json['job_shifts']),
//       jobTitle: json['title'],
//       numberOfPositions: json['num_of_positions'],
//       salaryCurrency: json['salary_currency'],
//       salaryFrom: json['salary_from'] == null
//           ? 0.0
//           : double.parse(json['salary_from'].toString()),
//       // countryId: json['country_id'],
//       siteLocation: json['site_location'] == null
//           ? null
//           : SiteLocationModel.fromJson(json['site_location']));
// }
