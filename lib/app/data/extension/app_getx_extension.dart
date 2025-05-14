import 'package:flutter/material.dart';
import 'package:get/get.dart';


///安全find
S? safeFind<S>() {
  if (Get.isRegistered<S>() == true) {
    final s = Get.find<S>();
    return s;
  }
  return null;
}

abstract class AppGetUtil {
  static String? getStringArg() {
    return Get.arguments is String ? Get.arguments : null;
  }

  static int? getIntgArg() {
    return Get.arguments is int ? Get.arguments : null;
  }

  static T? getDynamicArg<T>() {
    return Get.arguments.runtimeType == T ? Get.arguments : null;
  }

  ///设置文本中的某个特别的文字样式（只包含一个%s）
  static Widget setFormatRichTextStr({
    required String needStr, //带%s的文本
    required String numStr, //%s
    required TextStyle? normalStyle,
    required TextStyle? selectStyle,
    textAlign = TextAlign.start,
  }) {
    //例如  Tr.naleFreeCarDes.tr
    // You have a video card, which is enough for %s s free video call
    // AppLogTool.debug("needStr = $needStr");
    if (needStr.contains("%s")) {
      final List<String> arr = needStr.split("%s");
      final List<TextSpan> spans = [];

      spans.add(TextSpan(
        text: arr[0],
        style: normalStyle,
      ));
      //把数字插入
      spans.add(TextSpan(
        text: numStr,
        style: selectStyle,
      ));
      spans.add(TextSpan(
        text: arr[1],
        style: normalStyle,
      ));

      return RichText(
        text: TextSpan(children: spans),
        textAlign: textAlign ?? TextAlign.start,
      );
    } else {
      return const SizedBox();
    }
  }
}
