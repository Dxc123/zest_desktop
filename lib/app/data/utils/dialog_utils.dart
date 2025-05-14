import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  // =======================
  // 显示对话框
  // =======================

  /// 普通弹窗，带标题和内容
  /*
  DialogUtils.showDialog(
  title: '确认操作',
  content: '您确定要删除这个项目吗？',
  onConfirm: () {
    // 执行确认操作
    Get.back();
  },
  onCancel: () {
    // 执行取消操作
    Get.back();
  },
);

  **/
  static void showDialog({
    required String title,
    required String content,
    String confirmText = '确认',
    String cancelText = '取消',
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
  }) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: onCancel ?? () => Get.back(),
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: onConfirm,
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }

  /// 自定义内容的对话框
  /*
  DialogUtils.showCustomDialog(
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.warning, size: 40, color: Colors.yellow),
      SizedBox(height: 10),
      Text('自定义内容的弹窗'),
    ],
  ),
  onConfirm: () {
    Get.back();
  },
);
*/

  static void showCustomDialog({
    required Widget content,
    String confirmText = '确认',
    String cancelText = '取消',
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
  }) {
    Get.dialog(
      AlertDialog(
        content: content,
        actions: <Widget>[
          TextButton(
            onPressed: onCancel ?? () => Get.back(),
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: onConfirm,
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }

  // =======================
  // 显示Snackbar
  // =======================

  /// 显示普通Snackbar
  /*
  DialogUtils.showSnackbar(
  title: '成功',
  message: '操作已完成！',
  backgroundColor: Colors.green,
  textColor: Colors.white,
);

  */
  static void showSnackbar({
    required String title,
    required String message,
    Color? backgroundColor,
    Color? textColor,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor ?? Colors.black,
      colorText: textColor ?? Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  // =======================
  // 显示底部弹出框
  // =======================

  /// 显示底部弹出框（ActionSheet 风格）
  /*
  DialogUtils.showBottomSheet(
  title: '请选择操作',
  options: ['操作1', '操作2', '操作3'],
  onSelected: (index) {
    print('选中了：操作${index + 1}');
  },
);

  */
  static void showBottomSheet({
    required String title,
    required List<String> options,
    required ValueChanged<int> onSelected,
  }) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(options[index]),
                  onTap: () {
                    onSelected(index);
                    Get.back();
                  },
                );
              },
            ),
          ],
        ),
      ),
      isScrollControlled: true, // 支持自定义底部弹出框高度
    );
  }

  // =======================
  // 显示加载框
  // =======================

  /// 显示加载弹窗
  ///DialogUtils.showLoading(message: '正在加载数据...');
  static void showLoading({
    String message = '加载中...',
  }) {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false, // 禁止点击外部关闭
    );
  }

  /// 隐藏加载弹窗
  /// DialogUtils.hideLoading();
  static void hideLoading() {
    Get.back();
  }

  ///////////////////////
/////////////////////////
/////////////////////

  static Future<T?> dialog<T>(
    Widget dialogWidget, {
    bool barrierDismissible = true, //是否可以通过点击背景关闭弹窗
    Color? barrierColor, //弹出层的背景颜色
    bool useSafeArea = false, //是否使用安全适配
    GlobalKey<NavigatorState>? navigatorKey, //用于打开对话框的key
    Duration? transitionDuration,
    Curve? transitionCurve,
    // Object? arguments, //传递入dialogWidget组件内的参数
    // String? name, ////路由名字
    RouteSettings? routeSettings, //路由设置 RouteSettings可 传递入参数arguments以及路由名称name
  }) {
    return Get.dialog(
      dialogWidget,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor ?? Colors.black.withOpacity(0.7),
      useSafeArea: useSafeArea,
      navigatorKey: navigatorKey,
      // arguments: arguments,
      transitionDuration: transitionDuration,
      transitionCurve: transitionCurve,
      // name: name,
      routeSettings: routeSettings,
    );
  }

  static Future<T?> bottomSheet<T>(
    //bottomSheet Widget组件
    Widget bottomSheet, {
    Color? backgroundColor, //背景颜色
    double? elevation, //bottomSheet的阴影
    bool persistent = true, //是否添加到路由中
    ShapeBorder? shape, //边框形状，一般用于圆角效果
    Clip? clipBehavior, //裁剪的方式
    Color? barrierColor, //弹出层的背景颜色
    bool? ignoreSafeArea, //是否忽略安全适配
    bool isScrollControlled = false, //是否支持全屏弹出，默认false
    bool useRootNavigator = false, //是否使用根导航
    bool isDismissible = true, //点击背景是否可关闭，默认ture
    bool enableDrag = true, //是否可以拖动关闭，默认true
    RouteSettings? settings, //路由设置
    Duration? enterBottomSheetDuration, //bottomSheet进入时的动画时间
    Duration? exitBottomSheetDuration, //bottomSheet退出时的动画时间
  }) {
    return Get.bottomSheet(
      bottomSheet,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation,
      persistent: persistent,
      shape: shape,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor ?? Colors.black.withOpacity(0.7),
      ignoreSafeArea: ignoreSafeArea,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      settings: settings,
      enterBottomSheetDuration: enterBottomSheetDuration,
      exitBottomSheetDuration: enterBottomSheetDuration,
    );
  }

  static bool isSnackBarOpen() {
    return Get.isSnackbarOpen;
  }

  static bool isDialogOpen() {
    return Get.isDialogOpen ?? false;
  }

  static bool isBottomSheetOpen() {
    return Get.isBottomSheetOpen ?? false;
  }
}
