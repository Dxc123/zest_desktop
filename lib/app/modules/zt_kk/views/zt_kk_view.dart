import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/zt_kk_controller.dart';

class ZtKkView extends GetView<ZtKkController> {
  const ZtKkView({super.key});
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
