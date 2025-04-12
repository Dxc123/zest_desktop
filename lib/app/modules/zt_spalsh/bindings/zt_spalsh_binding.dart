import 'package:get/get.dart';

import '../controllers/zt_spalsh_controller.dart';

class ZtSpalshBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZtSpalshController>(
      () => ZtSpalshController(),
    );
  }
}
