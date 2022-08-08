import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../core/utilities/logutils.dart';
import '../../models/local_storage/job_prefs_model.dart';
import '../../repositories/preferences_repository.dart';

class UserJobPrefsProvider with ChangeNotifier {
  List<JobPrefsModel> _jobPrefsList = [];

  List<JobPrefsModel> get jobPrefsList => _jobPrefsList;

  Future<JobPrefsModel> addNewJobCategoryInPrefs(
      {required int jobCategoryId}) async {
    try {
      final response = await PreferencesRepository.addNewJobCategoryInPrefs(
          jobCategoryId: jobCategoryId);
      if (response.data != null && response.data['success']) {
        final JobPrefsModel jobPrefsModel =
            JobPrefsModel.fromJson(response.data['data']);
        _jobPrefsList.add(jobPrefsModel);
        notifyListeners();
        return jobPrefsModel;
      }
      return JobPrefsModel();
    } on DioError catch (e) {
      LogUtils.logError(
          'Dio Error occurred while adding new job category in prefs: ${e.message}');
      LogUtils.logError(
          'Dio Error occurred while adding new job category in prefs: ${e.response}');
      return JobPrefsModel();
    } catch (e) {
      LogUtils.logError(
          'Error occurred while adding new job category in prefs: $e');
      return JobPrefsModel();
    }
  }

  Future<void> getJobCategoryFromPrefsList() async {
    try {
      final response =
          await PreferencesRepository.getJobCategoryFromPrefsList();
      if (response.data != null && response.data['success']) {
        _jobPrefsList.clear();
        _jobPrefsList.addAll(response.data['data']
            .map<JobPrefsModel>((e) => JobPrefsModel.fromJson(e))
            .toList());
        notifyListeners();
      }
    } on DioError catch (e) {
      LogUtils.logError(
          'Dio Error occurred while fetching job category from prefs: ${e.message}');
      LogUtils.logError(
          'Dio Error occurred while fetching job category from prefs: ${e.response}');
    } catch (e) {
      LogUtils.logError(
          'Error occurred while fetching job category from prefs: $e');
    }
  }

  Future<void> updateJobCategoryPrefsList() async {
    try {
      final response = await PreferencesRepository.updateJobCategoryPrefsList(
          jobPrefsList: _jobPrefsList);
      if (response.data != null && response.data['success']) {
        _jobPrefsList.clear();
        _jobPrefsList.addAll(response.data['data']
            .map<JobPrefsModel>((e) => JobPrefsModel.fromJson(e))
            .toList());
        notifyListeners();
      }
    } on DioError catch (e) {
      LogUtils.logError(
          'Dio Error occurred while updating job categories in prefs: ${e.message}');
      LogUtils.logError(
          'Dio Error occurred while updating job categories in prefs: ${e.response}');
    } catch (e) {
      LogUtils.logError(
          'Error occurred while updating job categories in prefs: $e');
    }
  }

  Future<bool> deleteParticularJobCategory({required int prefsId}) async {
    try {
      final response = await PreferencesRepository.deleteParticularJobCategory(
          prefsId: prefsId);
      if (response.data != null && response.data['success']) {
        _jobPrefsList.removeWhere((element) => element.id == prefsId);
        notifyListeners();
        return true;
      }
      return false;
    } on DioError catch (e) {
      LogUtils.logError(
          'Dio Error occurred while deleting job category from prefs: ${e.message}');
      LogUtils.logError(
          'Dio Error occurred while deleting job category from prefs: ${e.response}');
      return false;
    } catch (e) {
      LogUtils.logError(
          'Error occurred while deleting job category from prefs: $e');
      return false;
    }
  }

  //===========================Swap User Country Preferences=======================

  JobPrefsModel removeJobCategoryByIndex(int index) {
    return _jobPrefsList.removeAt(index);
  }

  void addNewJobCategory(int index, JobPrefsModel value) {
    _jobPrefsList.insert(index, value);
  }

//==============================End of swapping user country preferences==================

// ============= Remove job prefs by id ======================

  void removeJobById(int id) {
    _jobPrefsList.removeWhere((element) => element.jobCategoryId == id);
    notifyListeners();
  }

// ============ End of Removing Job Prefs By Id ============
}
