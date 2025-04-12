import 'package:get/get.dart';

import '../controllers/ze_me_language_controller.dart';

class ZeMeLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeMeLanguageController>(
      () => ZeMeLanguageController(),
    );
  }
}
