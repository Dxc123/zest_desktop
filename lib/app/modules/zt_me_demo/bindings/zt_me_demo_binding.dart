import 'package:get/get.dart';

import '../controllers/zt_me_demo_controller.dart';

class ZtMeDemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZtMeDemoController>(
      () => ZtMeDemoController(),
    );
  }
}
