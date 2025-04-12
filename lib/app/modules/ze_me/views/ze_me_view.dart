import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ze_me_controller.dart';

class ZeMeView extends GetView<ZeMeController> {
  const ZeMeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZeMeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ZeMeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
