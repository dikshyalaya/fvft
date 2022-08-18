import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:free_visa_free_ticket/providers/job_home_provider.dart';
import '../core/network/api_manager.dart';
import '../core/services/service_locator.dart';

class JobRepository {
  static final ApiManager? _apiManager = locator<ApiManager>();
  static const String _jobListEndpoint = '/v1/candidate/job-list';
  static const String _jobCategoryEndpoint = '/v1/candidate/job/home';
  static const String _jobApplicationEndpoint = '/v1/candidate/job-application';
  static const String _jobApplicationListEndpoint =
      '/v1/candidate/job-application-list';
     


  static Future<Response> getListOfJobs(
      {int limit = 10,
      int pageNo = 1,
      int? countryId = -1,
      int? jobCategoryId = -1}) async {
    try {
      return await _apiManager!.dio!.get(_jobListEndpoint, queryParameters: {
        'limit': limit,
        'page_no': pageNo,
        'is_active': 1,
        'only_latest': 1,
        'include_applied': 1,
        if (countryId != -1) 'country_id': countryId,
        if (jobCategoryId != -1) 'job_categories_id': jobCategoryId
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Response> getListOfJobCategories(
      {int? limit = 21, int pageNo = 1}) async {



try {
    return await _apiManager!.dio!.get(_jobCategoryEndpoint, queryParameters: {
      'limit': limit,
      'page_no': pageNo,
    });
  
} catch (e) {
throw Exception(e);
}

  }

  static Future<Response> getJobListByJobCategoryId(
      {int limit = 10, int pageNo = 1, required int? jobCategoryId}) async {

try {
    return await _apiManager!.dio!.get(_jobListEndpoint, queryParameters: {
      'limit': limit,
      'page_no': pageNo,
      'is_active': 1,
      'only_latest': 1,
      'include_applied': 1,
      'job_categories_id': jobCategoryId
    });
  
} catch (e) {
  throw Exception(e);
  
}

  }

  static Future<Response> applyJob(int? jobId) async {
    return await _apiManager!.dio!
        .post(_jobApplicationEndpoint, data: {'job_id': jobId});
  }

  static Future<Response> acceptedJobList() async {
    return await _apiManager!.dio!
        .post(_jobApplicationListEndpoint, data: {'status': 'accepted'});
  }

  static Future<Response> onProcessJobList() async {
    return await _apiManager!.dio!
        .post(_jobApplicationListEndpoint, data: {'status': 'onprocess'});
  }

  static Future<Response> onPendingJobList() async {
    return await _apiManager!.dio!
        .post(_jobApplicationListEndpoint, data: {'status': 'pending'});
  }



}
