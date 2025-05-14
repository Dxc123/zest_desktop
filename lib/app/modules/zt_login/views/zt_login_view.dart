import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/zt_login_controller.dart';


class ZtLoginView extends StatefulWidget {
  const ZtLoginView({super.key});

  @override
  State<ZtLoginView> createState() => _ZtLoginViewState();
}

class _ZtLoginViewState extends State<ZtLoginView> {
  final controller = Get.put(ZtLoginController());

  @override
  void dispose() {
    Get.delete<ZtLoginController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZtLoginView'),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          children: [
            const Text(
              'ZtLoginView is working',
              style: TextStyle(fontSize: 20),
            ),
            OutlinedButton(onPressed: () {
             controller.login();
            }, child: const Text("登录"))
          ],
        ),
      ),
    );
  }
}
