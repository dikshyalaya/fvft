import 'package:dio/dio.dart';
import '../core/network/api_manager.dart';
import '../core/services/service_locator.dart';

class CVRepository {
  static final ApiManager? _apiManager = locator<ApiManager>();
  static const String _cvEndpoint = '/v1/candidate/cv';

  static Future<Response> getCV() async {
    return await _apiManager!.dio!.get(_cvEndpoint);
  }

  static Future<Response> addUpdateCV(FormData formData) async {
    return await _apiManager!.dio!.post(_cvEndpoint, data: formData);
  }

  static Future<Response> deleteParticularCV(int? id) async {
    return await _apiManager!.dio!.delete('$_cvEndpoint/$id');
  }
}
