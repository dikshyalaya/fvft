import 'package:json_annotation/json_annotation.dart';
part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'capital')
  final String? capitalCity;

  @JsonKey(name: 'native')
  final String? nativeName;

  @JsonKey(name: 'country_code')
  final String? countryCode;

  @JsonKey(name: 'phonecode')
  final String? phoneCode;

  @JsonKey(name: 'flag')
  final String? flag;

  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'currency_name')
  final String? currencyName;

  @JsonKey(name: 'currency_symbol')
  final String? currencySymbol;

  @JsonKey(name: 'region')
  final String? region;

  @JsonKey(name: 'subregion')
  final String? subregion;

  CountryModel(
      {required this.id,
      required this.name,
      required this.phoneCode,
      required this.countryCode,
      this.capitalCity,
      this.currency,
      this.currencyName,
      this.currencySymbol,
      this.flag,
      this.nativeName,
      this.region,
      this.subregion});

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  /// Connect the generated [_$CountryModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
