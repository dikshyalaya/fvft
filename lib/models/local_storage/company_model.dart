import 'package:free_visa_free_ticket/models/local_storage/country_ls_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'company_name')
  final String? companyName;

  @JsonKey(name: 'company_cover')
  final String? companyCover;

  @JsonKey(name: 'company_banner')
  final String? companyBanner;

  @JsonKey(name: 'company_phone')
  final String? companyPhone;

  @JsonKey(name: 'company_email')
  final String? companyEmail;

  @JsonKey(name: 'company_details')
  final String? companyDetails;

  @JsonKey(name: 'company_address')
  final String? companyAddress;

  @JsonKey(name: 'company_website')
  final String? companyWebsite;

  @JsonKey(name: 'company_fb_page')
  final String? companyFbPage;

  @JsonKey(name: 'ownership')
  final String? companyOwnership;

  @JsonKey(name: 'no_of_employee')
  final String? noOfEmployee;

  @JsonKey(name: 'operating_since')
  final String? operatingSince;

  @JsonKey(name: 'company_services')
  final String? companyServices;

  @JsonKey(name: 'dialCode')
  final String? dialCode;

  @JsonKey(name: 'mobile_phone1')
  final String? mobilePhone1;

  @JsonKey(name: 'mobile_phone2')
  final String? mobilePhone2;

  @JsonKey(name: 'country')
  final CountryLSModel? country;

  @JsonKey(name: 'state')
  final StateModel? state;

  @JsonKey(name: 'city')
  final CityModel? city;

  CompanyModel({
    this.city,
    this.companyAddress,
    this.companyBanner,
    this.companyCover,
    this.companyDetails,
    this.companyEmail,
    this.companyFbPage,
    this.companyName,
    this.companyOwnership,
    this.companyPhone,
    this.companyServices,
    this.companyWebsite,
    this.country,
    this.dialCode,
    this.id,
    this.mobilePhone1,
    this.mobilePhone2,
    this.noOfEmployee,
    this.operatingSince,
    this.state,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json)=>_$CompanyModelFromJson(json);
  Map<String, dynamic >  toJson()=>_$CompanyModelToJson(this);


}

@JsonSerializable()
class StateModel {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? stateName;

  @JsonKey(name: 'country_code')
  final String? countryCode;

  StateModel({this.id, this.countryCode, this.stateName});

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);
}

@JsonSerializable()
class CityModel {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? cityName;

  CityModel({this.id, this.cityName});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
