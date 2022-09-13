// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) => CompanyModel(
      companyLogo: json['company_logo'] as String?,
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      companyAddress: json['company_address'] as String?,
      companyBanner: json['company_banner'] as String?,
      companyCover: json['company_cover'] as String?,
      companyDetails: json['company_details'] as String?,
      companyEmail: json['company_email'] as String?,
      companyFbPage: json['company_fb_page'] as String?,
      companyName: json['company_name'] as String?,
      companyOwnership: json['ownership'] as String?,
      companyPhone: json['company_phone'] as String?,
      companyServices: json['company_services'] as String?,
      companyWebsite: json['company_website'] as String?,
      country: json['country'] == null
          ? null
          : CountryLSModel.fromJson(json['country'] as Map<String, dynamic>),
      dialCode: json['dialCode'] as String?,
      id: json['id'] as int?,
      mobilePhone1: json['mobile_phone1'] as String?,
      mobilePhone2: json['mobile_phone2'] as String?,
      noOfEmployee: json['no_of_employee'] as String?,
      operatingSince: json['operating_since'] as String?,
      state: json['state'] == null
          ? null
          : StateModel.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_name': instance.companyName,
      'company_cover': instance.companyCover,
      'company_logo': instance.companyLogo,
      'company_banner': instance.companyBanner,
      'company_phone': instance.companyPhone,
      'company_email': instance.companyEmail,
      'company_details': instance.companyDetails,
      'company_address': instance.companyAddress,
      'company_website': instance.companyWebsite,
      'company_fb_page': instance.companyFbPage,
      'ownership': instance.companyOwnership,
      'no_of_employee': instance.noOfEmployee,
      'operating_since': instance.operatingSince,
      'company_services': instance.companyServices,
      'dialCode': instance.dialCode,
      'mobile_phone1': instance.mobilePhone1,
      'mobile_phone2': instance.mobilePhone2,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
    };

StateModel _$StateModelFromJson(Map<String, dynamic> json) => StateModel(
      id: json['id'] as int?,
      countryCode: json['country_code'] as String?,
      stateName: json['name'] as String?,
    );

Map<String, dynamic> _$StateModelToJson(StateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.stateName,
      'country_code': instance.countryCode,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      id: json['id'] as int?,
      cityName: json['name'] as String?,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.cityName,
    };
