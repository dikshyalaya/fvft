import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:free_visa_free_ticket/main.dart';
import '../../../core/constants/assets_source.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/free_visa_free_ticket_theme.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_textformfield.dart';
import '../../../core/constants/routes.dart' as routes;

/// Screen [PasswordResetRequestScreen] : Forgot password reset request screen
class PasswordResetRequestScreen extends StatelessWidget {
  const PasswordResetRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        isToShowTitle: false,
        backBtnColor: FreeVisaFreeTicketTheme.whiteColor,
      ),
      body: ListView(
        addRepaintBoundaries: false,
        addAutomaticKeepAlives: false,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        children: [
          SizedBox(height: 50.w),
          // _buildSvgIcon(),
          _buildForgotPasswordCaption(),
          _buildPasswordResetReqForm(),
          TextButton(
            onPressed: () {
              locator<NavigationService>().goBack();
            },
            child: Text(
              'Back To Login',
              style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                color: FreeVisaFreeTicketTheme.primaryColor,
              ),
            ),
          ),
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
        'Reset\nPassword',
        style: FreeVisaFreeTicketTheme.heading1Style.copyWith(
          color: FreeVisaFreeTicketTheme.primaryColor,
        ),
      ),
    );
  }

  /// Widget [_buildPasswordResetReqForm] : Display password reset request form
  Widget _buildPasswordResetReqForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Form(
        child: Column(
          children: [
            SizedBox(height: 30.h),
            _buildEmailTextField(),
            SizedBox(height: 30.h),
            _buildResetRequestButton(),
          ],
        ),
      ),
    );
  }

  /// Widget [_buildEmailTextField] : Display email text field
  Widget _buildEmailTextField() {
    return CustomTextFormField(
      labelText: 'E-mail',
      isDense: true,
      onChanged: (value) {},
    );
  }

  /// Widget [_buildResetRequestButton] : Password reset request button
  Widget _buildResetRequestButton() {
    return Container(
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        gradient: FreeVisaFreeTicketTheme.appLinearGradient,
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        child: Text(
          'Reset My Password',
          style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
            color: FreeVisaFreeTicketTheme.whiteColor,
          ),
        ),
        onPressed: () {
          locator<NavigationService>().navigateTo(routes.passwordResetRoute);
        },
      ),
    );
  }
}
