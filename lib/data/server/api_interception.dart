import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';


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
        // TODO : MAKE THE TOKEN IN HERE
    String? accessToken;
    // bool exists = await locator<HiveService>()
    //     .isExists(boxName: HiveBoxName.userToken.stringValue);
    // if (exists) {
    //   accessToken = await locator<HiveService>()
    //       .getBox(HiveBoxName.userToken.stringValue);
    // }
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers.putIfAbsent('Authorization', () => 'Bearer $accessToken');
    }
    debugPrint('${options.method} ${options.path} ');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('Response Got : $response');
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(err.message);
    super.onError(err, handler);
  }
}
