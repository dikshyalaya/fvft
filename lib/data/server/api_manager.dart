import 'package:dio/dio.dart';
import 'package:free_visa_free_ticket/resources/app_url.dart';

import 'api_interception.dart';

class ApiManager { 
   

  Dio ? dio;
   ApiManager() {
    BaseOptions options = BaseOptions(
        baseUrl: AppUrl.baseUrl,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        extra: {'Accept': 'application/json'});

    dio = Dio(options);
    dio!.interceptors.add(
      ApiInterceptor(
        dioInstance: dio,
      ),
    );
  }
}