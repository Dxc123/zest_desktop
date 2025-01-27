import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingUtils {
  /// 初始化 EasyLoading 配置
  static void init() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..maskType = EasyLoadingMaskType.black
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = const Color(0xFF00C853)
      ..backgroundColor = const Color(0xFF424242)
      ..indicatorColor = const Color(0xFFFFFFFF)
      ..textColor = const Color(0xFFFFFFFF)
      ..maskColor = const Color(0x99000000)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  /// 显示加载动画
  /// [message]: 提示文本
  /// [duration]: 显示时间（可选），如果指定时间则自动隐藏
  static void show({String message = '加载中...', Duration? duration}) {
    EasyLoading.show(status: message);

    if (duration != null) {
      Future.delayed(duration, () {
        dismiss();
      });
    }
  }

  /// 显示带进度的加载动画
  static void showProgress(double value, {String message = '加载中...'}) {
    EasyLoading.showProgress(value, status: message);
  }

  /// 显示成功提示
  /// [message]: 提示文本
  /// [duration]: 显示时间（默认 2 秒）
  static void showSuccess(String message, {Duration duration = const Duration(seconds: 2)}) {
    EasyLoading.showSuccess(message);
    Future.delayed(duration, () {
      dismiss();
    });
  }

  /// 显示失败提示
  static void showError(String message, {Duration duration = const Duration(seconds: 2)}) {
    EasyLoading.showError(message);
    Future.delayed(duration, () {
      dismiss();
    });
  }

  /// 显示信息提示
  static void showInfo(String message, {Duration duration = const Duration(seconds: 2)}) {
    EasyLoading.showInfo(message);
    Future.delayed(duration, () {
      dismiss();
    });
  }

  /// 隐藏加载动画
  static void dismiss() {
    EasyLoading.dismiss();
  }

  /// 显示自定义图标提示
  static void showCustom({
    required String message,
    required String iconPath,
    Duration duration = const Duration(seconds: 2),
  }) {
    EasyLoading.show(
      status: message,
      indicator: Image.asset(
        iconPath,
        width: 45.0,
        height: 45.0,
      ),
    );
    Future.delayed(duration, () {
      dismiss();
    });
  }
}
