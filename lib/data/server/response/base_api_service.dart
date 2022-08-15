abstract class BaseApiService { 
  Future<dynamic> getApiResponse(String url, {Map<String, dynamic>? query});
  Future<dynamic> postApiResponse(String url, dynamic data);
}