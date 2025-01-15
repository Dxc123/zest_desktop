import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/l10n.dart';
import '../../../../generated/locales.g.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.LoginPages_sign_in_apple.tr),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          S.current.sign_in_apple,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
