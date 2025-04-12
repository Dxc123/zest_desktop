import 'package:get/get.dart';

import '../controllers/ze_me_debouncer_controller.dart';

class ZeMeDebouncerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeMeDebouncerController>(
      () => ZeMeDebouncerController(),
    );
  }
}
