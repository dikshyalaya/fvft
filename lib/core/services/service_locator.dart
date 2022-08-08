import '../network/api_manager.dart';
import 'hive_service.dart';
import '../../providers/auth_provider.dart';
import '../../providers/country_provider.dart';
import '../../providers/cv_provider.dart';
import '../../providers/job_application_provider.dart';
import '../../providers/job_filter_provider.dart';
import '../../providers/job_prefrences/user_job_prefs_provider.dart';
import '../../providers/job_provider.dart';
import '../../providers/news_provider.dart';
import '../../providers/paginations/category_jobs_pagination_provider.dart';
import '../../providers/paginations/job_pagination_provider.dart';
import '../../providers/theme_provider.dart';
import '../../providers/job_prefrences/user_country_prefs_provider.dart';
import 'package:get_it/get_it.dart';
import 'navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // * Theme Provider
  locator.registerLazySingleton<ThemeProvider>(() => ThemeProvider());
  // * API Manager
  locator.registerLazySingleton<ApiManager>(() => ApiManager());
  // * Navigation Service
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<HiveService>(() => HiveService());
  // * My Resume Provider
  locator.registerLazySingleton<AuthProvider>(() => AuthProvider());
  locator.registerLazySingleton<JobProvider>(() => JobProvider());
  locator.registerLazySingleton<NewsProvider>(() => NewsProvider());
  locator.registerLazySingleton<CountryProvider>(() => CountryProvider());
  locator.registerLazySingleton<JobFilterProvider>(() => JobFilterProvider());
  locator.registerLazySingleton<JobApplicationProvider>(
      () => JobApplicationProvider());
  locator.registerLazySingleton<JobPaginationProvider>(
      () => JobPaginationProvider());
  locator.registerLazySingleton<CategoryJobsPaginationProvider>(
      () => CategoryJobsPaginationProvider());
  locator.registerLazySingleton<CVProvider>(() => CVProvider());
  locator.registerLazySingleton<UserJobPrefsProvider>(
      () => UserJobPrefsProvider());
  locator.registerLazySingleton<UserCountryPrefsProvider>(
      () => UserCountryPrefsProvider());
}
