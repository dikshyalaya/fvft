import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:free_visa_free_ticket/models/country_model.dart';
import 'package:free_visa_free_ticket/repositories/job_home_repository.dart';

import '../core/network/api_manager.dart';
import '../core/services/service_locator.dart';

class JobHomeProvider with ChangeNotifier { 
static final ApiManager? _apiManager = locator<ApiManager>();

  List<CountryModel>  _countries = [];
  List<CountryModel> get countries =>_countries;

bool _loading =  false;
bool get loading =>_loading;

setLoading(bool value){
  _loading = value;
  notifyListeners();
}

// static Future<Response> getListOfJobs(
//       {int limit = 10,
//       int pageNo = 1,
//       int? countryId = -1,
//       int? jobCategoryId = -1}) async {
//     try {
//       return await _apiManager!.dio!.get(_jobListEndpoint, queryParameters: {
//         'limit': limit,
//         'page_no': pageNo,
//         'is_active': 1,
//         'only_latest': 1,
//         'include_applied': 1,
//         if (countryId != -1) 'country_id': countryId,
//         if (jobCategoryId != -1) 'job_categories_id': jobCategoryId
//       });
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

  
}