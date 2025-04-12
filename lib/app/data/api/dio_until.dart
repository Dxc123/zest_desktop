import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/src/response.dart' as dio_response;
import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pointycastle/export.dart';
import 'package:zest_desktop/app/data/services/app_service.dart';
import 'package:zest_desktop/app/data/utils/_index.dart';
import 'package:zest_desktop/app/data/values/constants.dart';

import '../../routes/app_pages.dart';
import '../services/app_my_info_service.dart';

import 'dart:convert';

import 'dio_api_url.dart';

typedef ErrorHandler = void Function(DioException error);
typedef JsonParser<T> = T Function(Map<String, dynamic> json);

class DioClient {
  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;
  late final Dio _dio;

  static int timeDiff = 0;

  DioClient._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: DiaApiUrl.baseUrl,
      // 默认 Base URL，可动态设置
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    ));

    // 添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (options.extra['showLoading'] as bool? ?? true) {
          LoadingUtils.show();
        }
        // if (kDebugMode) {
        //   LoggerUtils.printRequest(
        //     method: options.method,
        //     path: options.path,
        //     queryParameters: options.queryParameters,
        //     data: options.data,
        //   );
        // }
        // 添加请求头
        options.headers = _buildRequestHeaders();
        LoggerUtils.d("options.headers = ${options.headers}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (response.requestOptions.extra['showLoading'] as bool? ?? true) {
          LoadingUtils.dismiss();
        }
        // if (kDebugMode) {
        //   LoggerUtils.printResponse(
        //     statusCode: response.statusCode ?? 0,
        //     path: response.requestOptions.path,
        //     data: response.data,
        //   );
        // }
        // // 处理响应
        // if (response.statusCode == 200) {
        //   _handleResponse(response);
        // }

        return handler.next(response);
      },
      onError: (DioException error, handler) {
        if (error.requestOptions.extra['showLoading'] as bool? ?? true) {
          LoadingUtils.dismiss();
        }
        if (kDebugMode) {
          LoggerUtils.printError(error);
        }

        return handler.next(error);
      },
    ));
  }

  // // 设置 Base URL
  // void setBaseUrl(String baseUrl) {
  //   _dio.options.baseUrl = baseUrl;
  // }

  //
  // // 设置全局错误处理器
  // void setGlobalErrorHandler(ErrorHandler errorHandler) {
  //   _globalErrorHandler = errorHandler;
  // }
  //
  // // 添加或修改全局 Header
  // void addHeaders(Map<String, String> headers) {
  //   _dio.options.headers.addAll(headers);
  // }

  Map<String, dynamic> _buildRequestHeaders() {
    String userAgent = "${Constants.appNameLower},${AppService.to.version},${AppService.to.deviceModel},${AppService.to.appSystemVersionKey},${Constants.channelName},${AppService.to.buildNumber}";
    return {
      "User-Agent": _zipStr(userAgent),
      "Authorization": AppMyInfoService.to.authorization ?? "",
      "user-language": Get.deviceLocale?.languageCode ?? "en",
      "device-id": AppService.to.deviceIdentifier,
      "time-difference": timeDiff.toString(),
    };
  }

  String _zipStr(String str) {
    return base64Encode(zlib.encode(utf8.encode(str)));
  }

  String _unZipStr(String str) {
    var decodeString = base64Decode(str);
    var zlibdecode = zlib.decode(decodeString);
    return utf8.decode(zlibdecode);
  }

  /// 加密和压缩请求参数
  String _encryptAndZipParams(String path, dynamic data) {
    var paraFinal = {
      "method": path,
      "timestamp": DateTime.now().millisecondsSinceEpoch + timeDiff,
      "nonceStr": DateTime.now().microsecondsSinceEpoch,
    };
    if (data != null) {
      paraFinal["param"] = data;
    }
    var paraFinalJson = const JsonEncoder().convert(paraFinal);
    return _encryptAes(_zipStr(paraFinalJson));
  }

  /// 加密
  static dynamic _encryptAes(String content) {
    var key = AppMyInfoService.to.config?.publicKey ?? "";
    if (key.isEmpty) {
      return content;
    }
    // AppLogTool.debugDio("encryptAes start");
    var aesKey = "${'-----BEGIN PUBLIC KEY-----\n$key'}\n-----END PUBLIC KEY-----";

    var aesPublicKey = RSAKeyParser().parse(aesKey) as RSAPublicKey;
    final encrypter = Encrypter(RSA(publicKey: aesPublicKey));

    List<int> sourceBytes = utf8.encode(content);
    int inputLen = sourceBytes.length;
    int maxLen = 117;
    List<int> totalBytes = [];
    for (var i = 0; i < inputLen; i += maxLen) {
      int endLen = inputLen - i;
      List<int> item;
      if (endLen > maxLen) {
        item = sourceBytes.sublist(i, i + maxLen);
      } else {
        item = sourceBytes.sublist(i, i + endLen);
      }
      totalBytes.addAll(encrypter.encryptBytes(item).bytes);
    }
    return base64.encode(totalBytes);
  }

  /// 处理响应
  void _handleResponse(dio_response.Response response) {
    int timestamp = int.parse(response.headers.value("timestamp") ?? "0");
    int now = DateTime.now().millisecondsSinceEpoch;
    timeDiff = timestamp == 0 ? 0 : timestamp - now;
    // 确保 response.data 是字符串类型
    if (response.data is String) {
      response.data = _unZipStr(response.data);
    } else {
      response.data = _unZipStr(const JsonEncoder().convert(response.data));
    }
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

  // // 通用请求方法，支持泛型解析
  // Future<T> request<T>(
  //   String path, {
  //   required String method,
  //   Map<String, dynamic>? queryParameters,
  //   dynamic data,
  //   required JsonParser<T> parser,
  //   bool showLoading = true,
  // }) async {
  //   try {
  //     final options = Options(method: method, extra: {'showLoading': showLoading});
  //     // 请求参数
  //     var paraFinal = {
  //       "method": path,
  //       "timestamp": DateTime.now().millisecondsSinceEpoch + timeDiff,
  //       "nonceStr": DateTime.now().microsecondsSinceEpoch,
  //     };
  //     if (data != null) {
  //       paraFinal["param"] = data;
  //     }
  //
  //     var sendPara = _encryptAndZipParams(path, data);
  //
  //     /// configApi接口和一般的接口不一样
  //     bool isGetLanguage = path == DiaApiUrl.getTransationsApi;
  //     bool isGetLanguageV2 = path == DiaApiUrl.getTransationsV2Api;
  //     bool isGetConfig = path == DiaApiUrl.configApi;
  //     final isSpecal = isGetConfig || isGetLanguage || isGetLanguageV2;
  //     final root = isSpecal ? DiaApiUrl.configBaseUrl : DiaApiUrl.baseUrl;
  //     _dio.options.baseUrl = root;
  //
  //     final response = await _dio.post(
  //       isSpecal ? path : "",
  //       queryParameters: queryParameters,
  //       data: isSpecal ? null : sendPara,
  //       options: options,
  //     );
  //     LoggerUtils.d("接口调用成功 = ${response.data}");
  //
  //     // 泛型解析数据
  //     final Map<String, dynamic> jsonResponse;
  //     if (response.data is Map<String, dynamic>) {
  //       jsonResponse = response.data as Map<String, dynamic>;
  //     } else if (response.data is String) {
  //       jsonResponse = jsonDecode(response.data as String) as Map<String, dynamic>;
  //     } else {
  //       throw Exception('意外的响应格式: ${response.data}');
  //     }
  //     return parser(jsonResponse);
  //   } catch (e) {
  //     throw _handleError(e);
  //   }
  // }

  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Function(AppErrorEntity err)? errCallback,
    Function(bool hasNext)? pageCallback,
    Function(bool success, String msg)? doneCallback,
    Function()? nullCallback,
    bool showLoading = false,
    bool? getBaseEntity,
  }) async {
    final options = Options(extra: {'showLoading': showLoading});
    // 请求参数
    var paraFinal = {
      "method": path,
      "timestamp": DateTime.now().millisecondsSinceEpoch + timeDiff,
      "nonceStr": DateTime.now().microsecondsSinceEpoch,
    };
    if (data != null) {
      paraFinal["param"] = data;
    }
    // AppLogTool.debug("请求api:${path} \n请求的参数= ${paraFinal}");

    /// configApi接口和一般的接口不一样
    bool isGetLanguage = path == DiaApiUrl.getTransationsApi;
    bool isGetLanguageV2 = path == DiaApiUrl.getTransationsV2Api;
    bool isGetConfig = path == DiaApiUrl.configApi;
    final isSpecal = isGetConfig || isGetLanguage || isGetLanguageV2;
    final root = isSpecal ? DiaApiUrl.configBaseUrl : DiaApiUrl.baseUrl;
    _dio.options.baseUrl = root;
    LoggerUtils.d('baseUrl = $root path = $path， Http post =  $json');

    /// 一般接口path这里就直接不传值了，path放参数里面去了！！！！
    dio_response.Response<String> response;
    if (showLoading) LoadingUtils.show();
    // AppLogTool.debugDio('$path， begin post');
    try {
      var sendPara = _encryptAndZipParams(path, data);
      response = await _dio.post(
        isSpecal ? path : "",
        data: isSpecal ? null : sendPara,
        queryParameters: queryParameters,
        options: options,
        // cancelToken: _cancelToken,
      );
      _handleResponse(response); // 确保传入的响应数据类型为 String
    } catch (e) {
      LoggerUtils.d("catch 错误 = $e");
      AppErrorEntity err;
      if (e is AppErrorEntity) {
        err = e;
      } else if (e is DioException) {
        err = AppErrorEntity(code: -4, message: e.message ?? "");
      } else {
        err = AppErrorEntity(code: -3, message: "try catch err");
      }
      if (errCallback == null) {
        LoadingUtils.showToast(err.message);
      } else {
        errCallback.call(err);
      }
      doneCallback?.call(false, err.message);
      return Future.error(e);
    } finally {
      if (showLoading) LoadingUtils.dismiss();
      // AppLogTool.debugDio('$path，post done');
    }
    // AppLogTool.debug("response.data = ${response.data}");
    var baseEntity = const JsonDecoder().convert(response.data ?? '{}');

    /// 返回的data是null,这个会发生吗？
    if (baseEntity == null) {
      if (errCallback == null) {
        LoadingUtils.showToast("baseEntity == null");
      } else {
        errCallback.call(AppErrorEntity(code: -3, message: "baseEntity == null"));
      }
      doneCallback?.call(false, "baseEntity == null");
      return Future.error("baseEntity err");
    }
    // AppLogTool.longLog(path + '->' + const JsonEncoder().convert(baseEntity));

    /// 返回的data里面code不是0，需要处理
    var code = baseEntity["code"];
    if (code != 0) {
      if (errCallback == null) {
        if (code == 8) {
          LoadingUtils.showToast("${baseEntity["message"]}");
        } else if (code == 2) {
          //token 过期
          AppMyInfoService.to.clear();
          Get.offAllNamed(Routes.ZT_LOGIN);
          // AppRtmManager.closeRtm();
          // AppSocketManager.to.breakenSocket();
        } else {
          LoadingUtils.showToast("[$code] ${baseEntity["message"]}");
        }
      } else {
        errCallback.call(AppErrorEntity(code: code, message: baseEntity["message"]));
        if (code == 24 || code == 901) {
          //code == 24  //账号被封禁
          // code == 901 //设备被封禁
          AppMyInfoService.to.clear();
          Get.offAllNamed(Routes.ZT_LOGIN);
          // AppRtmManager.closeRtm();
          // AppSocketManager.to.breakenSocket();
        }
      }
      doneCallback?.call(false, "[$code] ${baseEntity["message"]}");
      return Future.error("baseEntity err");
    }

    /// 返回的分页数据
    if (baseEntity["page"] != null) {
      try {
        pageCallback?.call(baseEntity["page"]["hasNext"] == true);
      } catch (e) {
        LoggerUtils.d("error = $e");
      }
    }
    doneCallback?.call(true, baseEntity["message"]);

    // 泛型用void,直接返回null
    if (T.toString() == 'void') {
      return null as T;
    }
    var serverData = baseEntity["data"];

    /// code=0而data=null的情况
    /// 为啥服务器有时code=0而data=[],有时code=0而data=null,真扯！？
    /// 这样的接口 .catchError((err) 判断err==0
    if (serverData == null) {
      nullCallback?.call();
      return Future.error(0);
    }

    /// code=0而data is String的情况，泛型用String
    // if (serverData is String){
    //   return serverData as T;
    // }
    /// code=0而data不是map和list,不用fromJson
    if (serverData is! Map<String, dynamic> && serverData is! List<dynamic>) {
      LoggerUtils.d('need not JsonConvert');
      return serverData as T;
    }
    //data为 String类型的 list ,需要单独处理解析
    if (<String>[] is T && serverData is List) {
      return serverData.map((e) => e as String).toList() as T;
    }
    if (getBaseEntity == true) {
      LoggerUtils.d('List<dynamic> need not JsonConvert');
      return jsonDecode(jsonEncode(baseEntity)) as T;
    }
    return jsonDecode(jsonEncode(serverData)) as T;
  }
}

class AppErrorEntity implements Exception {
  int code = -1;
  String message = "";

  AppErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception: code $code, $message";
  }
}
