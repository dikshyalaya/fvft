// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      currency:
          CountryCurrency.fromJson(json['currency'] as Map<String, dynamic>),
      flagUrl: json['flag'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      nativeName: json['native'] as String,
      phoneCode: json['phone_code'] as String,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'native': instance.nativeName,
      'flag': instance.flagUrl,
      'phone_code': instance.phoneCode,
      'currency': instance.currency,
    };
