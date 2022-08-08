import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import '../../core/services/navigation_service.dart';
import '../../core/services/service_locator.dart';
import '../../core/theme/free_visa_free_ticket_theme.dart';
import '../../core/utilities/validators.dart';
import '../../providers/auth_uis_provider.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/routes.dart' as routes;
import 'package:provider/provider.dart';

/// Screen [SignUpScreen] : Sign up screen
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        isToShowBackButton: true,
        isToShowTitle: false,
      ),
      body: ListView(
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        children: [
          SizedBox(height: 20.h),
          customTitle('Create a new account ?', fontSize: 36.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Form(
              key: Provider.of<AuthUISProvider>(context, listen: false)
                  .signUpFormKey,
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  _buildFullNameTextField(context),
                  SizedBox(height: 40.h),
                  _buildEmailTextField(context),
                  SizedBox(height: 40.h),
                  _buildPasswordTextField(context),
                  SizedBox(height: 40.h),
                  _buildConfirmPasswordTextField(context),
                  SizedBox(height: 50.h),
                  _buildSignUpBtn(context),
                  SizedBox(height: 10.h),
                  _buildSignInBtn(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget [_buildFullNameTextField] : Display full name text field
  Widget _buildFullNameTextField(final context) {
    return Selector<AuthUISProvider, String>(
      selector: (ctx, data) {
        return data.fullName ?? '';
      },
      builder: (_, fullName, __) {
        return CustomTextFormField(
          labelText: 'Full Name',
          isDense: true,
          value: fullName,
          validatorFunc: Validator.fullNameValidator,
          onChanged: (value) {
            Provider.of<AuthUISProvider>(context, listen: false)
                .setFullName(value!);
          },
        );
      },
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
          validatorFunc: Validator.emailValidator,
          onChanged: (value) {
            Provider.of<AuthUISProvider>(context, listen: false)
                .setEmail(value!);
          },
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
          validatorFunc: Validator.passwordValidator,
          onChanged: (value) {
            Provider.of<AuthUISProvider>(context, listen: false)
                .setPassword(value!);
          },
        );
      },
    );
  }

  /// Widget [_buildConfirmPasswordTextField] : Display confirm password text field
  Widget _buildConfirmPasswordTextField(final context) {
    return Selector<AuthUISProvider, String>(
      selector: (ctx, data) {
        return data.confirmPassword ?? '';
      },
      builder: (_, confirmPassword, __) {
        return CustomTextFormField(
          labelText: 'Confirm Password',
          isDense: true,
          value: confirmPassword,
          isPassword: true,
          validatorFunc: Validator.confirmPasswordValidator,
          onChanged: (value) {
            Provider.of<AuthUISProvider>(context, listen: false)
                .setConfirmPassword(value!);
          },
        );
      },
    );
  }

  /// Widget [_buildSignUpBtn] : Display Sign Up Button
  Widget _buildSignUpBtn(final context) {
    return Consumer<AuthUISProvider>(
      builder: (ctx, data, _) {
        return CustomButton(
          height: 100.h,
          width: double.infinity,
          color: FlexColor.greenLightPrimary,
          padding: EdgeInsets.symmetric(vertical: 20.h),
          textColor: Colors.white,
          title: 'SIGN UP',
          isLoading: data.isLoading!,
          borderRadius: 10.w,
          onTap: data.submitSignUpData,
        );
      },
    );
  }

  /// Widget [_buildSignUpBtn] : Display Sign In Button
  Widget _buildSignInBtn() {
    return InkWell(
      onTap: () {
        // locator<NavigationService>().pushReplacementNamed(routes.loginRoute);
        locator<NavigationService>().pushReplacementNamed(routes.tempLoginScreen);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: RichText(
          text: TextSpan(
            text: 'Already have an account? ',
            children: [
              TextSpan(
                text: 'SIGN IN',
                style: FreeVisaFreeTicketTheme.caption1Style,
              ),
            ],
            style: FreeVisaFreeTicketTheme.bodyTextStyle,
          ),
        ),
      ),
    );
  }
}
