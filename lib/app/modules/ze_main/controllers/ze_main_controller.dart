import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZeMainController extends GetxController {
  late final PageController pageController;
  RxInt pageSelectedIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }



  void handleNavBarTap(int index) {
    if (pageSelectedIndex.value == index) return;
    pageSelectedIndex.value = index;
    update();
    pageController.jumpToPage(index);
  }

}
