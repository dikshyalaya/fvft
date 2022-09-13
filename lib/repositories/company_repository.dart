import 'package:dio/dio.dart';
import 'package:free_visa_free_ticket/core/network/api_manager.dart';

import '../core/network/app_url.dart';

class CompanyRepository {
  static final ApiManager _apiManager = ApiManager();

  static Future<Response> getCompany() async {
    return await _apiManager.dio!.get(jobHomePageEndpoint);
  }
}
