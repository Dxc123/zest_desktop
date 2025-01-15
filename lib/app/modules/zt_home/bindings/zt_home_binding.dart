import 'package:get/get.dart';

import '../controllers/zt_home_controller.dart';

class ZtHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZtHomeController>(
      () => ZtHomeController(),
    );
  }
}
