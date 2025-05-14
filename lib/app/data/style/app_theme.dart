import 'package:flutter/material.dart';

import 'app_style.dart';
// 自定义颜色扩展创建明暗主题。
class AppTheme {
  // 浅色主题
  static final light = ThemeData.light().copyWith(
    extensions: [_lightAppColors],
  );

  static final _lightAppColors = AppColorsExtension(
    primary: const Color(0xff6200ee),
    background: Colors.white,
  );

  // 深色主题
  static final dark = ThemeData.dark().copyWith(
    extensions: [_darkAppColors],
  );

  static final _darkAppColors = AppColorsExtension(
    primary: const Color(0xffbb86fc),
    background: const Color(0xff121212),
  );
}
