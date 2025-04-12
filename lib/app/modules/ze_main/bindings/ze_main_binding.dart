import 'package:get/get.dart';

import '../controllers/ze_main_controller.dart';

class ZeMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeMainController>(
      () => ZeMainController(),
    );
  }
}
