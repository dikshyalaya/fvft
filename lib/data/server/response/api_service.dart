import 'dart:io';

import 'package:dio/dio.dart';
import 'package:free_visa_free_ticket/data/server/api_manager.dart';
import 'package:free_visa_free_ticket/data/server/network_exception.dart';
import 'package:free_visa_free_ticket/data/server/response/base_api_service.dart';
ApiManager _apiManager = ApiManager();

class ApiService extends BaseApiService {



/// ############################# [GET] REQUEST TO THE SERVER #################################
  @override
  Future getApiResponse(String url , {Map<String, dynamic>? query}) async{
dynamic jsonResponse;

try {

  Response response =await _apiManager.dio!.get(url , queryParameters: query
  ).timeout(const Duration(seconds: 10));
  jsonResponse = response;
  
} on DioError catch (e) {
throw Exception(e);
} on SocketException {
throw  FetchDataException ('Network error');
} 

return jsonResponse;

  }
/// ############################# [END_OF_GET] REQUEST TO THE SERVER #################################





/// ############################# [POST] REQUEST TO THE SERVER #################################
  @override
  Future postApiResponse(String url, data) async{

 
    dynamic jsonResponse;
    try {

  Response response =await _apiManager.dio!.post(url , data: data ).timeout(const Duration(seconds: 10));
  jsonResponse = response;
  
} on DioError catch (e) {
throw Exception(e);
} on SocketException {
throw  FetchDataException ('Network error');
} 
   
  return jsonResponse;
  }
/// ############################# [END_OF_POST] REQUEST TO THE SERVER #################################
}