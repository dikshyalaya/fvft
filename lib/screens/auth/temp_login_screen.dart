import 'package:flutter/material.dart';
import '../../core/constants/assets_source.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/free_visa_free_ticket_theme.dart';
import 'package:provider/provider.dart';

import '../../core/services/navigation_service.dart';
import '../../core/services/service_locator.dart';
import '../../core/utilities/validators.dart';
import '../../providers/auth_uis_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfield.dart';
import '../../core/constants/routes.dart' as routes;

class TempLoginScreen extends StatelessWidget {
  const TempLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: ListView(
              shrinkWrap: true,
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: false,
                children: [
                  SizedBox(height: 30.h),
                  Image.asset(
                    AssetsSource.freeVisaFreeTicketLogo,
                    height: 250.w,
                    width: 250.w,
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Welcome to Free Visa Free Ticket',
                    style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: FreeVisaFreeTicketTheme.darkGrayColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Find your dream abroad job\nwith ZERO cost',
                    style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                      fontWeight: FontWeight.w400,
                      color: FreeVisaFreeTicketTheme.darkGrayColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    'LOGIN',
                    style: FreeVisaFreeTicketTheme.heading1Style.copyWith(
                      fontWeight: FontWeight.w600,
                      color: FreeVisaFreeTicketTheme.primaryColor,
                      fontSize: 40.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.h),
                  _buildLoginForm(context),
                ],
              ),
            ),
            Positioned(
              top: -10,
              right: 0,
              child: Image.asset(
                AssetsSource.topDesign,
                width: 300.w,
                height: 300.h,
              ),
            ),
            Positioned(
              bottom: -40,
              left: 0,
              child: Image.asset(
                AssetsSource.bottomDesign,
                width: 300.w,
                height: 300.h,
              ),
            )
          ],
        ),
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
            SizedBox(height: 20.h),
            _buildSignInBtn(context),
            SizedBox(height: 20.h),
            Text(
              "Don't have an account? Register here",
              style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                color: FreeVisaFreeTicketTheme.darkGrayColor,
              ),
            ),
            SizedBox(height: 20.h),
            _buildSignUpBtn(),
            // SizedBox(height: 10.h),
            _buildContinueWithoutLogin(),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
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
          labelText: 'Email Address',
          isDense: true,
          value: email,
          textInputAction: TextInputAction.next,
          prefixWidget: Icon(
            Icons.email,
            color: Color.lerp(
              FreeVisaFreeTicketTheme.primaryColor,
              FreeVisaFreeTicketTheme.secondaryColor,
              0.8,
            ),
          ),
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
          prefixWidget: Icon(
            Icons.lock,
            color: Color.lerp(
              FreeVisaFreeTicketTheme.primaryColor.withOpacity(0.8),
              FreeVisaFreeTicketTheme.secondaryColor.withOpacity(0.8),
              0.8,
            ),
          ),
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
          locator<NavigationService>().navigateTo(routes.passwordResetReqRoute);
        },
        child: Text(
          'Forgot Password ?',
          style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
            color: FreeVisaFreeTicketTheme.darkGrayColor,
          ),
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
          width: 350.w,
          color: Color.lerp(
            FreeVisaFreeTicketTheme.primaryColor.withOpacity(0.8),
            FreeVisaFreeTicketTheme.secondaryColor.withOpacity(0.8),
            0.8,
          ),
          padding: EdgeInsets.symmetric(vertical: 15.h),
          title: 'Login',
          textColor: Colors.white,
          isLoading: data.isLoading!,
          borderRadius: 20.w,
          onTap: data.submitLoginData,
        );
      },
    );
  }

  Widget _buildSignUpBtn() {
    return CustomButton(
      height: 100.h,
      width: 350.w,
      color: FreeVisaFreeTicketTheme.darkGrayColor,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      title: 'Sign Up',
      textColor: Colors.white,
      borderRadius: 20.w,
      onTap: () {
        // locator<NavigationService>().navigateTo(routes.signUpRoute);
        locator<NavigationService>().navigateTo(routes.tempSignUpScreen);
      },
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
              .pushReplacementNamed(routes.tempLandingRoute);
          // locator<NavigationService>()
          //     .pushReplacementNamed(routes.landingRoute);
        },
        icon: Icon(
          Icons.arrow_forward,
          size: 30.w,
        ),
        label: Text(
          'Skip to explore jobs',
          style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
            color: Color.lerp(
              FreeVisaFreeTicketTheme.primaryColor.withOpacity(0.8),
              FreeVisaFreeTicketTheme.secondaryColor.withOpacity(0.8),
              0.8,
            ),
          ),
        ),
      ),
    );
  }
}
