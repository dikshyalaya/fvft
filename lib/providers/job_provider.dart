import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../core/services/hive_service.dart';
import '../core/services/service_locator.dart';
import '../core/utilities/enum_utils.dart';
import '../core/utilities/logutils.dart';
import '../models/local_storage/job_category_model.dart';
import '../models/job_model.dart';
import '../repositories/job_repository.dart';

import 'job_filter_provider.dart';

/// Provider [JobProvider] : Get list of job, list of job category, list of jobs based on selected job category
class JobProvider with ChangeNotifier {
  List<JobModel>? _jobList = [];
  List<JobCategoryModel>? _jobCategoriesList = [];
  List<JobModel>? _jobListByJobCategory = [];

  List<JobModel>? get jobList => _jobList;

  List<JobModel>? get jobListByJobCategory => _jobListByJobCategory;

  List<JobCategoryModel>? get jobCategoriesList => _jobCategoriesList;

  void setJobList(List<JobModel>? jobs) {
    _jobList = jobs;
    notifyListeners();
  }

  void setJobListByJobCategory(List<JobModel>? jobs) {
    _jobListByJobCategory = jobs;
    notifyListeners();
  }

  void setJobCategoriesList(List<JobCategoryModel>? jobCategories) {
    _jobCategoriesList = jobCategories;
    notifyListeners();
  }

  /// ========================= Function to fetch list of active jobs ========================

  Future<void> getListOfJobs({
    int limit = 10,
    int pageNo = 1,
    int countryId = -1,
    bool isToClearJobList = false,
    int jobCategoryId = -1,
  }) async {
    try {
      final response = await JobRepository.getListOfJobs(
          limit: limit,
          pageNo: pageNo,
          countryId: countryId,
          jobCategoryId: jobCategoryId);
      if (response.data != null && response.data['success']) {
        if (isToClearJobList) _jobList = [];
        _jobList!.addAll(response.data['data']
            .map<JobModel>((e) => JobModel.fromJson(e))
            .toList());
        notifyListeners();
      }
    } on DioError catch (e) {
      LogUtils.logError('Dio Fail to fetch list of job: ${e.response}');
      LogUtils.logError('Dio Fail to fetch list of job: ${e.message}');
      rethrow;
    } catch (e) {
      LogUtils.logError('Fail to fetch list of job: $e');
      rethrow;
    }
  }

  /// ========================= End function to fetch list of active jobs ========================

  /// ======================== Function to fetch list of job category, list of jobs based on selected job category ================

  bool _isToLoadCategories = true;

  bool get isToLoadJobCategory => _isToLoadCategories;

  void setIsToLoadJobCategory(bool value) {
    _isToLoadCategories = value;
    notifyListeners();
  }

  Future<void> getListOfJobsCategories({int limit = 21, int pageNo = 1}) async {
    final bool result = await locator<HiveService>()
        .isExists(boxName: HiveBoxName.allJobCategory.stringValue);
    if (result) {
      List<dynamic> va = await locator<HiveService>()
          .getBox(HiveBoxName.allJobCategory.stringValue);
      _jobCategoriesList =
          va.map<JobCategoryModel>((e) => e as JobCategoryModel).toList();
      locator<JobFilterProvider>().setJobCategory(_jobCategoriesList!);
      return;
    } else {
      try {
        final response = await JobRepository.getListOfJobCategories(
            pageNo: pageNo, limit: limit);
        if (response.data != null && response.data['success']) {
          _jobCategoriesList!.addAll(response.data['data']
              .map<JobCategoryModel>((e) => JobCategoryModel.fromJson(e))
              .toList());
          _isToLoadCategories = false;
          notifyListeners();
        }
      } on DioError catch (e) {
        LogUtils.logError(
            'Dio Fail to fetch list of job categories: ${e.response}');
        LogUtils.logError(
            'Dio Fail to fetch list of job categories: ${e.message}');
        rethrow;
      } catch (e) {
        LogUtils.logError('Fail to fetch list of job categories: $e');
        rethrow;
      }
    }
  }

