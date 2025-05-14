import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_url.dart';
import 'api_request_interceptors.dart';

const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";

const String APPLICATION_JSON = "application/json";
const String TOKEN = "Bearer token";
const String DEFAULT_LANGUAGE = "en";

const String BASE_URL = "https://wpapi.ducafecat.tech";

class DioService {
  factory DioService() => _instance;
  static final DioService _instance = DioService._internal();
  late Dio _dio;

  /// 单例初始
  DioService._internal() {
    // header 头
    final Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: TOKEN,
      DEFAULT_LANGUAGE: DEFAULT_LANGUAGE,
    };
    // 初始选项
    final options = BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      // headers: headers,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      //请求的Content-Type，默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
      contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.json,
    );
    // 初始 dio
    _dio = Dio(options);
    // 拦截器 - 日志打印
    if (!kReleaseMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: false,
          requestBody: false,
          responseHeader: false,
          responseBody: true,
        ),
      );
    }

    // 请求拦截器
    _dio.interceptors.add(RequestInterceptors());
  }

  /// get 请求
  Future<Response> get(
      String url, {
        Map<String, dynamic>? params,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    final Options requestOptions = options ?? Options();
    final Response response = await _dio.get(
      url,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  /// post 请求
  Future<Response> post(
      String url, {
        dynamic data,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    final Options requestOptions = options ?? Options();
    final Response response = await _dio.post(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  /// put 请求
  Future<Response> put(
      String url, {
        dynamic data,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    final Options requestOptions = options ?? Options();
    final Response response = await _dio.put(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  /// delete 请求
  Future<Response> delete(
      String url, {
        dynamic data,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    final Options requestOptions = options ?? Options();
    final Response response = await _dio.delete(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }
}
