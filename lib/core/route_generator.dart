import 'package:flutter/material.dart';
import '../screens/auth/temp_login_screen.dart';
import '../screens/auth/temp_signup_screen.dart';
import '../screens/category/temp_category_list_screen.dart';
import '../screens/company_listview_screen.dart';
import '../screens/country_jobs_screen.dart';
import '../screens/country_listview_screen.dart';
import '../screens/job/temp_job_accepted_screen.dart';
import '../screens/job/temp_job_applied_screen.dart';
import '../screens/job/temp_job_detail_screen.dart';
import '../screens/job/temp_job_rejected_screen.dart';
import '../screens/landing_screen.dart';
import '../screens/language_selection_screen.dart';
import '../providers/auth_provider.dart';
import '../screens/job/temp_job_list_post_view_screen.dart';
import 'services/service_locator.dart';
import '../providers/auth_uis_provider.dart';
import '../providers/country_provider.dart';
import '../providers/cv_provider.dart';
import '../providers/job_application_provider.dart';
import '../providers/job_filter_provider.dart';
import '../providers/job_prefrences/job_preference_ui_provider.dart';
import '../providers/job_provider.dart';
import '../providers/news_provider.dart';
import '../providers/paginations/category_jobs_pagination_provider.dart';
import '../providers/paginations/category_pagination_provider.dart';
import '../providers/paginations/job_pagination_provider.dart';
import '../screens/auth/forgot_password/password_reset_req_screen.dart';
import '../screens/auth/forgot_password/password_reset_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/sign_up_screen.dart';
import '../screens/category/job/category_job_list_screen.dart';
import '../screens/profile/job_preference/job_preference_screen.dart';
import '../screens/profile/setting_screen.dart';
import '../screens/job/job_detail_screen.dart';
import '../screens/news/latest_news_screen.dart';
import '../screens/news/news_detail_screen.dart';
import '../screens/news/news_list_view_screen.dart';
import '../screens/profile/edit/change_password_screen.dart';
import '../screens/profile/edit/edit_profile_screen.dart';
import '../screens/profile/manual_cv/upload_cv_screen.dart';
import '../screens/profile/manual_cv/view_cv_screen.dart';
import '../screens/splash_screen.dart';
import '../widgets/web_view_screen.dart';
import 'package:provider/provider.dart';
import 'constants/routes.dart' as routes;

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: settings, builder: (context) => const SplashScreen());
      case routes.loginRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (ctx) => AuthUISProvider()),
            ],
            child: const LoginScreen(),
          ),
        );
      case routes.tempLoginScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (ctx) => AuthUISProvider()),
            ],
            child: const TempLoginScreen(),
          ),
        );
      case routes.signUpRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider(
            child: const SignUpScreen(),
            create: (ctx) => AuthUISProvider(),
          ),
        );
      case routes.tempSignUpScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider(
            child: const TempSignUpScreen(),
            create: (ctx) => AuthUISProvider(),
          ),
        );
      case routes.passwordResetRoute:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const PasswordResetScreen());
      case routes.passwordResetReqRoute:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const PasswordResetRequestScreen());
      case routes.tempLandingRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (ctx) => NewsProvider()),
              ChangeNotifierProvider.value(value: locator<JobProvider>()),
              ChangeNotifierProvider(
                  create: (ctx) => CategoryPaginationProvider()),
              // ChangeNotifierProvider.value(value: locator<JobProvider>()),
              ChangeNotifierProvider.value(value: locator<CountryProvider>()),
              ChangeNotifierProvider.value(value: locator<JobFilterProvider>()),
              ChangeNotifierProvider.value(
                  value: locator<JobPaginationProvider>()),
              ChangeNotifierProvider.value(
                  value: locator<JobApplicationProvider>()),
            ],
            child: const TempLandingScreen(),
          ),
        );
      case routes.editProfileRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider.value(
            child: const EditProfileScreen(),
            value: AuthUISProvider(),
          ),
        );
      case routes.changePasswordRoute:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const ChangePasswordScreen());
      case routes.jobDetailRoute:
        final args = arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => ChangeNotifierProvider.value(
                  value: locator<JobApplicationProvider>(),
                  child: JobDetailScreen(
                    jobDetail: args!['jobDetail'],
                  ),
                ));
      case routes.jobPreferenceRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => MultiProvider(
            child: const JobPreferenceScreen(),
            providers: [
              ChangeNotifierProvider(
                create: (ctx) => JobPreferenceUIProvider(),
              ),
              ChangeNotifierProvider(
                create: (ctx) => locator<JobFilterProvider>(),
              ),
            ],
          ),
        );
      case routes.webViewRoute:
        final args = arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => WebViewScreen(
            appBarTitle: args!['appBarTitle'],
            urlToRender: args['urlToRender'],
          ),
        );
      case routes.categoryJobListRoute:
        final args = arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider.value(value: locator<JobProvider>()),
                    ChangeNotifierProvider.value(
                        value: locator<JobApplicationProvider>()),
                    ChangeNotifierProvider.value(
                        value: locator<CategoryJobsPaginationProvider>()),
                  ],
                  child: CategoryJobListScreen(
                    jobCategoryId: args!['jobCategoryId'],
                    jobCategoryName: args['jobCategoryName'],
                  ),
                ));
      case routes.settingsRoute:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const SettingScreen());
      case routes.allNewsRoute:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => ChangeNotifierProvider.value(
                  child: const NewsListViewScreen(),
                  value: NewsProvider(),
                ));
      case routes.newsDetailRoute:
        final Map<String, dynamic>? args = arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => NewsDetailScreen(news: args!['news']));
      case routes.latestNewsRoute:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const LatestNewsScreen());
      case routes.uploadCvRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider.value(
            child: const UploadCVScreen(),
            value: locator<CVProvider>(),
          ),
        );
      case routes.viewCvRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider.value(
            child: const ViewCVScreen(),
            value: locator<CVProvider>(),
          ),
        );
      case routes.viewAllJobCategory:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider.value(
            value: CategoryPaginationProvider(),
            child: const TempCategoryListScreen(),
          ),
        );  
      case routes.countryListViewScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CountryListViewScreen(),
        );
      case routes.latestJobListScreen:
        final Map<String, dynamic>? args = arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: locator<JobProvider> ()),
              ChangeNotifierProvider.value(
                value: JobApplicationProvider(),
              ),
              ChangeNotifierProvider.value(
                value: locator<JobPaginationProvider>(),
              ),
              //JobApplicationProvider
            ],
            child: JobListPostViewScreen(
                appBarTitle: args!['appBarTitle'] ?? 'Jobs'),
          ),
        );
      case routes.companyListScreen:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const CompanyListViewScreen());
      case routes.tempLanguageSelection:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const TempLanguageSelectionScreen(),
        );
      case routes.tempAppliedJobScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider.value(
            value: locator<JobApplicationProvider>(),
            child: const TempJobAppliedScreen(),
          ),
        );
      case routes.tempShortListedJobScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider.value(
            value: locator<JobApplicationProvider>(),
            child: const TempJobAcceptedScreen(),
          ),
        );
      case routes.tempRejectedApplication:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider.value(
            value: locator<JobApplicationProvider>(),
            child: const TempJobRejectedScreen(),
          ),
        );
      case routes.tempJobDetailScreen:
        final args = arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => ChangeNotifierProvider.value(
              value: locator<JobApplicationProvider>(),
              child: TempJobDetailScreen(
                jobDetail: args!['jobDetail'],
              ),
            ));
      case routes.countryJobsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider.value(
            value: locator<AuthProvider>(),
            child: const CountryJobsScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const SplashScreen());
    }
  }
}
