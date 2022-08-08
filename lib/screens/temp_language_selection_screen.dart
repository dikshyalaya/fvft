import 'package:flutter/material.dart';
import '../core/constants/assets_source.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';
import '../widgets/custom_button.dart';

import '../core/services/hive_service.dart';
import '../core/services/navigation_service.dart';
import '../core/services/service_locator.dart';
import '../core/utilities/enum_utils.dart';
import '../core/constants/routes.dart' as routes;

class TempLanguageSelectionScreen extends StatefulWidget {
  const TempLanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  State<TempLanguageSelectionScreen> createState() =>
      _TempLanguageSelectionScreenState();
}

class _TempLanguageSelectionScreenState
    extends State<TempLanguageSelectionScreen> {
  bool _isEngSelected = true;
  bool _isLoading = false;

  Future<void> _onConfirmToEnglish() async {
    setState(() {
      _isLoading = true;
    });
    bool exists = await locator<HiveService>()
        .isExists(boxName: HiveBoxName.selectedLanCode.stringValue);
    if (exists) {
      await locator<HiveService>()
          .updateBox('en', HiveBoxName.selectedLanCode.stringValue);
    } else {
      await locator<HiveService>()
          .addBox('en', HiveBoxName.selectedLanCode.stringValue);
    }
    locator<NavigationService>().pushReplacementNamed(routes.tempLandingRoute);
// locator<NavigationService>()
//     .pushReplacementNamed(routes.landingRoute);
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _onConfirmToNepali() async {
    setState(() {
      _isLoading = true;
    });
    bool exists = await locator<HiveService>()
        .isExists(boxName: HiveBoxName.selectedLanCode.stringValue);
    if (exists) {
      await locator<HiveService>()
          .updateBox('ne', HiveBoxName.selectedLanCode.stringValue);
    } else {
      await locator<HiveService>()
          .addBox('ne', HiveBoxName.selectedLanCode.stringValue);
    }
    locator<NavigationService>().pushReplacementNamed(routes.tempLandingRoute);
    // locator<NavigationService>()
    //     .pushReplacementNamed(routes.landingRoute);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              Image.asset(
                AssetsSource.languageBackground,
                height: 1.sh,
                width: 1.sw,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 250.h,
                child: Image.asset(
                  AssetsSource.freeVisaFreeTicketLogoWithLight,
                  height: 300.w,
                  width: 300.w,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 550.h,
                child: Text(
                  'Select Langauge',
                  style: FreeVisaFreeTicketTheme.heading1Style.copyWith(
                    color: Colors.white,
                    fontSize: 40.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 620.h,
                child: Text(
                  'भाषा छनोट गर्नुहोस्',
                  style: FreeVisaFreeTicketTheme.heading3Style.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 720.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isEngSelected = true;
                            });
                          },
                          borderRadius: BorderRadius.circular(10.w),
                          child: Container(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor:
                                  FreeVisaFreeTicketTheme.whiteColor,
                              child: Image.asset(
                                AssetsSource.us,
                                width: 100.w,
                                height: 100.w,
                              ),
                            ),
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              color: _isEngSelected
                                  ? Colors.transparent
                                  : FreeVisaFreeTicketTheme.whiteColor
                                      .withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10.w),
                              border: Border.all(
                                color: !_isEngSelected
                                    ? Colors.transparent
                                    : FreeVisaFreeTicketTheme.primaryColor,
                                width: 5.w,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'English',
                          style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                            color: FreeVisaFreeTicketTheme.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isEngSelected = false;
                            });
                          },
                          borderRadius: BorderRadius.circular(10.w),
                          child: Container(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor:
                                  FreeVisaFreeTicketTheme.whiteColor,
                              child: Image.asset(
                                AssetsSource.nepal,
                                width: 100.w,
                                height: 100.w,
                              ),
                            ),
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              color: !_isEngSelected
                                  ? Colors.transparent
                                  : FreeVisaFreeTicketTheme.whiteColor
                                      .withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10.w),
                              border: Border.all(
                                color: _isEngSelected
                                    ? Colors.transparent
                                    : FreeVisaFreeTicketTheme.primaryColor,
                                width: 5.w,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'नेपाली',
                          style: FreeVisaFreeTicketTheme.caption1Style.copyWith(
                            color: FreeVisaFreeTicketTheme.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 950.h,
                child: Column(
                  children: [
                    CustomButton(
                      color: Color.lerp(
                        FreeVisaFreeTicketTheme.secondaryColor,
                        FreeVisaFreeTicketTheme.primaryColor,
                        1,
                      ),
                      title: 'Confirm',
                      width: 250.w,
                      height: 50.h,
                      borderRadius: 50.w,
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      textColor: FreeVisaFreeTicketTheme.whiteColor,
                      btnTitleFontWeight: FontWeight.w500,
                      isLoading: _isLoading,
                      onTap: () async => _isEngSelected
                          ? await _onConfirmToEnglish()
                          : await _onConfirmToNepali(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
