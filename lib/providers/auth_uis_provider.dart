import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/services/hive_service.dart';
import '../core/services/navigation_service.dart';
import '../core/services/service_locator.dart';
import '../core/utilities/enum_utils.dart';
import '../models/local_storage/user_model.dart';
import '../widgets/custom_snackbar.dart';
import '../core/constants/routes.dart' as routes;

import 'auth_provider.dart';

class AuthUISProvider with ChangeNotifier {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _editProfileFormKey = GlobalKey<FormState>();
  String? _email;
  String? _imageUrl;
  String? _fullName;
  String? _phone;
  String? _password;
  String? _confirmPassword;
  bool? _isLoading = false;
  String? _base64;
  String? _imageFileSize;

  String? get email => _email;

  String? get fullName => _fullName;

  String? get phone => _phone;

  String? get password => _password;

  String? get confirmPassword => _confirmPassword;

  String? get imageUrl => _imageUrl;

  String? get base64 => _base64;

  String? get imageFileSize => _imageFileSize;

  bool? get isLoading => _isLoading;

  GlobalKey<FormState> get loginFormKey => _loginFormKey;

  GlobalKey<FormState> get signUpFormKey => _signUpFormKey;

  GlobalKey<FormState> get editProfileFormKey => _editProfileFormKey;

  void setEmail(String? newEmail) {
    _email = newEmail!;
    notifyListeners();
  }

  void setFullName(String? newFullName) {
    _fullName = newFullName!;
    notifyListeners();
  }

  void setPhone(String? newPhone) {
    _phone = newPhone!;
    notifyListeners();
  }

  void setBase64(String? value) {
    _base64 = value!;
    notifyListeners();
  }

  void setImageSize(String? value) {
    _imageFileSize = value!;
    notifyListeners();
  }

  void setPassword(String? newPassword) {
    _password = newPassword!;
    notifyListeners();
  }

  void setConfirmPassword(String? newConfirmPassword) {
    _confirmPassword = newConfirmPassword!;
    notifyListeners();
  }

  void setIsLoading(bool? value) {
    _isLoading = value!;
    notifyListeners();
  }

  // =========================== Sign In ======================================

  void submitLoginData() async {
    if (!_loginFormKey.currentState!.validate()) return;
    _loginFormKey.currentState!.save();
    setIsLoading(true);
    final bool result = await locator<AuthProvider>()
        .login(email: _email!, password: _password!);
    showCustomSnackBar(
        context: locator<NavigationService>().getNavigationContext(),
        message: result ? 'Login Successful !' : 'Invalid Email or Password',
        isError: !result);
    if (result) {
      clearLoginData();
      // locator<NavigationService>().navigateTo(routes.landingRoute);
      locator<NavigationService>().navigateTo(routes.tempLandingRoute);
    }
    setIsLoading(false);
  }

  void clearLoginData() {
    _email = null;
    _password = null;
    _isLoading = false;
    notifyListeners();
  }

  // =========================== End Sign In ======================================

  // =========================== Sign Up ======================================
  bool _isTermsAgreed = true;

  void setIsTermsAgreed(bool value) {
    _isTermsAgreed = value;
    notifyListeners();
  }

  void submitSignUpData() async {
    if (!_signUpFormKey.currentState!.validate()) return;
    if (!_isTermsAgreed) return;
    _signUpFormKey.currentState!.save();
    setIsLoading(true);
    List<String> username = _fullName!.split(' ');
    final bool result = await locator<AuthProvider>().signUp(
        password: _password!,
        confirmPassword: _confirmPassword!,
        email: _email!,
        firstName: username[0],
        lastName: username.length == 2
            ? username[1]
            : username.length == 3
                ? username[2]
                : ' ',
        middleName: username.length == 3 ? username[1] : null);
    showCustomSnackBar(
        context: locator<NavigationService>().getNavigationContext(),
        message: result
            ? 'New User Registration Successful !'
            : 'Failed To Register New User !',
        isError: !result);
    if (result) {
      clearSignUpData();
      locator<NavigationService>().navigateTo(routes.tempLandingRoute);
      // locator<NavigationService>().navigateTo(routes.landingRoute);
    }
    setIsLoading(false);
  }

  void clearSignUpData() {
    _email = null;
    _password = null;
    _confirmPassword = null;
    _fullName = null;
    _isLoading = false;
    notifyListeners();
  }

  // =========================== End Sign Up ======================================

  // =========================== Edit Profile ======================================

  Future<void> loadUserData() async {
    final UserModel? userData =
        await locator<HiveService>().getBox(HiveBoxName.userData.stringValue);
    _fullName = userData!.middleName != null
        ? '${userData.firstName} ${userData.middleName} ${userData.lastName}'
        : '${userData.firstName} ${userData.lastName}';
    _email = userData.email;
    _imageUrl = userData.imageUrl;
    _phone = userData.phone;
    notifyListeners();
  }

  Future<void> editUserProfile() async {
    if (!_editProfileFormKey.currentState!.validate()) return;
    _editProfileFormKey.currentState!.save();
    setIsLoading(true);
    List<String> username = _fullName!.split(' ');
    bool result = await locator<AuthProvider>().updateUserProfile(
      base64: _base64,
      imageFileSize: _imageFileSize,
      email: _email!,
      firstName: username[0],
      lastName: username.length == 2
          ? username[1]
          : username.length == 3
              ? username[2]
              : ' ',
      middleName: username.length == 3 ? username[1] : null,
      phone: _phone,
    );
    showCustomSnackBar(
        context: locator<NavigationService>().getNavigationContext(),
        message: result
            ? 'User Profile Update Success !'
            : 'Failed To Update User Profile !',
        isError: !result);
    if (result) {
      clearEditProfileData();
      locator<NavigationService>().goBack();
    }
    setIsLoading(false);
  }

  void clearEditProfileData() {
    _email = null;
    _password = null;
    _confirmPassword = null;
    _fullName = null;
    _imageFileSize = null;
    _base64 = null;
    _isLoading = false;
    notifyListeners();
  }

// =========================== End of Edit Profile ======================================

}
