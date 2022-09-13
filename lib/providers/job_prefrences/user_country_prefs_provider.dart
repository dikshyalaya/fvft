import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../core/utilities/logutils.dart';
import '../../models/local_storage/country_prefs_model.dart';
import '../../repositories/preferences_repository.dart';

class UserCountryPrefsProvider with ChangeNotifier {
  List<CountryPrefsModel> _countryPrefsList = [];

  List<CountryPrefsModel> get countryPrefsList => _countryPrefsList;

  Future<CountryPrefsModel> addNewCountryInPrefs(
      {required int? countryId}) async {
    try {
      final response = await PreferencesRepository.addNewCountryInPrefs(
          countryId: countryId);
      LogUtils.logGeneral(response.data);
      if (response.data != null && response.data['success']) {
        final CountryPrefsModel countryPrefsModel =
            CountryPrefsModel.fromJson(response.data['data']);
        _countryPrefsList.add(countryPrefsModel);
        notifyListeners();
        return countryPrefsModel;
      }
      return CountryPrefsModel();
    } on DioError catch (e) {
      LogUtils.logError(
          'Dio Error occurred while adding new country in prefs: ${e.message}');
      LogUtils.logError(
          'Dio Error occurred while adding new country in prefs: ${e.response}');
      return CountryPrefsModel();
    } catch (e) {
      LogUtils.logError('Error occurred while adding new country in prefs: $e');
      return CountryPrefsModel();
    }
  }

  Future<void> getCountryFromPrefsList() async {
    try {
      final response = await PreferencesRepository.getCountryFromPrefsList();
      if (response.data != null && response.data['success']) {
        _countryPrefsList.clear();
        _countryPrefsList.addAll(response.data['data']
            .map<CountryPrefsModel>((e) => CountryPrefsModel.fromJson(e))
            .toList());
        notifyListeners();
      }
    } on DioError catch (e) {
      LogUtils.logError(
          'Dio Error occurred while fetching countries from prefs: ${e.message}');
      LogUtils.logError(
          'Dio Error occurred while fetching countries from prefs: ${e.response}');
    } catch (e) {
      LogUtils.logError(
          'Error occurred while fetching countries from prefs: $e');
    }
  }

  Future<void> updateCountryPrefsList() async {
    try {
      final response = await PreferencesRepository.updateCountryPrefsList(
          countryPrefsList: _countryPrefsList);
      LogUtils.logError(response.data);
      if (response.data != null && response.data['success']) {
        _countryPrefsList.clear();
        _countryPrefsList.addAll(response.data['data']
            .map<CountryPrefsModel>((e) => CountryPrefsModel.fromJson(e))
            .toList());
        notifyListeners();
      }
    } on DioError catch (e) {
      LogUtils.logError(
          'Dio Error occurred while updating country in prefs: ${e.message}');
      LogUtils.logError(
          'Dio Error occurred while updating country in prefs: ${e.response}');
    } catch (e) {
      LogUtils.logError('Error occurred while updating country in prefs: $e');
      rethrow;
    }
  }

  Future<bool> deleteParticularCountry({required int? prefsId}) async {
    try {
      final response =
          await PreferencesRepository.deleteParticularCountry(prefsId: prefsId);
      if (response.data != null && response.data['success']) {
        _countryPrefsList.removeWhere((element) => element.id == prefsId);
        notifyListeners();
        return true;
      }
      return false;
    } on DioError catch (e) {
      LogUtils.logError(
          'Dio Error occurred while deleting country from prefs: ${e.message}');
      LogUtils.logError(
          'Dio Error occurred while deleting country from prefs: ${e.response}');
      return false;
    } catch (e) {
      LogUtils.logError('Error occurred while deleting country from prefs: $e');
      return false;
    }
  }

//===========================Swap User Country Preferences=======================

  CountryPrefsModel removeCountryIndex(int index) {
    return _countryPrefsList.removeAt(index);
  }

  void addNewCountry(int index, CountryPrefsModel value) {
    _countryPrefsList.insert(index, value);
  }

//==============================End of swapping user country preferences==================

// ============= Remove country prefs by id ======================

  void removeCountryById(int? id) {
    _countryPrefsList.removeWhere((element) => element.countryId == id);
    notifyListeners();
  }

// ============ End of Removing Country Prefs By Id ============
}
