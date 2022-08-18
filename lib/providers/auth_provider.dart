import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../core/services/hive_service.dart';
import '../core/services/service_locator.dart';
import '../core/utilities/enum_utils.dart';
import '../core/utilities/logutils.dart';
import '../models/local_storage/user_model.dart';
import '../repositories/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  bool _userLoggedIn =false;
  bool get userLoggedIn => _userLoggedIn;



  void setCurrentUser(UserModel? user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<bool> login({required String? email, required String? password}) async {
    try {
      final response =
          await AuthRepository.loginUser(email: email, password: password);
      if (response.data != null && response.data['success']) {
        print('Login: ${response.data['data']['user']}');
        _currentUser = UserModel.fromJson(response.data['data']['user']);
        notifyListeners();
        await Future.wait([
          _cacheUser(_currentUser!),
          _cacheUserToken(response.data['data']['token'])
        ]);
        return true;
      }
      return false;
    } catch (e) {
      LogUtils.logError('Login Error: $e');
      return false;
    }
  }

  Future<bool> signUp(
      {required String? firstName,
      String? middleName,
      required String? lastName,
      required String? email,
      required String? password,
      required String? confirmPassword}) async {
    try {
      final response = await AuthRepository.registerUser(
          middleName: middleName,
          lastName: lastName,
          firstName: firstName,
          email: email,
          confirmPassword: confirmPassword,
          password: password);
      if (response.data != null && response.data['success']) {
        _currentUser = UserModel.fromJson(response.data['data']['user']);
        notifyListeners();
        await Future.wait([
          _cacheUser(_currentUser!),
          _cacheUserToken(response.data['data']['token'])
        ]);
        return true;
      }
      return false;
    } on DioError catch (e) {
      LogUtils.logError('SignUp DIO Error: ${e.response}');
      LogUtils.logError('SignUp DIO Error: ${e.message}');
      return false;
    } catch (e) {
      LogUtils.logError('SignUp Error: $e');
      return false;
    }
  }

  Future<void> getUserProfileData() async {
    try {
      final response = await AuthRepository.getUserProfileData();
      if (response.data != null && response.data['success']) {
        _currentUser = UserModel.fromJson(response.data['data']);
        notifyListeners();
        await _cacheUser(_currentUser!, isToUpdate: true);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateUserProfile(
      {required String? firstName,
      String? middleName,
      required String? lastName,
      required String? email,
      String? base64,
      String? phone,
      String? imageFileSize}) async {
    try {
      FormData formData = FormData.fromMap({
        'first_name': firstName,
        if (middleName != null) 'middle_name': middleName,
        'last_name': lastName,
        if (phone != null) 'phone': phone,
        'email': email,
        if (base64 != null && imageFileSize != null)
          'profile_img': {
            'base64': 'data:image/jpeg;base64,' + base64,
            'file_size': imageFileSize
          }
      });
      final response = await AuthRepository.updateUserProfile(formData);
      if (response.data != null && response.data['success']) {
        _currentUser = UserModel.fromJson(response.data['data']);
        notifyListeners();
        await _cacheUser(_currentUser!, isToUpdate: true);
        return true;
      }
      return false;
    } on DioError catch (e) {
      LogUtils.logError('Update Profile DIO Error: ${e.response}');
      LogUtils.logError('Update Profile DIO Error: ${e.message}');
      return false;
    } catch (e) {
      LogUtils.logError('Update Profile Error: $e');
      return false;
    }
  }

Future<void> loggedIn()async{
    bool userLoggedIn =  await locator<HiveService>()
        .isExists(boxName: HiveBoxName.userData.stringValue);

        _userLoggedIn = userLoggedIn ;
        notifyListeners();



}


  // ============================ Caching Logged In User Token & Data On Hive ===========================
  Future<void> _cacheUser(UserModel? userModel,
      {bool isToUpdate = false}) async {
    bool userExists = await locator<HiveService>()
        .isExists(boxName: HiveBoxName.userData.stringValue);
    if (!userExists) {
      await locator<HiveService>().addBox(_currentUser, HiveBoxName.userData.stringValue);
    }
    if (isToUpdate) {
      await locator<HiveService>().updateBox(_currentUser, HiveBoxName.userData.stringValue);
    }
  }

  Future<void> _cacheUserToken(String? token, {bool isToUpdate = false}) async {
    bool tokenExists = await locator<HiveService>()
        .isExists(boxName: HiveBoxName.userToken.stringValue);
    if (!tokenExists) {
      await locator<HiveService>()
          .addBox(token, HiveBoxName.userToken.stringValue);
    }
    if (isToUpdate) {
      await locator<HiveService>()
          .updateBox(token, HiveBoxName.userToken.stringValue);
    }
  }
}
