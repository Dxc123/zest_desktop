import 'package:permission_handler/permission_handler.dart';

/*
单个权限请求示例
void requestCameraPermission() async {
  bool isGranted = await PermissionUtils.requestPermission(Permission.camera);
  if (isGranted) {
    print('相机权限已授予');
  } else {
    print('相机权限未授予');
  }
}

检查多个权限示例
void checkMultiplePermissions() async {
  List<Permission> permissions = [Permission.camera, Permission.microphone];
  bool allGranted = await PermissionUtils.requestPermissions(permissions);
  if (allGranted) {
    print('所有权限已授予');
  } else {
    print('部分或全部权限未授予');
  }
}

检查权限永久拒绝并跳转设置页面
void handlePermanentlyDeniedPermission() async {
  bool isDenied = await PermissionUtils.isPermissionPermanentlyDenied(Permission.location);
  if (isDenied) {
    print('位置权限已被永久拒绝，请前往设置页面手动开启权限');
    await PermissionUtils.openAppSettings();
  }
}


*/
class PermissionUtils {
  /// 检查单个权限状态
  static Future<PermissionStatus> checkPermission(Permission permission) async {
    return await permission.status;
  }

  /// 请求单个权限
  static Future<bool> requestPermission(Permission permission) async {
    final PermissionStatus status = await permission.request();
    return status.isGranted;
  }

  /// 检查多个权限状态
  static Future<Map<Permission, PermissionStatus>> checkPermissions(List<Permission> permissions) async {
    return await permissions.request();
  }

  /// 请求多个权限
  static Future<bool> requestPermissions(List<Permission> permissions) async {
    final Map<Permission, PermissionStatus> statuses = await permissions.request();
    return statuses.values.every((PermissionStatus status) => status.isGranted);
  }

  /// 检查权限是否永久被拒绝
  static Future<bool> isPermissionPermanentlyDenied(Permission permission) async {
    return await permission.isPermanentlyDenied;
  }

  /// 打开应用的设置页面
  static Future<void> openAppSettings() async {
    await openAppSettings();
  }
}
