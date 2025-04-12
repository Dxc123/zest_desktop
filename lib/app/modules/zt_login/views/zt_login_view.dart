import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/zt_login_controller.dart';

class ZtLoginView extends GetView<ZtLoginController> {
  const ZtLoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZtLoginView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ZtLoginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

