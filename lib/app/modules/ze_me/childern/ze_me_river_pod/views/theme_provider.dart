import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override

  ThemeData build() {
    return AppThemes.lightTheme;
  }

  void setTheme(ThemeData theme) {
    state = theme;
  }
}
