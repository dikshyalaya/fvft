import 'package:dio/dio.dart';
import '../core/network/api_manager.dart';
import '../core/services/service_locator.dart';

class CountryRepository {
  static final ApiManager _apiManager = locator<ApiManager>();
  static const String _countriesEndpoint = '/countries';

  static Future<Response> getListOfCountries(
      {int limit = 10, int pageNo = 1}) async {
    return await _apiManager.dio!.get(_countriesEndpoint, queryParameters: {
      'limit': limit,
      'page_no': pageNo,
      'is_active': 1,
    });
  }
}
