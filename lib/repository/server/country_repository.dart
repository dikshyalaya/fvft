import 'package:dio/dio.dart';
import 'package:free_visa_free_ticket/data/server/response/api_service.dart';
import 'package:free_visa_free_ticket/resources/app_url.dart';



class CountryRepository {
static final ApiService _apiService = ApiService();


  static Future<Response> getListOfCountries(
      {int? limit = 10, int pageNo = 1}) async {

    return await    _apiService.getApiResponse(AppUrl.countriesEndpoint, query: {
      'limit': limit,
      'page_no': pageNo,
      'is_active': 1,
    });
   
  }
}
