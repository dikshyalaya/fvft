import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import '../services/hive_service.dart';
import '../services/service_locator.dart';
import '../utilities/enum_utils.dart';

class ApiInterceptor extends Interceptor {
  static const statusCodeUnauthorized = 401;

  final Function? refreshSession;
  final Function? getValidAccessToken;

  final Dio? dioInstance;

  ApiInterceptor({
    required this.dioInstance,
    this.refreshSession,
    this.getValidAccessToken,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? accessToken;
    bool exists = await locator<HiveService>()
        .isExists(boxName: HiveBoxName.userToken.stringValue);
    if (exists) {
      accessToken = await locator<HiveService>()
          .getBox(HiveBoxName.userToken.stringValue);
    }
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers.putIfAbsent('Authorization', () => 'Bearer $accessToken');
    }
    return super.onRequest(options, handler);
  }
@override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse

    debugPrint(response.data['countries']);
    super.onResponse(response, handler);
  }
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
