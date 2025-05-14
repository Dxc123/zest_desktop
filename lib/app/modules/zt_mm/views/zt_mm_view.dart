import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/zt_mm_controller.dart';

class ZtMmView extends GetView<ZtMmController> {
  const ZtMmView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZtUuView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ZtUuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
