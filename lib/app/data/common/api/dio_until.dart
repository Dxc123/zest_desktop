import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../utils/log_utils.dart';

import 'dart:convert';

typedef ErrorHandler = void Function(DioException error);
typedef JsonParser<T> = T Function(Map<String, dynamic> json);

class DioClient {
  // 新增: 静态 final 字段和 factory 构造函数
  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  late final Dio _dio;
  ErrorHandler? _globalErrorHandler;

  // 新增: 私有构造函数
  DioClient._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: '', // 默认 Base URL，可动态设置
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    // 添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (options.extra['showLoading'] as bool? ?? true) {
          EasyLoading.show(); // 显示 loading
        }
        if (kDebugMode) {
          AnsiLogger.printRequest(
            method: options.method,
            path: options.path,
            queryParameters: options.queryParameters ?? {},
            data: options.data,
          );
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (response.requestOptions.extra['showLoading'] as bool? ?? true) {
          EasyLoading.dismiss(); // 隐藏 loading
        }
        if (kDebugMode) {
          AnsiLogger.printResponse(
            statusCode: response.statusCode ?? 0,
            path: response.requestOptions.path,
            data: response.data,
          );
        }
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        if (error.requestOptions.extra['showLoading'] as bool? ?? true) {
          EasyLoading.dismiss(); // 隐藏 loading
        }
        if (kDebugMode) {
          AnsiLogger.printError(error);
        }
        _globalErrorHandler?.call(error); // 调用全局错误处理
        return handler.next(error);
      },
    ));
  }

  // 设置 Base URL
  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  // 设置全局错误处理器
  void setGlobalErrorHandler(ErrorHandler errorHandler) {
    _globalErrorHandler = errorHandler;
  }

  // 添加或修改全局 Header
  void addHeaders(Map<String, String> headers) {
    _dio.options.headers.addAll(headers);
  }

  // 错误处理方法
  String _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return '连接超时';
        case DioExceptionType.sendTimeout:
          return '发送超时';
        case DioExceptionType.receiveTimeout:
          return '接收超时';
        case DioExceptionType.badResponse:
          return '错误响应: ${error.response?.statusCode} ${error.response?.statusMessage}';
        case DioExceptionType.cancel:
          return '请求已取消';
        case DioExceptionType.unknown:
          return '未知错误: ${error.message}';
        case DioExceptionType.badCertificate:
          return '证书错误';
        case DioExceptionType.connectionError:
          return '连接错误';
      }
    }
    return '意外错误: $error';
  }

  // 通用请求方法，支持泛型解析
  Future<T> request<T>(
    String path, {
    required String method,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    required JsonParser<T> parser,
    bool showLoading = true, // 新增参数
  }) async {
    try {
      final options = Options(method: method, extra: {'showLoading': showLoading});
      final response = await _dio.request(
        path,
        queryParameters: queryParameters,
        data: data,
        options: options,
      );

      // 泛型解析数据
      final Map<String, dynamic> jsonResponse;
      if (response.data is Map<String, dynamic>) {
        jsonResponse = response.data as Map<String, dynamic>;
      } else if (response.data is String) {
        jsonResponse = jsonDecode(response.data as String) as Map<String, dynamic>;
      } else {
        throw Exception('意外的响应格式: ${response.data}');
      }
      return parser(jsonResponse);
    } catch (e) {
      throw _handleError(e);
    }
  }

  // GET 请求
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required JsonParser<T> parser,
    bool showLoading = true,
  }) {
    return request(
      path,
      method: 'GET',
      queryParameters: queryParameters,
      parser: parser,
      showLoading: showLoading,
    );
  }

  // POST 请求
  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? data,
    required JsonParser<T> parser,
    bool showLoading = true,
  }) {
    return request(
      path,
      method: 'POST',
      data: data,
      parser: parser,
      showLoading: showLoading,
    );
  }

  // 解析列表类型的数据
  List<T> parseList<T>(List<dynamic> jsonList, JsonParser<T> parser) {
    return jsonList.map((json) => parser(json as Map<String, dynamic>)).toList();
  }
}

/*
//设置 Base URL（可选）: 在应用启动时设置统一的 Base URL，只需要设置一次：
DioClient().setBaseUrl('https://api.example.com');

void fetchUser() async {
  try {
    final user = await DioClient().get<User>(
      '/user/1',
      parser: (json) => User.fromJson(json),
      showLoading: false, // 更新: 添加 showLoading 参数
    );
    print('User: ${user.name}, Email: ${user.email}');
  } catch (e) {
    print('Error: $e');
  }
}

void createUser() async {
  try {
    final newUser = await DioClient().post<User>(
      '/user',
      data: {'name': 'John Doe', 'email': 'john.doe@example.com'},
      parser: (json) => User.fromJson(json),
      showLoading: false, // 更新: 添加 showLoading 参数
    );
    print('Created User: ${newUser.name}, Email: ${newUser.email}');
  } catch (e) {
    print('Error: $e');
  }
}

void fetchUsers() async {
  try {
    final users = await DioClient().get<List<User>>(
      '/users',
      parser: (json) => DioClient().parseList(json['data'], User.fromJson),
      showLoading: false, // 更新: 添加 showLoading 参数
    );
    users.forEach((user) => print('User: ${user.name}'));
  } catch (e) {
    print('Error: $e');
  }
}
* */
