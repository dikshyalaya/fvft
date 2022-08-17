import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_ls_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'CountryLSModelAdapter')
class CountryLSModel {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? capitalCity;

  @HiveField(3)
  final String? nativeName;
  @HiveField(4)
  final String? countryCode;

  @HiveField(5)
  final String? phoneCode;

  @HiveField(6)
  final String? flag;

  @HiveField(7)
  final String? currency;
  @HiveField(8)
  final String? currencyName;
  @HiveField(9)
  final String? currencySymbol;

  @HiveField(10)
  final String? region;

  @HiveField(11)
  final String? subregion;

  CountryLSModel(
      {required this.id,
      required this.name,
      required this.countryCode,
      required this.nativeName,
      required this.phoneCode,
      required this.flag,
      this.capitalCity,
      this.currency,
      this.currencyName,
      this.currencySymbol,
   
   
      this.region,
      this.subregion});

  /// Connect the generated [_$CountryLSModelFromJson] function to the `fromJson`
  /// factory.
  factory CountryLSModel.fromJson(Map<String, dynamic> json) =>
      _$CountryLSModelFromJson(json);

  /// Connect the generated [_$CountryLSModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CountryLSModelToJson(this);
}
