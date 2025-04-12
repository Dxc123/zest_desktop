import 'package:get/get.dart';

import '../controllers/ze_discover_controller.dart';

class ZeDiscoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeDiscoverController>(
      () => ZeDiscoverController(),
    );
  }
}
