import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ze_message_controller.dart';

class ZeMessageView extends GetView<ZeMessageController> {
  const ZeMessageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZeMessageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ZeMessageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
