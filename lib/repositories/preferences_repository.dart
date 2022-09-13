import 'dart:convert';

import 'package:dio/dio.dart';
import '../core/network/api_manager.dart';
import '../core/services/service_locator.dart';
import '../models/local_storage/country_prefs_model.dart';
import '../models/local_storage/job_prefs_model.dart';

class PreferencesRepository {
  static final ApiManager? _apiManager = locator<ApiManager>();
  static const String _countryPrefsEndPoint = '/v1/candidate/preference/country';
  static const String _jobCategoryPrefsEndPoint =
      '/v1/candidate/preference/job-category';

  static Future<Response> addNewCountryInPrefs({required int? countryId}) async {
    return _apiManager!.dio!
        .post(_countryPrefsEndPoint, data: {'country_id': countryId});
  }

  static Future<Response> getCountryFromPrefsList() async {
    return _apiManager!.dio!.get(_countryPrefsEndPoint);
  }

  static Future<Response> updateCountryPrefsList(
      {required List<CountryPrefsModel>? countryPrefsList}) async {
    List encodeToJson() {
      List jsonList = [];
      countryPrefsList!.asMap().forEach((index, item) => jsonList.add({
            'id': item.id,
            'country_id': item.countryId,
            'order_by': index + 1,
          }));
      return jsonList;
    }

    return _apiManager!.dio!.patch(_countryPrefsEndPoint, data: encodeToJson());
  }

  static Future<Response> deleteParticularCountry(
      {required int? prefsId}) async {
    return _apiManager!.dio!.delete('$_countryPrefsEndPoint/$prefsId');
  }

  static Future<Response> addNewJobCategoryInPrefs(
      {required int? jobCategoryId}) async {
    return _apiManager!.dio!.post(_jobCategoryPrefsEndPoint,
        data: {'job_category_id': jobCategoryId});
  }

  static Future<Response> getJobCategoryFromPrefsList() async {
    return _apiManager!.dio!.get(_jobCategoryPrefsEndPoint);
  }

  static Future<Response> updateJobCategoryPrefsList(
      {required List<JobPrefsModel>? jobPrefsList}) async {
    List encodeToJson() {
      List jsonList = [];
      jobPrefsList!.asMap().forEach((index, item) {
        jsonList.add({
          'id': item.id,
          'job_category_id': item.jobCategoryId,
          'order_by': index + 1,
        });
      });
      return jsonList;
    }

    return _apiManager!.dio!
        .patch(_jobCategoryPrefsEndPoint, data: encodeToJson());
  }

  static Future<Response> deleteParticularJobCategory(
      {required int? prefsId}) async {
    return _apiManager!.dio!.delete('$_jobCategoryPrefsEndPoint/$prefsId');
  }
}
