import 'package:get/get.dart';

import '../controllers/zt_login_controller.dart';

class ZtLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZtLoginController>(
      () => ZtLoginController(),
    );
  }
}
