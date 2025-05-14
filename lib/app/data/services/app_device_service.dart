import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/index.dart';

class AppDeviceService extends GetxService {
  static AppDeviceService get to => Get.find();
  late final GetStorage? storage;
  late final SharedPreferences prefs;

  //////////
  // 设备信息//////////////
  late String deviceIdentifier;
  late String deviceModel;
  late String appSystemVersionKey;
  late String version;
  late String buildNumber;
  late String? appPackageName; //安卓packageName
  late String? appName; //app名称

  Future<AppDeviceService> init() async {
    LoadingUtils.init();
    await GetStorage.init(); // 初始化 GetStorage
    storage = GetStorage();
    prefs = await SharedPreferences.getInstance();
    _setupDeviceInfo();

    return this;
  }

  // 设备信息//////////////
  Future<void> _setupDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    const AndroidId androidIdPlugin = AndroidId();
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appPackageName = packageInfo.packageName;
    appName = packageInfo.appName;
    if (GetPlatform.isIOS) {
      final IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      appSystemVersionKey = iosDeviceInfo.systemVersion;
      deviceIdentifier = "${iosDeviceInfo.identifierForVendor ?? ""}-${iosDeviceInfo.utsname.machine}";
      deviceModel = "ios ${iosDeviceInfo.model}";
    } else if (GetPlatform.isAndroid) {
      final AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      final String? androidId = await androidIdPlugin.getId();
      appSystemVersionKey = androidDeviceInfo.version.release;
      // deviceIdentifier = (androidDeviceInfo.androidId ?? "") + "-" + (androidDeviceInfo.brand ?? "");
      deviceIdentifier = "${androidId ?? ""}-${androidDeviceInfo.brand}";
      // 修改请求头里 userAgent 的设备信息，部分设备信息里面包含逗号，会导致服务端报错
      deviceModel = "android ${androidDeviceInfo.model.replaceAll(",", "_")}";
    }
    // 包信息
    final PackageInfo info = await PackageInfo.fromPlatform();
    version = info.version;
    buildNumber = info.buildNumber;
  }
}
