import 'environment.dart';

/// Utils [LogUtils] : The LogUtils is used for printing on dev environment only with color codes
class LogUtils {
  static final String developmentEnv = Environment.appEnvironment;

  ///FUNC [logGeneral] : Logging General Messages
  static void logGeneral(message) {
    determineLogVisibility('\x1B[94m', message);
  }

  ///FUNC [logError] : Logging Error Messages
  static void logError(message) {
    determineLogVisibility('\x1b[31m', message);
  }

  ///FUNC [logWarning] : Logging Warning Messages
  static void logWarning(message) {
    determineLogVisibility('\x1b[33m', message);
  }

  ///FUNC [logGeneralLong] : Logging General Long Messages
  static void logGeneralLong(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern
        .allMatches(text)
        .forEach((match) => determineLogVisibility('\x1B[94m', match.group(0)));
  }

  ///FUNC [determineLogVisibility] : Only log if it is in dev
  static void determineLogVisibility(String ansicolorCode, message) {
    try {
      String messageString = message.toString();
      if (developmentEnv == 'dev') {
        print('$ansicolorCode$messageString\x1B[0m');
      }
    } catch (error) {
      print(error);
    }
  }
}
