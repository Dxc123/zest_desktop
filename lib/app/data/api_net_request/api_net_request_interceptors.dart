import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as get_x;

import '../../routes/app_pages.dart';
import '../services/app_my_info_service.dart';
import '../services/app_device_service.dart';
import '../utils/loading_until.dart';
import '../utils/log_utils.dart';
import 'api_net_encrypt.dart';
import 'api_net_request_url.dart';

class DioRequestInterceptors extends Interceptor {
  /// 发送请求
  /// 我们这里可以添加一些公共参数，或者对参数进行加密
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.extra['showLoading'] as bool? ?? true) {
      LoadingUtils.show();
    }
    // 添加请求头
    options.headers = _buildRequestHeaders();
    if (kDebugMode) {
      LoggerUtils.d("options.headers = ${options.headers}");
    }
    return handler.next(options);
  }

  /// 响应
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.extra['showLoading'] as bool? ?? true) {
      LoadingUtils.dismiss();
    }

    if (ApiNetRequestUrl.hasBaseUrlV2 == false) {
      // 不加 ，响应结果是加密的字符串
      // 加v2：响应结果是正常的json
      // response.data 服务端返回是加密的字符串类型，最后的结果需要解密返回
      if (response.data is String) {
        response.data = ApiNetEncrypt().unZipStr(response.data!);
      } else {
        response.data = ApiNetEncrypt().unZipStr(
          const JsonEncoder().convert(response.data),
        );
      }
    }

    // 手机系统的时间
    final int now = DateTime
        .now()
        .millisecondsSinceEpoch;
    final Map<String, dynamic> map = jsonDecode(response.data!);
    // LoggerUtils.d("responseMap timestamp = ${map["timestamp"]}");
    if (map.keys.contains("timestamp")) {
      // 后台系统的时间
      final int timestamp = map["timestamp"]; //int.parse(map["timestamp"]);
      // 计算差值，用于下次请求计算
      ApiNetRequestUrl.timeDiff = timestamp == 0 ? 0 : now - timestamp;
    }
    if (kDebugMode) {
      LoggerUtils.d("response.data = ${response.data ?? ""}"
      // " \n response.headers = ${response.headers}"
          " \n DiaApiUrl.timeDiff = ${ApiNetRequestUrl.timeDiff}");
    }
    return handler.next(response);
  }

  /// 错误
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      LoggerUtils.d("onError = $err");
    }
    if (err.requestOptions.extra['showLoading'] as bool? ?? true) {
      LoadingUtils.dismiss();
    }
    try {
      var errorMessage = "";
      switch (err.type) {
        case DioExceptionType.connectionTimeout:
          LoggerUtils.d("onError = connectionTimeout");
          errorMessage = "Connection request timeout. Please try again later.";
          break;
        case DioExceptionType.sendTimeout:
          LoggerUtils.d("onError = sendTimeout");
          errorMessage = "Send timeout in connection with API server. Please try again later.";
          break;
        case DioExceptionType.receiveTimeout:
          LoggerUtils.d("onError = receiveTimeout");
          errorMessage = "Send timeout in connection with API server. Please try again later.";
          break;
        case DioExceptionType.badCertificate: //配置的证书不正确导致
          LoggerUtils.d("onError = badCertificate");
          break;
        case DioExceptionType.badResponse: // 服务端自定义错误体处理
          LoggerUtils.d("onError = badResponse");
          errorMessage = _handleResponse(err.response!);
          break;
        case DioExceptionType.cancel:
          LoggerUtils.d("onError = cancel");
          errorMessage = "Request cancelled.";
          break;
        case DioExceptionType.connectionError:
          LoggerUtils.d("onError = connectionError");
          break;
        default:
          LoggerUtils.d("onError = unknown");
          errorMessage = "No internet connection.";
          break;
      }
    } on FormatException {
      // return "Unexpected error occurred. Please try again later.";
    } catch (_) {
      // return "Unexpected error occurred. Please try again later.";
    }


    return handler.next(err);
  }

  String _handleResponse(Response response) {
    final int statusCode = response.statusCode ?? 0;
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        get_x.Get.offAllNamed(Routes.ZT_LOGIN);
        return "Unauthorized request. Please log in again.";
      case 404:
        return "Requested resource not found.";
      case 409:
        return "Error due to a conflict. Please try again later.";
      case 408:
        return "Connection request timeout. Please try again later.";
      case 500:
        return "Internal server error. Please try again later.";
      case 503:
        return "Service unavailable. Please try again later.";
      default:
        return "Received invalid status code.";
    }
  }

  Map<String, dynamic> _buildRequestHeaders() {
    final String userAgent = "${ApiNetRequestUrl.appNameLower},${AppDeviceService.to.version},${AppDeviceService.to.deviceModel},${AppDeviceService.to.appSystemVersionKey},${ApiNetRequestUrl.channelName},${AppDeviceService.to.buildNumber}";
    return <String, dynamic>{
      "User-Agent": ApiNetEncrypt().zipStr(userAgent),
      "Authorization": AppMyInfoService.to.authorization ?? "",
      "user-language": get_x.Get.deviceLocale?.languageCode ?? "en",
      "device-id": AppDeviceService.to.deviceIdentifier,
      "time-difference": ApiNetRequestUrl.timeDiff.toString(),
    };
  }
}
