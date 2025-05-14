import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/zt_home_controller.dart';

class ZtHomeView extends GetView<ZtHomeController> {
  const ZtHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZtHomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ZtHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
