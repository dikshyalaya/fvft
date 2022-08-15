import 'package:free_visa_free_ticket/model/server_models/country/country_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_list_model.g.dart';

@JsonSerializable()
class CountriesList { 
  
CountriesList({required this.countries});

 @JsonKey(name :'current_page')
  int ? currentPage;

  @JsonKey(name :'next_page_url')
  String ? nextPageUrl;

   @JsonKey(name :'path')
   String ? path;

    @JsonKey(name :'per_page')
    int ? perPageCount;

     @JsonKey(name :'total')
     int ? total; 

      @JsonKey(name :'data')
      List<Country> countries;

        factory CountriesList.fromJson(Map<String, dynamic> json) =>
      _$CountriesListFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CountriesListToJson(this);


  
}