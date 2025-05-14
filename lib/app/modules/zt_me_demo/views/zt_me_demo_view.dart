import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/zt_me_demo_controller.dart';

class ZtMeDemoView extends GetView<ZtMeDemoController> {
  const ZtMeDemoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZtMeDemoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ZtMeDemoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
