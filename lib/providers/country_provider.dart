import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/services/hive_service.dart';
import '../core/services/service_locator.dart';
import '../core/utilities/enum_utils.dart';
import '../core/utilities/logutils.dart';
import '../models/local_storage/country_ls_model.dart';
import 'job_filter_provider.dart';
import '../repositories/country_repository.dart';

class CountryProvider with ChangeNotifier {
  List<CountryLSModel?>? _countriesList = [];

  List<CountryLSModel?>? get countriesList => _countriesList;

  void setCountriesList(List<CountryLSModel> updatedCountriesList) {
    _countriesList = updatedCountriesList;
    notifyListeners();
  }

  Future<void> getListOfCountries({int limit = 10, int pageNo = 1}) async {
    try {
      final response = await CountryRepository.getListOfCountries(
          limit: limit, pageNo: pageNo);
      if (response.data != null && response.data['success']) {
        bool exists = await locator<HiveService>()
            .isExists(boxName: HiveBoxName.country.stringValue);
        if (!exists) {
          _countriesList!.addAll(response.data['data']
              .map<CountryLSModel>((e) => CountryLSModel.fromJson(e))
              .toList());
          notifyListeners();
          //caching country
          await locator<HiveService>()
              .addBoxes(_countriesList!, HiveBoxName.country.stringValue);
        } else {
          final val = await locator<HiveService>()
              .getBoxes(HiveBoxName.country.stringValue);
          _countriesList = val.map<CountryLSModel?>((e) => e).toList();
          notifyListeners();
        }
      }
    } on DioError catch (e) {
      LogUtils.logError('Dio Error to Fetch List of countries: ${e.response}');
      LogUtils.logError('Dio Error to Fetch List of countries: ${e.message}');
      rethrow;
    } catch (e) {
      LogUtils.logError('Error to Fetch List of countries: $e');
      rethrow;
    }
  }

  Future<void> getTotalListOfCountries({int limit = 1, int pageNo = 1}) async {
    final bool result = await locator<HiveService>()
        .isExists(boxName: HiveBoxName.allCountry.stringValue);
    if (result) {
      List<dynamic> va = await (locator<HiveService>()
          .getBox(HiveBoxName.allCountry.stringValue) as Future<List<dynamic>>);
      _countriesList = va.map<CountryLSModel>((e) => e as CountryLSModel).toList();
      locator<JobFilterProvider>().setCountry(_countriesList!);
      return;
    }
    try {
      List<CountryLSModel> _tempCountriesList = [];
      final response = await CountryRepository.getListOfCountries(
          limit: limit, pageNo: pageNo);
      if (response.data != null && response.data['success']) {
        final responseResult = await CountryRepository.getListOfCountries(
            limit: response.data['meta']['total_records'], pageNo: pageNo);
        _tempCountriesList.addAll(responseResult.data['data']
            .map<CountryLSModel>((e) => CountryLSModel.fromJson(e))
            .toList());
      }
      locator<JobFilterProvider>().setCountry(_tempCountriesList);
      _countriesList = _tempCountriesList;
      notifyListeners();
      await locator<HiveService>()
          .addBox(_countriesList, HiveBoxName.allCountry.stringValue);
    } on DioError catch (e) {
      LogUtils.logError('Dio Error to Fetch List of countries: ${e.response}');
      LogUtils.logError('Dio Error to Fetch List of countries: ${e.message}');
      rethrow;
    } catch (e) {
      LogUtils.logError('Error to Fetch List of countries: $e');
      rethrow;
    }
  }
}
