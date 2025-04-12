import 'package:get/get.dart';

import '../controllers/ze_me_theme_controller.dart';

class ZeMeThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeMeThemeController>(
      () => ZeMeThemeController(),
    );
  }
}