  Future<void> getAllJobsCategories({int limit = 21, int pageNo = 1}) async {
    final bool result = await locator<HiveService>()
        .isExists(boxName: HiveBoxName.allJobCategory.stringValue);
    if (result) {
      List<dynamic> va = await locator<HiveService>()
          .getBox(HiveBoxName.allJobCategory.stringValue);
      _jobCategoriesList =
          va.map<JobCategoryModel>((e) => e as JobCategoryModel).toList();
      locator<JobFilterProvider>().setJobCategory(_jobCategoriesList!);
      return;
    } else {
      try {
        List<JobCategoryModel> tempJobCategoriesList = [];
        final response = await JobRepository.getListOfJobCategories(
            pageNo: pageNo, limit: 1);

        if (response.data != null && response.data['success']) {
          final responseResult = await JobRepository.getListOfJobCategories(
              pageNo: pageNo, limit: response.data['meta']['total_records']);
          tempJobCategoriesList.addAll(responseResult.data['data']
              .map<JobCategoryModel>((e) => JobCategoryModel.fromJson(e))
              .toList());
        }
        locator<JobFilterProvider>().setJobCategory(tempJobCategoriesList);
        _jobCategoriesList = tempJobCategoriesList;
        notifyListeners();
        await locator<HiveService>()
            .addBox(_jobCategoriesList, HiveBoxName.allJobCategory.stringValue);
      } on DioError catch (e) {
        LogUtils.logError(
            'Dio Fail to fetch list of job categories-all: ${e.response}');
        LogUtils.logError(
            'Dio Fail to fetch list of job categories-all: ${e.message}');
        rethrow;
      } catch (e) {
        LogUtils.logError('Fail to fetch list of job categories-all: $e');
        rethrow;
      }
    }
  }

  int _jobCategoryId = -1;
  bool _isAllJobLoaded = false;

  Future<void> getJobListByJobCategory(
      {int limit = 10, int pageNo = 1, required int jobCategoryId}) async {
    try {
      final response = await JobRepository.getJobListByJobCategoryId(
          limit: limit, pageNo: pageNo, jobCategoryId: jobCategoryId);
      if (_jobCategoryId != jobCategoryId) {
        _isAllJobLoaded = false;
        _jobListByJobCategory!.clear();
        _jobCategoryId = jobCategoryId;
        notifyListeners();
      }
      if (response.data != null && response.data['success']) {
        if (_isAllJobLoaded) {
          return;
        }
        _jobListByJobCategory!.addAll(response.data['data']
            .map<JobModel>((e) => JobModel.fromJson(e))
            .toList());
        notifyListeners();
        if (_jobListByJobCategory!.length ==
            response.data['meta']['total_records']) {
          _isAllJobLoaded = true;
          notifyListeners();
        }
      }
    } on DioError catch (e) {
      LogUtils.logError(
          'Dio Fail to fetch list of job by job category: ${e.response}');
      LogUtils.logError(
          'Dio Fail to fetch list of job by job category:: ${e.message}');
      rethrow;
    } catch (e) {
      LogUtils.logError('Fail to fetch list of job by job category:: $e');
      rethrow;
    }
  }

  /// ======================== End Function to fetch list of job category, list of jobs based on selected job category ================

  /// ==================== Function to remove job from job list, once user applied to those jobs =====================
  void removeJobByJobId(int jobId) {
    _jobList!.removeWhere((element) => element.jobId == jobId);
    notifyListeners();
  }

  void removeJobFromJobCategoryByJobId(int jobId) {
    _jobListByJobCategory!.removeWhere((element) => element.jobId == jobId);
    notifyListeners();
  }

  /// ==================== End Function to remove job from job list, once user applied to those jobs =====================
}
