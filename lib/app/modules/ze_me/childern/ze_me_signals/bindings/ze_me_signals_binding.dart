import 'package:get/get.dart';

import '../controllers/ze_me_signals_controller.dart';

class ZeMeSignalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeMeSignalsController>(
      () => ZeMeSignalsController(),
    );
  }
}
