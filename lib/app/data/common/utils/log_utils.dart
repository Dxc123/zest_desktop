import 'package:ansi_styles/ansi_styles.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ColorfulLogger {
  static void logInfo(String message) {
    print(AnsiStyles.green('[INFO] $message'));
  }

  static void logWarning(String message) {
    print(AnsiStyles.yellow('[WARNING] $message'));
  }

  static void logError(String message) {
    print(AnsiStyles.red('[ERROR] $message'));
  }

  static void logDebug(String message) {
    print(AnsiStyles.cyan('[DEBUG] $message'));
  }

  static void logData(String label, dynamic data) {
    print('${AnsiStyles.blueBright('[$label]')} ${AnsiStyles.whiteBright(data.toString())}');
  }

  static void logHeaders(Map<String, dynamic> headers) {
    print('${AnsiStyles.magenta('[HEADERS]')} ${AnsiStyles.gray(headers.toString())}');
  }

  static void logQueryParams(Map<String, dynamic>? queryParameters) {
    if (queryParameters != null) {
      print('${AnsiStyles.magenta('[QUERY PARAMETERS]')} ${AnsiStyles.gray(queryParameters.toString())}');
    }
  }
}

class AnsiLogger {
  static void printRequest({
    required String method,
    required String path,
    required Map<String, dynamic> queryParameters,
    dynamic data,
  }) {
    print(AnsiStyles.green('\nRequest:'));
    print('  Method: ${AnsiStyles.yellow(method)}');
    print('  Path: ${AnsiStyles.cyan(path)}');
    print('  Query Parameters: ${AnsiStyles.gray(queryParameters.toString())}');
    if (data != null) print('  Data: ${AnsiStyles.whiteBright(data.toString())}');
  }

  static void printResponse({
    required int statusCode,
    required String path,
    dynamic data,
  }) {
    print(AnsiStyles.blue('\nResponse:'));
    print('  Status: ${AnsiStyles.magenta(statusCode.toString())}');
    print('  Path: ${AnsiStyles.cyan(path)}');
    if (data != null) print('  Data: ${AnsiStyles.whiteBright(data.toString())}');
  }

  static void printError(DioException error) {
    print(AnsiStyles.red('\nError:'));
    print('  Type: ${AnsiStyles.yellow(error.type.toString())}');
    print('  Message: ${AnsiStyles.magenta(error.message)}');
    if (error.response != null) {
      print('  Status Code: ${AnsiStyles.cyan(error.response?.statusCode.toString() ?? 'Unknown')}');
      print('  Data: ${AnsiStyles.whiteBright(error.response?.data.toString() ?? 'No data')}');
    }
  }
}

/*
void exampleLog() {
  LoggerUtils.d("This is a debug message.");
  LoggerUtils.i("This is an info message.");
  LoggerUtils.w("This is a warning message.");
  LoggerUtils.e("This is an error message.");
  LoggerUtils.s("This is a success message.");
  LoggerUtils.f("This is a fail message.");
}

**/
class LoggerUtils {
  // 创建 Logger 实例
  static final Logger _logger = Logger(
    level: Level.debug, // 设置默认日志级别
    filter: null, // 默认输出所有日志
    printer: PrettyPrinter(
      methodCount: 2, // 显示方法调用栈深度
      errorMethodCount: 8, // 错误显示方法调用栈深度
      lineLength: 120, // 每行最大字符数
      colors: true, // 是否启用颜色输出
      printEmojis: true, // 是否启用表情符号
      printTime: true, // 是否显示时间戳
    ),
    output: null, // 默认控制台输出
  );

  // =======================
  // 普通日志方法
  // =======================

  /// 调试日志
  static void d(String message) {
    _logger.d(message);
  }

  /// 信息日志
  static void i(String message) {
    _logger.i(message);
  }

  /// 警告日志
  static void w(String message) {
    _logger.w(message);
  }

  /// 错误日志
  static void e(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// 成功日志
  static void s(String message) {
    _logger.i("✅ $message");
  }

  /// 失败日志
  static void f(String message) {
    _logger.w("❌ $message");
  }

  // =======================
  // 带格式化日志的方法
  // =======================

  /// 格式化调试日志
  static void dFormat(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// 格式化信息日志
  static void iFormat(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// 格式化警告日志
  static void wFormat(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// 格式化错误日志
  static void eFormat(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
