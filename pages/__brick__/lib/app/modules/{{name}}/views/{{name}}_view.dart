import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/{{name}}_controller.dart';

class {{name.pascalCase()}}View extends GetView<{{name.pascalCase()}}Controller> {
  const {{name.pascalCase()}}View({super.key});
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
