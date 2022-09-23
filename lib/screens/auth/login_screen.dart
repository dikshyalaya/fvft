import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_visa_free_ticket/core/services/hive_service.dart';
import '../../core/constants/route_constants.dart';
import '../../core/services/navigation_service.dart';
import '../../core/services/service_locator.dart';
import '../../core/theme/free_visa_free_ticket_theme.dart';
import '../../core/utilities/validators.dart';
import '../../providers/auth_uis_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_slider.dart';
import '../../widgets/custom_textformfield.dart';
import '../../core/constants/route_constants.dart' as routes;
import 'package:provider/provider.dart';

/// Screen [LoginScreen] : Login Screen
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: ListView(
        shrinkWrap: true,
        addRepaintBoundaries: false,
        addAutomaticKeepAlives: false,
        padding: EdgeInsets.zero,
        children: [
          CustomImageSlider(height: 600.h),
          _buildLoginTitle(),
          SizedBox(height: 40.h),
          _buildLoginForm(context),
        ],
      ),
    );
  }

  /// Widget [_buildLoginTitle] : Display Login Title
  Widget _buildLoginTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        'Login',
        style: FreeVisaFreeTicketTheme.heading1Style,
      ),
    );
  }

  /// Widget [_buildLoginForm] : Display login form with required fields
  Widget _buildLoginForm(final context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Form(
        key: Provider.of<AuthUISProvider>(context, listen: false).loginFormKey,
        child: Column(
          children: [
            _buildEmailTextField(context),
            SizedBox(height: 40.h),
            _buildPasswordTextField(context),
            SizedBox(height: 10.h),
            _buildForgotPasswordBtn(),
            SizedBox(height: 30.h),
            _buildSignInBtn(context),
            SizedBox(height: 30.h),
            _buildSignUpBtn(),
            SizedBox(height: 30.h),
            Text(
              'OR,',
              style: FreeVisaFreeTicketTheme.captionStyle,
            ),
            _buildContinueWithoutLogin(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  /// Widget [_buildEmailTextField] : Display email text field
  Widget _buildEmailTextField(final context) {
    return Selector<AuthUISProvider, String>(
      selector: (ctx, data) {
        return data.email ?? '';
      },
      builder: (_, email, __) {
        return CustomTextFormField(
          labelText: 'E-mail',
          isDense: true,
          value: email,
          onChanged: (value) {
            Provider.of<AuthUISProvider>(context, listen: false)
                .setEmail(value!);
          },
          validatorFunc: Validator.emailValidator,
        );
      },
    );
  }

  /// Widget [_buildPasswordTextField] : Display password text field
  Widget _buildPasswordTextField(final context) {
    return Selector<AuthUISProvider, String>(
      selector: (ctx, data) {
        return data.password ?? '';
      },
      builder: (_, password, __) {
        return CustomTextFormField(
          labelText: 'Password',
          isDense: true,
          value: password,
          isPassword: true,
          onChanged: (value) {
            Provider.of<AuthUISProvider>(context, listen: false)
                .setPassword(value!);
          },
          validatorFunc: Validator.passwordValidator,
        );
      },
    );
  }

  /// Widget [_buildForgotPasswordBtn] : Display forgot password button
  Widget _buildForgotPasswordBtn() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          locator<NavigationService>().navigateTo(RouteConstants.passwordResetReqRoute);
        },
        child: Text(
          'Forgot Password ?',
          style: FreeVisaFreeTicketTheme.bodyTextStyle,
        ),
      ),
    );
  }

  /// Widget [_buildSignInBtn] : Display Sign In Button
  Widget _buildSignInBtn(final context) {
    return Consumer<AuthUISProvider>(
      builder: (ctx, data, _) {
        return CustomButton(
          height: 100.h,
          width: double.infinity,
          color: FlexColor.greenLightPrimary,
          padding: EdgeInsets.symmetric(vertical: 20.h),
          title: 'SIGN IN',
          textColor: Colors.white,
          isLoading: data.isLoading!,
          borderRadius: 10.w,
          onTap: data.submitLoginData,
        );
      },
    );
  }

  /// Widget [_buildSignUpBtn] : Display Sign Up Button
  Widget _buildSignUpBtn() {
    return InkWell(
      onTap: () {
        // locator<NavigationService>().navigateTo(routes.signUpRoute);
        locator<NavigationService>().navigateTo(RouteConstants.tempSignUpScreen);
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 20.h,
        ),
        child: RichText(
          text: TextSpan(
            text: "Don't have an account ? ",
            children: [
              TextSpan(
                text: 'SIGN UP',
                style: FreeVisaFreeTicketTheme.caption1Style,
              ),
            ],
            style: FreeVisaFreeTicketTheme.bodyTextStyle,
          ),
        ),
      ),
    );
  }

  Widget _buildContinueWithoutLogin() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: TextButton.icon(
        onPressed: () {
  
          locator<NavigationService>()
              .pushReplacementNamed(RouteConstants.tempLandingRoute);
          // locator<NavigationService>()
          //     .pushReplacementNamed(routes.landingRoute);
        },
        icon: Icon(
          Icons.arrow_forward,
          size: 30.w,
        ),
        label: Text(
          'Continue Without Login ?',
          style: FreeVisaFreeTicketTheme.bodyTextStyle,
        ),
      ),
    );
  }
}
