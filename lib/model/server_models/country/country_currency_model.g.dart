// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryCurrency _$CountryCurrencyFromJson(Map<String, dynamic> json) =>
    CountryCurrency(
      currencyCode: json['currency_code'] as String,
      currencyName: json['currency_name'] as String,
      currencySymbol: json['currency_symbol'] as String,
    );

Map<String, dynamic> _$CountryCurrencyToJson(CountryCurrency instance) =>
    <String, dynamic>{
      'currency_name': instance.currencyName,
      'currency_code': instance.currencyCode,
      'currency_symbol': instance.currencySymbol,
    };
