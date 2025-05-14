import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';

import '../../../../../data/utils/log_utils.dart';
import '../../../../../routes/app_pages.dart';
import '../controllers/zt_demo_test_controller.dart';

class ZtDemoTestView extends GetView<ZtDemoTestController> {
  const ZtDemoTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZtDemoTestView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Wrap(
          spacing: 20,
          runSpacing: 10,
          children: <Widget>[
            // ConstrainedBox(
            //   constraints: const BoxConstraints(maxHeight: 200),
            //   // Flutter 3.24 CarouselView组件
            //   child: CarouselView(
            //     itemExtent: 330,
            //     shrinkExtent: 200,
            //     padding: const EdgeInsets.all(10.0),
            //     children: List.generate(
            //       9,
            //           (int index) => Container(color: Colors.green, child: Text("${index + 1}"),),
            //     ),
            //   ),
            // ),
            OutlinedButton(
              onPressed: () {
                LoggerUtils.d("${dotenv.env['API_URL']}");
              },
              child: const Text(
                'flutter_dotenv示例',
                style: TextStyle(color: Colors.red),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Get.toNamed(Routes.ZT_HOME);
              },
              child: const Text('多语言示例-Getx/Flutter Intl'),
            ),
            OutlinedButton(
              onPressed: () {
                Get.toNamed(Routes.ZE_ME_SIGNALS);
              },
              child: const Text('Signals状态库示例---主题切换'),
            ),
            OutlinedButton(
              onPressed: () {
                Get.toNamed(Routes.ZE_ME_FORM);
              },
              child: const Text('Form表单校验'),
            ),
            OutlinedButton(
              onPressed: () {
                Get.toNamed(Routes.ZE_ME_VALUE_NOTIFIER);
              },
              child: const Text('ValueNotifier示例'),
            ),
            OutlinedButton(
              onPressed: () {
                Get.toNamed(Routes.ZE_ME_THEME);
              },
              child: const Text('设置暗黑模式'),
            ),
            OutlinedButton(
              onPressed: () {
                Get.toNamed(Routes.ZE_ME_DEBOUNCER);
              },
              child: const Text('使用防抖示例'),
            ),

            OutlinedButton(
              onPressed: () {
                controller.getAppConfig();
              },
              child: const Text('AppConfig示例'),
            ),
            OutlinedButton(
              onPressed: () {
                controller.apiLogin();
              },
              child: const Text('ApiClient使用示例'),
            ),
            OutlinedButton(
              onPressed: () {
                Get.toNamed(Routes.ZT_ME_EXTENSIONS);
              },
              child: const Text('awesome_extensions使用示例'),
            ),
          ],
        ),
      ),
    );
  }
}
