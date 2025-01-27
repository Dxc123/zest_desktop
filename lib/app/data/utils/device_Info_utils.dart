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
        return {'error': 'Unsupported platform'};
      }
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  /// 获取应用信息，通过 package_info_plus 获取应用的名称、包名、版本号等信息。
  static Future<Map<String, String>> getAppInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      return {
        'appName': packageInfo.appName,
        'packageName': packageInfo.packageName,
        'version': packageInfo.version,
        'buildNumber': packageInfo.buildNumber,
      };
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  /// 获取Android设备信息
  static Future<Map<String, dynamic>> _getAndroidDeviceInfo() async {
    final androidInfo = await _deviceInfoPlugin.androidInfo;
    return {
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
    final iosInfo = await _deviceInfoPlugin.iosInfo;
    return {
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
