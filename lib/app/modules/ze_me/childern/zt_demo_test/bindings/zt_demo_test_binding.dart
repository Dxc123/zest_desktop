import 'package:get/get.dart';

import '../controllers/zt_demo_test_controller.dart';

class ZtDemoTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZtDemoTestController>(
      () => ZtDemoTestController(),
    );
  }
}
