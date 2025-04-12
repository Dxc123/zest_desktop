import 'package:get/get.dart';

import '../controllers/ze_me_form_controller.dart';

class ZeMeFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeMeFormController>(
      () => ZeMeFormController(),
    );
  }
}
