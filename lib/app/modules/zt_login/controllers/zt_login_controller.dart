import 'package:get/get.dart';

class ZtLoginController extends GetxController {
  //TODO: Implement ZtLoginController

  final count = 0.obs;

  final RxInt _age = 0.obs;

  set age(int val) => _age.value = val;
  int get age => _age.value;


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
}
