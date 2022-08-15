import 'package:flutter/material.dart';
import 'package:free_visa_free_ticket/model/server_models/country/country_list_model.dart';
import 'package:free_visa_free_ticket/repository/server/country_repository.dart';

class CountryProvider with ChangeNotifier {

  List<CountriesList ?>  ?_countriesList = [];

  List<CountriesList?>? get countriesList =>_countriesList;

  /// Updating the list of the  countries
  
  void updateCountriesList ( List<CountriesList?> ? updatedList){
    _countriesList = updatedList;
    notifyListeners();
  }

  /// Getting the list of the countires
  
  Future<void> getNewListFromTheServer() async{
    
    dynamic response =  CountryRepository.getListOfCountries();
    print(response);



  }

  /// ********************** CACHING THE COUNTRIES LIST GOT FROM THE SERVER **********************

}