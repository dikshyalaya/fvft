
import 'package:free_visa_free_ticket/data/server/response/api_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async{
  locator.registerLazySingleton<ApiService>(() => ApiService());

}