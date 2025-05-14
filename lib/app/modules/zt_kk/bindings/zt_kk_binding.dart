import 'package:get/get.dart';

import '../controllers/zt_kk_controller.dart';

class ZtKkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZtKkController>(
      () => ZtKkController(),
    );
  }
}
