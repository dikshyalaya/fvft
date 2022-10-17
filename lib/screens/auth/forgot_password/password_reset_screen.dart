import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/assets_source.dart';
import '../../../core/constants/route_constants.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textformfield.dart';


/// Screen [PasswordResetScreen] : Forgot password reset screen with reset verification code
class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: customAppBar(context , 
        isToShowTitle: false,
      ),
      body: ListView(
        addRepaintBoundaries: false,
        addAutomaticKeepAlives: false,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          _buildSvgIcon(),
          _buildForgotPasswordCaption(),
          SizedBox(height: 20.h),
          _buildForgotPasswordSubCaption(),
          _buildPasswordResetForm(),
        ],
      ),
    );
  }

  /// Widget [_buildSvgIcon] : Display svg icon related to forgot password
  Widget _buildSvgIcon() {
    return SvgPicture.asset(
      AssetsSource.iconForgotPassword,
      width: double.infinity,
      height: 600.w,
    );
  }

  /// Widget [_buildForgotPasswordCaption] : Display screen caption as forgot password
  Widget _buildForgotPasswordCaption() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        'Forgot Password?',
        style: FreeVisaFreeTicketTheme.heading1Style,
      ),
    );
  }

  /// Widget [_buildForgotPasswordSubCaption] : Display sub caption for forgot password
  Widget _buildForgotPasswordSubCaption() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        'Enter a 6-digit verification code sent to email: example@gmail.com',
        style: FreeVisaFreeTicketTheme.bodyTextStyle,
      ),
    );
  }

  /// Widget [_buildPasswordResetForm] : Display password reset form
  Widget _buildPasswordResetForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Form(
        child: Column(
          children: [
            SizedBox(height: 30.h),
            _buildVerificationCodeTextField(),
            SizedBox(height: 30.h),
            _buildPasswordTextField(),
            SizedBox(height: 30.h),
            _buildConfirmPasswordTextField(),
            SizedBox(height: 30.h),
            _buildResetButton(),
            SizedBox(height: 5.h),
            _buildResendCodeBtn(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  /// Widget [_buildVerificationCodeTextField] : Display verification code text field
  Widget _buildVerificationCodeTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: CustomTextFormField(
        labelText: 'Enter 6-digit verification code',
        isDense: true,
        onChanged: (value) {},
      ),
    );
  }

  /// Widget [_buildPasswordTextField] : Display password text field
  Widget _buildPasswordTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: CustomTextFormField(
        labelText: 'Enter a new password',
        isDense: true,
        isPassword: true,
        onChanged: (value) {},
      ),
    );
  }

  /// Widget [_buildConfirmPasswordTextField] : Display confirm password text field
  Widget _buildConfirmPasswordTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: CustomTextFormField(
        labelText: 'Enter a confirm password',
        isDense: true,
        isPassword: true,
        onChanged: (value) {},
      ),
    );
  }

  /// Widget [_buildResetButton] : Password reset request button
  Widget _buildResetButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: CustomButton(
        height: 100.h,
        width: double.infinity,
        color: FlexColor.greenLightPrimary,
        textColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        title: 'Save',
        onTap: () {
          // locator<NavigationService>().navigateTo(routes.loginRoute);
          locator<NavigationService>().navigateTo(RouteConstants.tempLoginScreen);
        },
      ),
    );
  }

  /// Widget [_buildResendCodeBtn] : Display Resend Password Verification Code Button
  Widget _buildResendCodeBtn() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: RichText(
          text: TextSpan(
            text: "Didn't get a verification code? ",
            children: [
              TextSpan(
                text: 'Resend',
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
