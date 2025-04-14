import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static final EnvConfig instance = EnvConfig._instance();
  Map<String, dynamic>? configurations;

  factory EnvConfig() {
    return instance;
  }

  EnvConfig._instance();

  Future<void> loadConfig({required String flavor}) async {
    await dotenv.load(fileName: "lib/core/env/.env.$flavor");
    configurations = dotenv.env;
  }

  String get baseUrl => configurations?['API_URL'] as String? ?? '';
  String get oneSignalAppToken =>
      configurations?['ONE_SIGNAL_APP_TOKEN'] as String? ?? '';
  String get apiKey => configurations?['API_KEY'] as String? ?? '';
}
