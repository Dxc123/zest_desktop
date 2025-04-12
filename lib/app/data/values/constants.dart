import 'package:get/get.dart';

/// 常量
class Constants {
  static const appName = 'Radiant';
  static const appNameLower = 'radiant';
  //渠道名
  static String channelName = GetPlatform.isIOS == true ? '${appNameLower}200' : '${appNameLower}100';

  static const privacyPolicy = "https://api.radiantlk.com/page/Privacy_Policy.html";
  static const agreement = "https://api.radiantlk.com/page/agreement.html";
}
