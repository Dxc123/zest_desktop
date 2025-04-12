import 'package:get/get.dart';

import '../controllers/ze_message_controller.dart';

class ZeMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZeMessageController>(
      () => ZeMessageController(),
    );
  }
}
