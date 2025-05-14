import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../api_service/api_url.dart';
import '../models/ap_banner_entity.dart';
import '../models/api_user_Info_entity.dart';
import '../models/app_article_data_entity.dart';
import '../utils/log_utils.dart';
import 'api_client_interceptor.dart';

part 'api_client.g.dart';

//命令：dart run build_runner build --delete-conflicting-outputs

@RestApi(
  baseUrl: "https://www.wanandroid.com/", // 请求域名
  parser: Parser.JsonSerializable, // 数据解析方式，默认为json
)
abstract class ApiClient {
  // 标准的构建方式
  // dio: 传入发起网络请求的对象
  // baseUrl: 请求域名，优先级高于注解
  factory ApiClient(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: const Duration(milliseconds: 5 * 1000),
      connectTimeout: const Duration(milliseconds: 5 * 1000),
    );
    //添加三方日志拦截器
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: false,
          requestBody: false,
          responseHeader: false,
          responseBody: true,
        ),
      );
    }
    dio.interceptors.add(
        ApiClientInterceptor(),
    );
    LoggerUtils.dio("ApiClient 初始化完成");
    return _ApiClient(dio, baseUrl: baseUrl);
  }

// 1、添加请求方式注解，接口地址
// 2、定义返回值类型（可以是任意类型，也可以是定义好的model），请求方法名，请求参数
  @POST(ApiUrl.login)
  @MultiPart()
  Future<ApiUserInfoFatherEntity?> login(
    @Part(name: "username") String username,
    @Part(name: "password") String password,
  );

  @GET(ApiUrl.logout)
  Future<void> logout();

  @GET(ApiUrl.banner)
  Future<List<ApiBannerEntity>?> getBanner();

  @GET("${ApiUrl.homePageArticle}0/json")
  Future<List<ArticleDataEntity>?> getHomePageArticle();
}
