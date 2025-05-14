import 'package:get/get.dart';

import '../controllers/zt_uu_controller.dart';

class ZtUuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZtUuController>(
      () => ZtUuController(),
    );
  }
}
