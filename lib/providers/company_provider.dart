import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:free_visa_free_ticket/models/local_storage/company_model.dart';
import 'package:free_visa_free_ticket/repositories/company_repository.dart';

class CompanyProvider with ChangeNotifier {
  CompanyProvider() {
    getCompanies();
  }
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<CompanyModel> _companiesList = [];
  List<CompanyModel> get companiesList => _companiesList;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getCompanies() async {
    _companiesList.clear();
    setLoading(true);

    try {
      var response = await CompanyRepository.getCompany();

      print(response.data['data']['companies']);
      _companiesList.addAll(response.data['data']['companies']
          .map<CompanyModel>((e) => CompanyModel.fromJson(e)));
      notifyListeners();
    } catch (e) {
      log('error occuried thile fetching the compaines :=>  {$e}');
    }
  
    setLoading(false);
  }
}
