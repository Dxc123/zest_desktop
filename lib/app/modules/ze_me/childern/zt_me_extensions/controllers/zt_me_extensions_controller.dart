import 'package:get/get.dart';

class ZtMeExtensionsController extends GetxController {
  //TODO: Implement ZtMeExtensionsController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void ddd() async {
    await 0.7.seconds.delay(() {});
  }
}
