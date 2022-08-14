import 'package:dio/dio.dart';
import '../utilities/environment.dart';

import 'api_interceptor.dart';

class ApiManager {
  final _connectTimeout = 100000;
  final _receiveTimeout = 100000;

  Dio? dio;

  ApiManager() {
    BaseOptions options = BaseOptions(
        baseUrl: Environment.baseUrl,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
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
