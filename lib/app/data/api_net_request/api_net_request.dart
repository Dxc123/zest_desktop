import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as get_x;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../generated/json/base/json_convert_content.dart';
import '../../routes/app_pages.dart';
import 'api_net_encrypt.dart';
import '../services/app_my_info_service.dart';
import '../services/app_device_service.dart';
import '../utils/loading_until.dart';
import '../utils/log_utils.dart';
import 'api_net_request_url.dart';
import 'ap_net_response_entity.dart';

typedef ResponseSuccess = ({Response<dynamic> response});
typedef ResponseFail = ({String type, Exception message});
typedef NetworkResponse = ({ResponseSuccess? success, ResponseFail? fail});



class ApiNetRequestManager {
  factory ApiNetRequestManager() => _netManager;

  //初始化拦截器 请求配置
  ApiNetRequestManager._internal() {
    LoggerUtils.dio("ApiNetRequestManager初始化");
    _dio.options.baseUrl = ApiNetRequestUrl.apiUrl;
    _dio.options.connectTimeout = const Duration(milliseconds: _connectTimeOut);
    _dio.options.receiveTimeout = const Duration(milliseconds: _responseTimeOut);
    _dio.options.responseType = ResponseType.plain;
    _dio.options.validateStatus = (status) {
      if (status == 200) {
        return true;
      } else {
        return false;
      }
    };

    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   client.findProxy = (url) {
    //     // ///设置代理 电脑ip地址
    //     return "PROXY 192.168.3.96:8888";
    //     return 'DIRECT';
    //   };
    // };

    //添加三方日志拦截器
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

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          if (options.extra['showLoading'] as bool? ?? true) {
            LoadingUtils.dismiss();
          }
          // 添加请求头
          options.headers = _buildRequestHeaders();
          if (kDebugMode == true) {
            LoggerUtils.dio("接口添加请求头 = ${options.headers}");
          }
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
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
            LoggerUtils.d("接口调用成功response.data = \n${response.data}");
          }

          // final Map<String, dynamic> map = jsonDecode(response.data!);
          if (kDebugMode == true) {
            LoggerUtils.dio("接口调用成功response.data = \n${response.data}");
          }
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          if (kDebugMode == true) {
            LoggerUtils.dio("接口调用失败 = ${e.error}");
          }
          return handler.next(e);
        },
      ),
    );
    LoggerUtils.dio("ApiNetRequestManager 初始化完成");
  }

  static final ApiNetRequestManager _netManager = ApiNetRequestManager._internal();

  static final Dio _dio = Dio();
  static const String dioGet = "GET";
  static const String dioPost = "POST";
  static const String dioPut = "PUT";
  static const int _connectTimeOut = 10 * 1000;
  static const int _responseTimeOut = 10 * 1000;
  static int timeOffset = 0;

  // 请求头
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

  /// 加密和压缩请求参数
  static String _encryptAndZipParams(
    String path,
    dynamic data, {
    bool encrypt = true,
  }) {
    final Map<String, Object> paraFinal = <String, Object>{
      "method": path,
      "timestamp": DateTime.now().millisecondsSinceEpoch + ApiNetRequestUrl.timeDiff,
      "nonceStr": DateTime.now().microsecondsSinceEpoch,
    };
    if (data != null) {
      paraFinal["param"] = data;
    }
    // if (kDebugMode) {
    //   LoggerUtils.dio("接口参数ParaMap = $paraFinal");
    // }
    final String paraFinalJson = const JsonEncoder().convert(paraFinal);
    return encrypt == true
        ? ApiNetEncrypt().encryptAes(
            ApiNetEncrypt().zipStr(paraFinalJson),
          )
        : ApiNetEncrypt().zipStr(paraFinalJson);
  }

  /// showNetError 网络请求超时等报错或者得到的数据解析失败 是否展示错误toast
  static Future<void> request<T>(
    String path, {
    Map<String, dynamic>? header,
    String requestMethod = dioPost,
    dynamic data,
    bool showLoading = false,
    bool showNetError = true,
    CancelToken? cancelToken,
    Function(T, dynamic)? netSuccessCallback,
    Function(String)? netErrorCallback,
    Function(CancelToken)? netCancelTokenCallback,
  }) async {
    // 是否添加 loading
    final Options options = Options(
      extra: <String, dynamic>{
        'showLoading': showLoading,
      },
      method: requestMethod,
      headers: header,
    );
    // 处理特殊的接口
    //获取config数据 接口路径和 其他接口路径 相比缺少/api/路径
    _dio.options.baseUrl = (path == ApiNetRequestUrl.configApi) ? ApiNetRequestUrl.baseUrl : ApiNetRequestUrl.apiUrl;

    // 处理请求参数
    final String sendPara = _encryptAndZipParams(
      path,
      data,
      encrypt: ApiNetRequestUrl.hasBaseUrlV2 ? false : true,
    );
    if (kDebugMode) {
      LoggerUtils.dio("请求baseUrl = ${_dio.options.baseUrl} "
          "\n path = $path "
          "\n sendPara = $sendPara");
    }

    Response? response;
    try {
      if (cancelToken == null) {
        cancelToken = CancelToken();
        netCancelTokenCallback?.call(cancelToken);
      }

      response = await _dio.request(
        (path == ApiNetRequestUrl.configApi) ? path : "",
        options: options,
        data: (path == ApiNetRequestUrl.configApi) ? null : sendPara,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      LoggerUtils.dio("服务器返回报错 error = ${e.type}_${e.message}");
      //请求到了服务器 服务器返回报错 典型的服务器错误500
      if (e.type == DioExceptionType.badResponse) {
        LoggerUtils.dio("服务器返回报错 error = ${e.message}");
        showNetError == true ? LoadingUtils.showToast("Servers error, please try again later") : null;
        netErrorCallback?.call("Servers error, please try again later");
      } else if (e.type == DioExceptionType.unknown) {
        //没有网络 等其他原因
        LoggerUtils.dio("网络的其他原因：The network is abnormal. Please try again later");
        showNetError == true ? LoadingUtils.showToast("The network is abnormal. Please try again later") : null;
        netErrorCallback?.call("The network is abnormal. Please try again later");
      } else {
        //归类为请求超时
        LoggerUtils.dio("网络的其他原因：The network request timed out. Please try again later");
        showNetError == true ? LoadingUtils.showToast("The network request timed out. Please try again later") : null;
        netErrorCallback?.call("The network request timed out. Please try again later");
      }
    } finally {
      //获取到了数据
      if (response != null) {
        // if (kDebugMode) {
        //   LoggerUtils.dio(" 请求结果response.headers = ${response.headers}");
        // }
        // 后台系统的时间
        final int timestamp = int.parse(response.headers.value("timestamp") ?? "0");
        // 手机系统的时间
        final int now = DateTime.now().millisecondsSinceEpoch;
        // 计算差值，用于下次请求计算
        timeOffset = timestamp == 0 ? 0 : timestamp - now;
        // 处理请求结果，结果是字符串
        if (response.data is String) {
          // response.data = ApiNetEncrypt().unZipStr(response.data!);
          //没有回调函数则跳过数据解析部分
          if (netSuccessCallback != null || netErrorCallback != null) {
            final Map eDataMap = jsonDecode(response.data);
            final int? code = eDataMap["code"];
            if (code is int) {
              handlerCode(code);
            }
            ApiNetRequestManager.parseResponseData<T>(
              eDataMap,
              netSuccessCallback: netSuccessCallback,
              parseErrorCallBack: () {
                //数据解析失败回调 再用最基础的模型获取错误 code 以及 message
                final ApiNetResponseEntity? netResponseData = JsonConvert.fromJsonAsT<ApiNetResponseEntity>(eDataMap);
                showNetError == true ? LoadingUtils.showToast(netResponseData?.message ?? "Data error, please try again later") : null;
                netErrorCallback?.call(netResponseData?.message ?? "Data error, please try again later");
              },
              response: response,
            );
          }
        }
      } else {
        LoggerUtils.dio("response 为空");
        showNetError == true ? LoadingUtils.showToast("Servers error, please try again later") : null;
        netErrorCallback?.call("Servers error, please try again later");
      }
    }
  }

  /// 解析Response.
  static parseResponseData<T>(
    Map responseMap, {
    Function(T, dynamic)? netSuccessCallback,
    Function? parseErrorCallBack,
    Response? response,
  }) {
    //数据转换失败 或者 泛型T没有传值
    assert(T.hashCode != dynamic.hashCode, "网络请求数据解析没有传泛型 path=${response?.requestOptions.path} ");
    //转换数据模型
    final T? responseModel = JsonConvert.fromJsonAsT<T>(responseMap);
    //数据转换成功
    if (responseModel is T) {
      netSuccessCallback?.call(responseModel, responseMap);
    } else if (parseErrorCallBack != null) {
      parseErrorCallBack.call();
    }
  }

  // 处理服务器的code返回
  static handlerCode(int? code) {
    if (code != null) {
      if (kDebugMode) {
        LoggerUtils.dio("校验接口返回的code = $code");
      }
      switch (code) {
        case 2:
          {
            if (kDebugMode) {
              LoggerUtils.dio("token 过期");
            }
            //退出app
            if (get_x.Get.currentRoute != Routes.ZT_LOGIN) {
              LoadingUtils.showToast("Login information expired, please log in again");
              AppMyInfoService.to.clear();
              get_x.Get.offAllNamed(Routes.ZT_LOGIN);
              // AppRtmManager.closeRtm();
              // AppSocketManager.to.breakenSocket();
            }
          }
          break;
        case 24:
          {
            //code == 24  //账号被封禁
            // code == 901 //设备被封禁
            AppMyInfoService.to.clear();
            get_x.Get.offAllNamed(Routes.ZT_LOGIN);
            // AppRtmManager.closeRtm();
            // AppSocketManager.to.breakenSocket();
          }
          break;
        case 901:
          {
            //code == 24  //账号被封禁
            // code == 901 //设备被封禁
            AppMyInfoService.to.clear();
            get_x.Get.offAllNamed(Routes.ZT_LOGIN);
            // AppRtmManager.closeRtm();
            // AppSocketManager.to.breakenSocket();
          }
          break;
      }
    }
  }
}
