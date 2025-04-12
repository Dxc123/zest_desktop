/// 常量
class DiaApiUrl {
  // 测试
  static const String socketBaseUrl_test = "wss://test.hanilink.com/socket";
  static const String configBaseUrl_test = "https://test.hanilink.com";
  static const String baseUrl_test = "$configBaseUrl_test/api";

  // 正式
  static const String socketBaseUrl = "wss://api.radiantlk.com/socket";
  static const String configBaseUrl = "https://api.radiantlk.com";
  static const String baseUrl = "$configBaseUrl/api";

  // 获取app配置接口
  static const String configApi = "/app/config";
  //获取翻译文案
  static const String getTransationsApi = "/app/loadTranslateConfig/0";
  //获取加密翻译文案
  static const String getTransationsV2Api = "/app/loadTranslateConfigV2/0";
  // 更新用户详情
  static const String updateUserInfoApi = "/user/updateUserDetails";
  //用户信息
  static const String userInfoApi = "/user/getUserDetails";
}
