import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static final String appEnvironment = dotenv.get('APP_ENV');
  static final baseUrl = dotenv.get('BASE_URL');
}
