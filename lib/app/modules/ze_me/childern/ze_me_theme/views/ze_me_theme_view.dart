import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:signals/signals_flutter.dart';

import '../controllers/ze_me_theme_controller.dart';

final FlutterSignal<Brightness> brightness = signal(Brightness.light);
final FlutterComputed<ThemeMode> themeMode = computed(() {
  if (brightness() == Brightness.dark) {
    return ThemeMode.dark;
  } else {
    return ThemeMode.light;
  }
});

class ZeMeThemeView extends GetView<ZeMeThemeController> {
  const ZeMeThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Watch((_) {
            //   final isDark = brightness() == Brightness.dark;
            //   return ElevatedButton(
            //     onPressed: () {
            //       brightness.value = isDark ? Brightness.light : Brightness.dark;
            //     },
            //     child: Text('使用signals--Set Theme: ${isDark ? 'Dark' : 'Light'}'),
            //   );
            // }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AdaptiveTheme.of(context).setLight();
              },
              child: const Text('Set Light Theme'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AdaptiveTheme.of(context).setDark();
              },
              child: const Text('Set Dark Theme'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AdaptiveTheme.of(context).setSystem();
              },
              child: const Text('Set System Theme'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AdaptiveTheme.of(context).reset();
              },
              child: const Text('Reset Theme'),
            ),
            const SizedBox(height: 20),
            // 监听当前样式
            ValueListenableBuilder(
              valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
              builder: (_, AdaptiveThemeMode mode, Widget? child) {
                return Text("当前模式：$mode");
              },
            ),
          ],
        ),
      ),
    );
  }
}
