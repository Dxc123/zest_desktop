import 'package:get/get.dart';

import '../controllers/zt_me_extensions_controller.dart';

class ZtMeExtensionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZtMeExtensionsController>(
      () => ZtMeExtensionsController(),
    );
  }
}
