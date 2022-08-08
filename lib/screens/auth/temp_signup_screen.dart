import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/constants/assets_source.dart';
import '../../core/services/navigation_service.dart';
import '../../core/services/service_locator.dart';
import '../../core/theme/free_visa_free_ticket_theme.dart';
import '../../core/constants/routes.dart' as routes;

import '../../core/utilities/validators.dart';
import '../../providers/auth_uis_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfield.dart';

class TempSignUpScreen extends StatefulWidget {
  const TempSignUpScreen({Key? key}) : super(key: key);

  @override
  State<TempSignUpScreen> createState() => _TempSignUpScreenState();
}

class _TempSignUpScreenState extends State<TempSignUpScreen> {
  bool _isTermsAgreed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
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
            ),
            SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: ListView(
                shrinkWrap: true,
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: false,
                children: [
                  // SizedBox(height: 30.h),
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
                  SizedBox(height: 20.h),
                  Text(
                    'REGISTER',
                    style: FreeVisaFreeTicketTheme.heading1Style.copyWith(
                      fontWeight: FontWeight.w600,
                      color: FreeVisaFreeTicketTheme.primaryColor,
                      fontSize: 40.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Form(
                      key: Provider.of<AuthUISProvider>(context, listen: false)
                          .signUpFormKey,
                      child: Column(
                        children: [
                          _buildFullNameTextField(context),
                          SizedBox(height: 30.h),
                          _buildEmailTextField(context),
                          SizedBox(height: 30.h),
                          _buildPasswordTextField(context),
                          SizedBox(height: 30.h),
                          _buildConfirmPasswordTextField(context),
                          SizedBox(height: 30.h),
                          _buildTermsAndCondition(),
                          SizedBox(height: 20.h),
                          _buildSignUpBtn(context),
                          SizedBox(height: 30.h),
                          _buildSignInBtn(),
                          _buildContinueWithoutLogin(),
                          SizedBox(
                              height: MediaQuery.of(context).viewInsets.bottom),
                        ],
                      ),
                    ),
                  ),
                  // _buildLoginForm(context),
                ],
              ),
            ),
          ],
        ),
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
          textInputAction: TextInputAction.next,
          prefixWidget: Icon(
            Icons.account_circle_outlined,
            color: Color.lerp(
              FreeVisaFreeTicketTheme.primaryColor,
              FreeVisaFreeTicketTheme.secondaryColor,
              0.8,
            ),
          ),
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
          textInputAction: TextInputAction.next,
          prefixWidget: Icon(
            Icons.password,
            color: Color.lerp(
              FreeVisaFreeTicketTheme.primaryColor,
              FreeVisaFreeTicketTheme.secondaryColor,
              0.8,
            ),
          ),
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
          textInputAction: TextInputAction.done,
          prefixWidget: Icon(
            Icons.password,
            color: Color.lerp(
              FreeVisaFreeTicketTheme.primaryColor,
              FreeVisaFreeTicketTheme.secondaryColor,
              0.8,
            ),
          ),
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
          width: 350.w,
          color: Color.lerp(
            FreeVisaFreeTicketTheme.primaryColor.withOpacity(0.8),
            FreeVisaFreeTicketTheme.secondaryColor.withOpacity(0.8),
            0.8,
          ),
          padding: EdgeInsets.symmetric(vertical: 15.h),
          textColor: Colors.white,
          title: 'SIGN UP',
          isLoading: data.isLoading!,
          borderRadius: 20.w,
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
        locator<NavigationService>()
            .pushReplacementNamed(routes.tempLoginScreen);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          // vertical: 20.h,
        ),
        child: RichText(
          text: TextSpan(
            text: 'Already have an account? ',
            children: [
              TextSpan(
                text: 'SIGN IN',
                style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                  color: Color.lerp(
                    FreeVisaFreeTicketTheme.primaryColor.withOpacity(0.8),
                    FreeVisaFreeTicketTheme.secondaryColor.withOpacity(0.8),
                    0.8,
                  ),
                ),
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
              .pushReplacementNamed(routes.tempLandingRoute);
        },
        icon: Icon(
          Icons.arrow_forward,
          size: 30.w,
        ),
        label: Text(
          'Skip to explore jobs',
          style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
            color: FreeVisaFreeTicketTheme.primaryAndSecondaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildTermsAndCondition() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: _isTermsAgreed,
              onChanged: (value) {
                setState(() {
                  _isTermsAgreed = !_isTermsAgreed;
                });
                Provider.of<AuthUISProvider>(context)
                    .setIsTermsAgreed(_isTermsAgreed);
              },
              activeColor: Color.lerp(
                FreeVisaFreeTicketTheme.primaryColor.withOpacity(0.8),
                FreeVisaFreeTicketTheme.secondaryColor.withOpacity(0.8),
                0.8,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Text(
                'I agree with Terms and Privacy',
                style: FreeVisaFreeTicketTheme.body1TextStyle.copyWith(
                  color: FreeVisaFreeTicketTheme.darkGrayColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        if (!_isTermsAgreed)
          Padding(
            padding: EdgeInsets.only(top: 15.h, left: 10.w),
            child: Text(
              'Terms & condition must be agreed to complete sign up',
              style: FreeVisaFreeTicketTheme.body3TextStyle.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 23.sp,
                color: FreeVisaFreeTicketTheme.darkRedColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }
}
