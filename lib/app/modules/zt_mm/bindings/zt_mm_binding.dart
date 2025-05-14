import 'package:get/get.dart';

import '../controllers/zt_mm_controller.dart';

class ZtMmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZtMmController>(
      () => ZtMmController(),
    );
  }
}
