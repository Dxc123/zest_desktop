import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/zt_uu_controller.dart';

class ZtUuView extends GetView<ZtUuController> {
  const ZtUuView({super.key});
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
