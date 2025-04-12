import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZeMainController extends GetxController {
  late final PageController pageController;
  var pageSelectedIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void handleNavBarTap(int index) {
    if (pageSelectedIndex.value == index) return;
    pageSelectedIndex.value = index;
    update();
    pageController.jumpToPage(index);
  }

}
