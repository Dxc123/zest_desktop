import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:math' as math;

import '../../../../generated/l10n.dart';
import '../../../../generated/locales.g.dart';
import '../../../data/widgets/gradient_border_container.dart';
import '../controllers/ze_me_language_controller.dart';

class ZeMeLanguageView extends GetView<ZeMeLanguageController> {
  const ZeMeLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.LoginPages_sign_in_apple.tr),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              S.current.sign_in_apple,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _changeLanguage('zh_CN'),
              child: const Text('Chinese'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _changeLanguage('en'),
              child: const Text('English'),
            ),
            const SizedBox(height: 30),
            // 渐变边框容器
            const GradientBorderContainer(
              content: Text(
                'Hello, World!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              borderGradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.purple,
                ],
              ),
              radius: 15.0,
              borderWidth: 3.0,
              margin: EdgeInsets.all(20),
              contentPadding: EdgeInsets.all(20), // Padding inside the content area
            ),
            // 渐变边框容器
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.purple,
                    Colors.red,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcIn, // Ensures only the widget is colored
              child: Container(
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white, // Required for ShaderMask to apply
                    width: 5, // Border width
                  ),
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                child: const Center(
                  child: Text(
                    'Gradient Border!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            // 渐变文字
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.0,
                  colors: <Color>[
                    Colors.yellow,
                    Colors.deepOrange.shade900,
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: const Text(
                "I'm burning the memories",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                gradient: SweepGradient(
                  center: FractionalOffset.center,
                  colors: <Color>[
                    Color(0xFF4285F4), // blue
                    Color(0xFF34A853), // green
                    Color(0xFFFBBC05), // yellow
                    Color(0xFFEA4335), // red
                    Color(0xFF4285F4), // blue again to seamlessly transition to the start
                  ],
                  stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
                  transform: GradientRotation(math.pi / 4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _changeLanguage(String languageCode) async {
    await Get.updateLocale(Locale(languageCode));
    await S.load(Locale(languageCode));
  }
}
