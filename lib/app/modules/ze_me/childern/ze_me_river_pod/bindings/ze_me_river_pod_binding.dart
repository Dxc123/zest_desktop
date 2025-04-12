import 'package:get/get.dart';

import '../controllers/ze_me_river_pod_controller.dart';

class ZeMeRiverPodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeMeRiverPodController>(
      () => ZeMeRiverPodController(),
    );
  }
}
