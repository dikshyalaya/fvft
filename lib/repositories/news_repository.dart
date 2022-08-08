import 'package:dio/dio.dart';
import '../core/network/api_manager.dart';
import '../core/services/service_locator.dart';

class NewsRepository {
  static final ApiManager _apiManager = locator<ApiManager>();
  static const String _newsEndPoint = '/candidate/news';
  static const String _bannerEndPoint = '/candidate/banners';

  /// FUNC [getNewsList] : Get list of news
  static Future<Response> getNewsList() async {
    return await _apiManager.dio!.get(_newsEndPoint);
  }

  static Future<Response> getBannerList() async {
    return await _apiManager.dio!.get(_bannerEndPoint);
  }
}
