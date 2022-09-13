import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/services/navigation_service.dart';
import '../core/services/service_locator.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';
import '../core/constants/routes.dart' as routes;

import '../core/constants/assets_source.dart';
import 'custom_button.dart';

class LoginToContinueWidget extends StatelessWidget {
  const LoginToContinueWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AssetsSource.freeVisaFreeTicketLogo, height: 250.h),
          SizedBox(height: 30.h),
          InkWell(
            onTap: () {
              locator<NavigationService>()
                  .pushReplacementNamed(routes.tempLoginScreen);
            },
            borderRadius: BorderRadius.circular(50.w),
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              decoration: FreeVisaFreeTicketTheme.gradientDecoration,
              height: 80.h,
              width: 450.w,
              alignment: Alignment.center,
              child: Text(
                'Login To Continue',
                style: FreeVisaFreeTicketTheme.captionStyle.copyWith(
                  color: FreeVisaFreeTicketTheme.whiteColor,
                  height: 1,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          TextButton.icon(
            onPressed: () {
              locator<NavigationService>()
                  .pushReplacementNamed(routes.tempLandingRoute);
            },
            icon: Icon(
              Icons.arrow_forward,
              color: Color.lerp(
                FreeVisaFreeTicketTheme.primaryColor.withOpacity(0.8),
                FreeVisaFreeTicketTheme.secondaryColor.withOpacity(0.8),
                0.8,
              ),
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
        ],
      ),
    );
  }
}
