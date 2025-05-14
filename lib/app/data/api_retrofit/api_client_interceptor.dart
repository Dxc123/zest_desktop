import 'dart:convert';

import 'package:dio/dio.dart';

class ApiClientInterceptor extends Interceptor {
  ApiClientInterceptor();

  /// 请求
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // // 在这里可以配置请求头，设置公共参数
    // final token = UserService.to.token.token;
    // if (token.isNotEmpty) {
    //   options.headers['Authorization'] = token;
    // }
    handler.next(options);
  }

  // 响应
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 预处理请求返回结果，处理通用的错误信息
    handler.next(response);
  }

  /// 错误
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        break;
      case DioExceptionType.sendTimeout:
        break;
      case DioExceptionType.receiveTimeout:
        break;
      case DioExceptionType.badCertificate://配置的证书不正确导致
        break;
      case DioExceptionType.badResponse: // 服务端自定义错误体处理
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionError:
        break;
      case DioExceptionType.unknown:
        break;
    }
    return handler.next(err);
  }
}
