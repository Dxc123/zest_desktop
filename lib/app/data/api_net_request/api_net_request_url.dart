enum NetRequestType {
  netRequestTypeTest,
  netRequestTypeDis,
}

class ApiNetRequestUrl {
  static int timeDiff = 0;
  static const String appName = 'Aimee';
  static const String appNameLower = 'aimee';
  static String channelName = 'aimee100'; //渠道名

  // 不加 V2:请求参数只压缩，不加密，响应结果是加密的字符串
  // 加v2： 请求参数只压缩，不加密，响应结果是正常的json
  static bool hasBaseUrlV2 = true;
  static NetRequestType netRequestType = NetRequestType.netRequestTypeDis;

  //域名
  static String get domain {
    switch (ApiNetRequestUrl.netRequestType) {
      case NetRequestType.netRequestTypeTest:
        return "test.hanilink.com";
      case NetRequestType.netRequestTypeDis:
        // return "api.tikimet.com";
        return "api.aimeecom.com";
    }
  }

  //baseUrl
  // 不加 V2:请求参数只压缩，不加密，响应结果是加密的字符串
  // 加v2： 请求参数只压缩，不加密，响应结果是正常的json
  static String get baseUrl {
    return ApiNetRequestUrl.hasBaseUrlV2 ? "https://$domain/v2" : "https://$domain";
  }

  //app内部接口api url
  static String get apiUrl {
    return "$baseUrl/api";
  }

  static String get socketBaseUrl {
    return "ws://$domain/socket";
  }

  //获取app相关config配置数据
  static const String configApi = "/app/config";


  // 更新用户详情
  static const String updateUserInfoApi = "/user/updateUserDetails";
  //用户信息
  static const String userInfoApi = "/user/getUserDetails";
  // 账号登录
  static const String accountLogin = "/login/userLogin";
  // 账号注册
  static const String auditModeRegister = "/app/auditModeRegister";
  //注销账号
  static const String deleteCurrentAccount = "/user/deleteUser";
}
