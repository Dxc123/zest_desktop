import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

/*
使用
 final deviceDetails = await DeviceInfoManager.getDeviceDetails();
 final appDetails = await DeviceInfoManager.getAppInfo();

 */
class DeviceInfoUtils {
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  /// 获取设备基本信息：通过 device_info_plus 获取 Android 和 iOS 平台的设备详细信
  static Future<Map<String, dynamic>> getDeviceDetails() async {
    try {
      if (Platform.isAndroid) {
        return _getAndroidDeviceInfo();
      } else if (Platform.isIOS) {
        return _getIOSDeviceInfo();
      } else {
        return <String, dynamic>{'error': 'Unsupported platform'};
      }
    } catch (e) {
      return <String, dynamic>{'error': e.toString()};
    }
  }

  /// 获取应用信息，通过 package_info_plus 获取应用的名称、包名、版本号等信息。
  static Future<Map<String, String>> getAppInfo() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return <String, String>{
        'appName': packageInfo.appName,
        'packageName': packageInfo.packageName,
        'version': packageInfo.version,
        'buildNumber': packageInfo.buildNumber,
      };
    } catch (e) {
      return <String, String>{'error': e.toString()};
    }
  }

  /// 获取Android设备信息
  static Future<Map<String, dynamic>> _getAndroidDeviceInfo() async {
    final AndroidDeviceInfo androidInfo = await _deviceInfoPlugin.androidInfo;
    return <String, dynamic>{
      'brand': androidInfo.brand,
      'device': androidInfo.device,
      'model': androidInfo.model,
      'androidVersion': androidInfo.version.release,
      'sdkInt': androidInfo.version.sdkInt,
      'manufacturer': androidInfo.manufacturer,
      'isPhysicalDevice': androidInfo.isPhysicalDevice,
    };
  }

  /// 获取iOS设备信息
  static Future<Map<String, dynamic>> _getIOSDeviceInfo() async {
    final IosDeviceInfo iosInfo = await _deviceInfoPlugin.iosInfo;
    return <String, dynamic>{
      'name': iosInfo.name,
      'systemName': iosInfo.systemName,
      'systemVersion': iosInfo.systemVersion,
      'model': iosInfo.model,
      'localizedModel': iosInfo.localizedModel,
      'identifierForVendor': iosInfo.identifierForVendor,
      'isPhysicalDevice': iosInfo.isPhysicalDevice,
    };
  }
}
