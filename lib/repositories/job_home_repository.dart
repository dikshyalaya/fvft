import 'package:dio/dio.dart';
import 'package:free_visa_free_ticket/core/network/api_manager.dart';



// h
class JobHomeRepository{
 static final ApiManager   _apiManager = ApiManager();
static const String _jobHomeEndPoint = '/v1/candidate/job/home';

static Future<Response> getJobHomeData() async{
  try {
return await  _apiManager.dio!.get(_jobHomeEndPoint);
  }
  catch (e) {
throw Exception(e);
  }
}

}