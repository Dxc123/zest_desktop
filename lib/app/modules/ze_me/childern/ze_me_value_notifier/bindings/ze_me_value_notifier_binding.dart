import 'package:get/get.dart';

import '../controllers/ze_me_value_notifier_controller.dart';

class ZeMeValueNotifierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeMeValueNotifierController>(
      () => ZeMeValueNotifierController(),
    );
  }
}
