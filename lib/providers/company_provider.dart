import 'package:flutter/material.dart';
import 'package:free_visa_free_ticket/models/local_storage/company_model.dart';
import 'package:free_visa_free_ticket/repositories/company_repository.dart';

class CompanyProvider with ChangeNotifier {

  CompanyProvider(){
    getCompanies();
  }
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<CompanyModel> _companiesList = [];
  List<CompanyModel> get companiesList => _companiesList;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getCompanies() async {
    setLoading(true);
   
    try {
      var response = CompanyRepository.getCompany();
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
