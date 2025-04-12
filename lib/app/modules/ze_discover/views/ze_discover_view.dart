import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ze_discover_controller.dart';

class ZeDiscoverView extends GetView<ZeDiscoverController> {
  const ZeDiscoverView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZeDiscoverView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ZeDiscoverView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
