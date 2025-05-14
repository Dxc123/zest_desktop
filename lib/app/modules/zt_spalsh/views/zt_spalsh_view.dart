import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/zt_spalsh_controller.dart';

class ZtSpalshView extends StatefulWidget {
  const ZtSpalshView({super.key});

  @override
  State<ZtSpalshView> createState() => _ZtSpalshViewState();
}

class _ZtSpalshViewState extends State<ZtSpalshView> {
  final ZtSpalshController ztSpalshController = Get.put(ZtSpalshController());

  @override
  void dispose() {
    Get.delete<ZtSpalshController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Image.asset(
        "assets/images/app_launcher_splash_2.png",
        fit: BoxFit.cover,
        width: Get.width,
        height: Get.height,
      ),
    );
  }
}
