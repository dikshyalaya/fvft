// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phoneCode: json['phonecode'] as String?,
      countryCode: json['country_code'] as String?,
      capitalCity: json['capital'] as String?,
      currency: json['currency'] as String?,
      currencyName: json['currency_name'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      flag: json['flag'] as String?,
      nativeName: json['native'] as String?,
      region: json['region'] as String?,
      subregion: json['subregion'] as String?,
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'capital': instance.capitalCity,
      'native': instance.nativeName,
      'country_code': instance.countryCode,
      'phonecode': instance.phoneCode,
      'flag': instance.flag,
      'currency': instance.currency,
      'currency_name': instance.currencyName,
      'currency_symbol': instance.currencySymbol,
      'region': instance.region,
      'subregion': instance.subregion,
    };
