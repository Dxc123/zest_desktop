import 'package:get/get.dart';

import '../controllers/ze_me_controller.dart';

class ZeMeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeMeController>(
      () => ZeMeController(),
    );
  }
}
