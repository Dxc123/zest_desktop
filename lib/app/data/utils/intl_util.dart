import 'package:intl/intl.dart';
// intl库提供了以下主要功能：
// 日期格式化
// 数字格式化
// 字符串消息插值
// 复数形式
// 性别形式
// 日期/时间符号
// 数字符号
// 双向文本
// 双向文本符号

//格式化工具类
class IntlUtil {
  ///日期格式
  static const String ymdHms = "yyyy-MM-dd HH:mm:ss";

  /// 格式化数值
  /// var f = NumberFormat("###.0#", "en_US");
  /// print(f.format(12.345));
  /// ==> 12.34
  static String formatNumber({String pattern = '###.0#', dynamic number, String? locale}) {
    return NumberFormat(pattern, locale).format(number);
  }

  ///逗号分割数值
  static String decimalPattern({dynamic number, String? locale}) {
    return NumberFormat.decimalPattern(locale).format(number);
  }

  //：数字转百分比 0.23=>23%
  String getFormatPercent({required double count}) {
    return NumberFormat.decimalPercentPattern().format(count);
  }

  /// 格式化日期
  /// "yyyy-MM-dd HH:mm:ss"
  static String formatDate({String pattern = 'yyyy-MM-dd HH:mm:ss', required DateTime date}) {
    return DateFormat(pattern).format(date);
  }

  /// 格式化毫秒日期
  /// "yyyy-MM-dd HH:mm:ss"
  static String formatMilliseconds(String pattern, int milliseconds) {
    return formatDate(
      pattern: pattern,
      date: DateTime.fromMillisecondsSinceEpoch(milliseconds),
    );
  }

  //时间戳转换显示刚刚、几分钟前、几小时前、几天前、年月日等格式
  static String formatMessageTime(int timeStamp) {
    //当前13位毫秒时间戳
    final int nowTimeStamp = DateTime.now().millisecondsSinceEpoch;
    //时间戳对比
    final int distance = nowTimeStamp - timeStamp;
    if (distance <= 60 * 1000) {
      //一分钟内-刚刚
      // return Tr.radiant_base_just_now.tr;
      return "刚刚";
    } else if (distance <= 60 * 60 * 1000) {
      // 一小时内-几分钟前
      return '${(distance / 60 / 1000).floor()}分钟前';
      // return Tr.radiant_base_minutes_ago.trArgs([(distance / 60 / 1000).floor().toString()]);
    } else if (distance <= 60 * 60 * 12 * 1000) {
      // 一天内(12小时内) - 几小时前
      return '${(distance / 60 / 60 / 1000).floor()}小时前';
      // return Tr.radiant_base_hours_ago.trArgs([(distance / 60 / 60 / 1000).floor().toString()]);
    } else if (distance <= 60 * 60 * 24 * 2 * 1000) {
      // 二天内（48小时内）-昨天
      return "昨天";
      // return Tr.radiant_base_yesterday.tr;
    } else if (distance <= 60 * 60 * 24 * 30 * 1000) {
      // 一月内（30 天小时内）-多少天前
      return '${(distance / 60 / 60 / 24 / 1000).floor()}天前';
      // return Tr.radiant_base_days_ago.trArgs([(distance / 60 / 60 / 24 / 1000).floor().toString()]);
    } else if (distance <= 60 * 60 * 24 * 365 * 1000) {
      // 一年内（365 天小时内）-多少月前
      return '${(distance / 60 / 60 / 24 / 30 / 1000).floor()}月前';
      // return Tr.radiant_base_months_ago.trArgs([(distance / 60 / 60 / 24 / 30 / 1000).floor().toString()]);
    } else if (DateTime.fromMillisecondsSinceEpoch(nowTimeStamp).year == DateTime.fromMillisecondsSinceEpoch(timeStamp).year) {
      // 同一年
      // 格式化时间戳->月/日 时/秒
      final DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp);
      return "${time.month}-${time.day}  ${time.hour}:${time.minute}";
      // var timeStr = DateFormat('MM-DD HH:mm').format(time);
      // return timeStr;
    } else {
      // 不同年
      // 格式化时间戳->年/月/日 时/秒
      final DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp);
      return "${time.year}-${time.month}-${time.day} ${time.hour}:${time.minute}";
      // var timeStr = DateFormat('YY-MM-DD HH:mm').format(time);
      // return timeStr;
    }
  }
}
