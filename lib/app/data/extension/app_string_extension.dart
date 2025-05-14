import 'package:intl/intl.dart';

// String 扩展
extension AppCostomString on String {
  // void log() {
  //   print("log---> $this ");
  // }

  String toUpperCasForFirst() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  // 去除尾部的空格符
  String replaceNumByStar() {
    // AppLogTool.debug("去除尾部的空格符");
    String finalS = replaceAll(RegExp(r'\s*$'), "");
    return finalS.replaceAll(RegExp(r"\d"), "*");
  }

  //去除换行符
  String replaceEnterByStar() {
    String finalS = replaceAll("\n", " ");
    return finalS.replaceAll(RegExp(r"\d"), "*");
  }

  // 千位数加逗号分隔
  String getFormatStepCount({required int count}) {
    if (count < 1000) {
      return "$count";
    }
    var format = NumberFormat('0,000');
    return format.format(count);
  }
}
