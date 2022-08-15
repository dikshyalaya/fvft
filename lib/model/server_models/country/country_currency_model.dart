import 'package:json_annotation/json_annotation.dart';
part 'country_currency_model.g.dart';

@JsonSerializable()
class CountryCurrency {



@JsonKey(name: 'currency_name')
String  currencyName;

@JsonKey(name:'currency_code')
String  currencyCode;

@JsonKey(name: 'currency_symbol')
String  currencySymbol;


CountryCurrency({
  required this.currencyCode, required this.currencyName, required this.currencySymbol
});


factory CountryCurrency.fromJson(Map<String, dynamic> json) => _$CountryCurrencyFromJson(json);

/// Connect the generated [_$PersonToJson] function to the `toJson` method.
Map<String, dynamic> toJson() => _$CountryCurrencyToJson(this);

}