// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesList _$CountriesListFromJson(Map<String, dynamic> json) =>
    CountriesList(
      countries: (json['data'] as List<dynamic>)
          .map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..currentPage = json['current_page'] as int?
      ..nextPageUrl = json['next_page_url'] as String?
      ..path = json['path'] as String?
      ..perPageCount = json['per_page'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$CountriesListToJson(CountriesList instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPageCount,
      'total': instance.total,
      'data': instance.countries,
    };
