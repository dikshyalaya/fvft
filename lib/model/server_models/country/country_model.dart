import 'package:json_annotation/json_annotation.dart';


import 'country_currency_model.dart';

part 'country_model.g.dart';

@JsonSerializable()
class Country {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'native')
  String nativeName;

  @JsonKey(name: 'flag')
  String flagUrl;

  @JsonKey(name: 'phone_code')
  String phoneCode;

  @JsonKey(name: 'currency')
  CountryCurrency currency;

  Country({
    required this.currency,
    required this.flagUrl,
    required this.id,
    required this.name,
    required this.nativeName,
    required this.phoneCode,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
