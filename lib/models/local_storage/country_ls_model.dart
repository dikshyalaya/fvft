import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_ls_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'CountryLSModelAdapter')
class CountryLSModel {
  @HiveField(0)
  @JsonKey(name:'id')
  final int? id;

  @HiveField(1)
  @JsonKey(name:'name')
  final String? name;

  @HiveField(2)
  @JsonKey(name:'capital')
  final String? capitalCity;

  @HiveField(3)
  @JsonKey(name:'native')
  final String? nativeName;
  @HiveField(4)
  @JsonKey(name:'country_code')
  final String? countryCode;

  @HiveField(5)
  @JsonKey(name:'phonecode')
  final String? phoneCode;

  @HiveField(6)
  @JsonKey(name:'flag')
  final String? flag;

  @HiveField(7)
  @JsonKey(name:'currency')
  final String? currency;
  @HiveField(8)
  @JsonKey(name:'currency_name')
  final String? currencyName;
  @HiveField(9)
  @JsonKey(name:'currency_symbol')
  final String? currencySymbol;

  @HiveField(10)
  @JsonKey(name:'region')
  final String? region;

  @HiveField(11)
  @JsonKey(name:'sub_region')
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
