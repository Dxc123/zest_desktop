import 'package:flutter_dotenv/flutter_dotenv.dart';

// 使用适当的环境文件运行应用程序：
// flutter run --dart-define=ENV=dev
// flutter run --dart-define=ENV=prod

class EnvConfig {
  /// 检查应用程序是否在 Web 上运行
  static const bool isWeb = bool.fromEnvironment('IS_WEB', defaultValue: false);

  /// 从 'dart-define' 中读取环境类型 （dev，prod）。默认为 'dev'。
  static const String env = String.fromEnvironment('ENV', defaultValue: 'dev');

  /// 加载正确的环境文件以进行本地开发。
  static Future<void> loadEnv() async {
    if (!isWeb) {
      String envFile = '.env.$env';
      try {
        await dotenv.load(fileName: envFile);
      } catch (e) {
        throw Exception('Failed to load environment file: $envFile. Make sure it exists.');
      }
    }
  }

  /// 从 'dart-define' 或 '.env' 文件中检索 API URL。
  static String get apiUrl {
    return const String.fromEnvironment('API_URL', defaultValue: '')
        .isNotEmpty
        ? const String.fromEnvironment('API_URL')
        : dotenv.env['API_URL'] ?? 'https://api.default.com';
  }
}
