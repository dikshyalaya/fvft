import 'dart:async';

import '../core/constants/assets_source.dart';
import '../core/constants/routes.dart' as routes;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/services/hive_service.dart';
import '../core/services/navigation_service.dart';
import '../core/services/service_locator.dart';
import '../core/utilities/enum_utils.dart';
import '../models/local_storage/user_model.dart';
import '../providers/auth_provider.dart';
import '../providers/country_provider.dart';
import '../providers/cv_provider.dart';
import '../providers/job_application_provider.dart';
import '../providers/job_prefrences/user_country_prefs_provider.dart';
import '../providers/job_prefrences/user_job_prefs_provider.dart';
import '../providers/job_provider.dart';
import '../providers/news_provider.dart';

/// SCREEN [SplashScreen] : Splash screen, display logo of app for 3 sec
/// and navigate to language selection screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Future? _getData;
  bool? _isInit = true;
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    _animation =
        CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn);
    _controller!.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit!) {
      _getData = _fetchData();
    }
    _isInit = false;
  }

  Future _fetchData() async {
    final bool hasBanner = await locator<NewsProvider>().hasBannerInCache();
    await Future.wait([
      Future.delayed(const Duration(seconds: 3)),
      if (!hasBanner) locator<NewsProvider>().getListOfBanners(),
    ]);
    if (hasBanner) unawaited(locator<NewsProvider>().getBannerFromCache());
    unawaited(locator<CountryProvider>().getTotalListOfCountries());
    unawaited(locator<JobProvider>().getAllJobsCategories());
    String? languageCode;
    final bool isLanExist = await locator<HiveService>()
        .isExists(boxName: HiveBoxName.selectedLanCode.stringValue);
    if (isLanExist) {
      languageCode = await locator<HiveService>()
          .getBox(HiveBoxName.selectedLanCode.stringValue); //en/ne
    }
    UserModel? userModel;
    final bool isUserExists = await locator<HiveService>()
        .isExists(boxName: HiveBoxName.userData.stringValue);
    if (isUserExists) {
      userModel =
          await locator<HiveService>().getBox(HiveBoxName.userData.stringValue);
    }
    final bool isUserCvExists = await locator<HiveService>()
        .isExists(boxName: HiveBoxName.userCV.stringValue);
    if (userModel != null && userModel.email != null) {
      locator<AuthProvider>().setCurrentUser(userModel);
      unawaited(locator<JobApplicationProvider>().getOnProcessJobList());
      unawaited(locator<JobApplicationProvider>().getPendingJobList());
      unawaited(locator<JobApplicationProvider>().getAcceptedJobList());
      unawaited(locator<UserCountryPrefsProvider>().getCountryFromPrefsList());
      unawaited(locator<UserJobPrefsProvider>().getJobCategoryFromPrefsList());
      if (!isUserCvExists) {
        unawaited(locator<CVProvider>().getUserCV());
      } else {
        unawaited(locator<CVProvider>().getUserCVFromCache());
      }
    }
    if (languageCode == null) {
      locator<NavigationService>()
          .pushReplacementNamed(routes.tempLanguageSelection);
    } else {
      locator<NavigationService>()
          .pushReplacementNamed(routes.tempLandingRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getData,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Center(
            child: ScaleTransition(
              scale: _animation!,
              alignment: Alignment.center,
              child: Image.asset(
                AssetsSource.freeVisaFreeTicketLogo,
                height: 500.h,
              ),
            ),
          );
        },
      ),
    );
  }
}
