import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/services/hive_service.dart';
import '../core/services/service_locator.dart';
import '../core/utilities/app_utils.dart';
import '../core/utilities/enum_utils.dart';
import '../core/utilities/logutils.dart';
import '../models/news_model.dart';
import '../repositories/news_repository.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> _newsList = [];

  List<NewsModel> get newsList => _newsList;

  void setNewsList(List<NewsModel> value) {
    _newsList = value;
    notifyListeners();
  }

  /// FUNC [getListOfNews] : get list of news data via api
  Future<void> getListOfNews() async {
    try {
      final response = await NewsRepository.getNewsList();
      if (response.data != null && response.data['success']) {
        _newsList.addAll(response.data['data']
            .map<NewsModel>((e) => NewsModel.fromJson(e))
            .toList());
        notifyListeners();
      }
    } on DioError catch (e) {
      LogUtils.logError('Error List of news: ${e.message}');
      LogUtils.logError('Error List of news: ${e.response}');
      rethrow;
    } catch (e) {
      LogUtils.logError('Error List of news: $e');
      rethrow;
    }
  }

  // ======================== Banner ==================================

  List<String?> _bannerUrlList = [];

  List<String?> get bannerUrlList => _bannerUrlList;

  void setBannerUrlList(List<String?> bannerUrlList) {
    _bannerUrlList = bannerUrlList;
    notifyListeners();
  }

  List<Uint8List> _imageList = [];

  List<Uint8List> get imageList => _imageList;

  /// FUNC [getListOfBanners] : get list of banners
  Future<void> getListOfBanners() async {
    try {
      final response = await NewsRepository.getBannerList();
      if (response.data != null) {
        final List<dynamic> dynamicList =
            response.data['data'] as List<dynamic>;
        if (dynamicList.isEmpty) {
          _bannerUrlList = [];
          notifyListeners();
          return;
        }
        _bannerUrlList = [];
        await Future.forEach(dynamicList, (dynamic e) async {
          final ex = e as Map<String, dynamic>;
          _bannerUrlList.add(ex['url']);
          final ByteData imageData =
              await NetworkAssetBundle(Uri.parse(ex['url'])).load('');
          final Uint8List bytes = imageData.buffer.asUint8List();
          _imageList.add(bytes);
        });
        await _cacheListOfBanner();
      }
    } on DioError catch (e) {
      LogUtils.logError('Dio Error List of banners: ${e.message}');
      LogUtils.logError('Dio Error List of banners: ${e.response}');
      rethrow;
    } catch (e) {
      LogUtils.logError('Error List of banners: $e');
      rethrow;
    }
  }

  // ==================== End of Banner =======================================

  // ====================== Banner Caching =================================

  bool _isBannerFromCache = false;

  bool get isBannerFromCache => _isBannerFromCache;

  Future<void> _cacheListOfBanner() async {
    //cache it into local db
    final bool result = await hasBannerInCache();
    if (result) {
      await locator<HiveService>()
          .updateBox(_imageList, HiveBoxName.banner.stringValue);
    } else {
      await locator<HiveService>()
          .addBox(_imageList, HiveBoxName.banner.stringValue);
    }
    _isBannerFromCache = true;
    notifyListeners();
    LogUtils.logGeneral('Banner has been cached');
  }

  Future<void> getBannerFromCache() async {
    try {
      final val =
          await locator<HiveService>().getBox(HiveBoxName.banner.stringValue);
      _imageList = convertDynamicToUint8List(val);
      _isBannerFromCache = true;
    } catch (e) {
      LogUtils.logError('error while getting banner $e');
    }
  }

  Future<bool> hasBannerInCache() async {
    return await locator<HiveService>()
        .isExists(boxName: HiveBoxName.banner.stringValue);
  }
// ======================End of Banner Caching =================================
}
