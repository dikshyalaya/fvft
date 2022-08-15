import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'appconfig.dart';



import 'constants/environments.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (kDebugMode) {
    // Force disable Crashlytics collection while doing every day development.
    // Temporarily toggle this to true if you want to test crash reporting in your app.
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  // await Future.wait([
  //   dotenv.load(fileName: productionEnv[keyEnvironmentFile]!),
  //   setupLocator(),
  //   locator<HiveService>().init()
  // ]);

  var configuredApp = AppConfig(
      child:  FreeVisaFreeTicket(),
      appTitle: productionEnv[keyAppTitle],
      buildFlavor: productionEnv[keyFlavor]);

  return runApp(configuredApp);
}
