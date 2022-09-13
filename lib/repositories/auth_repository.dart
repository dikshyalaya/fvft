import 'package:dio/dio.dart';
import '../core/network/api_manager.dart';
import '../core/services/service_locator.dart';

class AuthRepository {
  static final ApiManager? _apiManager = locator<ApiManager>();
  static const String _loginEndPoint = '/v1/candidate/login';
  static const String _registerEndPoint = '/v1/candidate/register';

  //update user profile and get user profile data
  static const String _profileEndPoint = '/v1/candidate/profile';

  /// FUNC [loginUser] : Login User using contact and password
  static Future<Response> loginUser(
      {required String? email, required String? password}) async {
    return await _apiManager!.dio!.post(_loginEndPoint, data: {
      'email': email,
      'password': password,
    });
  }

  /// FUNC [registerUser] : Register User with provided data
  static Future<Response> registerUser(
      {required String? firstName,
      String? middleName,
      required String? lastName,
      required String? email,
      required String? password,
      required String? confirmPassword}) async {
    return await _apiManager!.dio!.post(_registerEndPoint, data: {
      'first_name': firstName,
      if (middleName != null) 'middle_name': middleName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword
    });
  }

  /// FUNC [getUserProfileData] : Get user profile data
  static Future<Response> getUserProfileData() async {
    return await _apiManager!.dio!.get(_profileEndPoint);
  }

  /// FUNC [updateUserProfile] : Update user profile
  static Future<Response> updateUserProfile(FormData formData) async {
    return await _apiManager!.dio!.post(_profileEndPoint, data: formData);
  }
}
