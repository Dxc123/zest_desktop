import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/**
 * @Author      : ⭐️星星⭐️
 * @Date        : on 2024-04-08 16:00.
 * @Description :描述
 */

//富文本扩展

extension RichTextExt on RichText {
  /// 创建 List<TextSpan>
  ///
  /// text 整个段落
  /// textTaps 高亮字符串数组
  /// style 段落样式
  /// linkStyle 高亮样式
  /// prefix 切割符号,避免和文章包含字符串重复
  /// suffix 切割符号,避免和文章包含字符串重复
  /// onLink 高亮部分点击事件
  static List<TextSpan> createTextSpans({
    required String text,
    required List<String> textTaps,
    TextStyle? style,
    TextStyle? linkStyle,
    String prefix = "_&t",
    String suffix = "_&t",
    required void Function(String textTap) onLink,
  }) {
    final pattern = textTaps.map((d) => RegExp.escape(d)).join('|');
    final regExp = RegExp(pattern, multiLine: true);
    final textNew = text.splitMapJoin(
      regExp,
      onMatch: (m) => '$prefix${m[0]}$suffix', // (or no onMatch at all)
      onNonMatch: (n) => n,
    );

    final list = textNew.split(RegExp('$prefix|$suffix'));
    return list.map((e) {
      if (e.isNotEmpty) {
        final isEqual = textTaps.contains(e);
        if (isEqual) {
          return TextSpan(
            text: e,
            style: linkStyle ?? const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onLink(e);
              },
          );
        }
      }
      return TextSpan(text: e, style: style);
    }).toList();
  }
}

// 使用
// final text = "普通文本1高亮1普通文本2高亮2普通文本3高亮3普通文本4";
// final textTaps = ["高亮1", "高亮2", "高亮3"];
// var linkMap = {
//   '《用户协议》': 'https://flutter.dev',
//   '《隐私政策》': 'https://flutter.dev',
// };
// ...
//
// Text.rich(
// TextSpan(
// children: RichTextExt.createTextSpans(
// text: text,
// textTaps: linkMap.keys.toList(),
// // linkStyle: TextStyle(fontSize: 18.0, color: Colors.red),
// onLink: (textTap) {
// ddlog(textTap);
// },
// ),
// ),
// ),
