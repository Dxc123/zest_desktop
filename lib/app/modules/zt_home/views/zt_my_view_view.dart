import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ZtMyViewView extends GetView {
  const ZtMyViewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZtMyViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          children: [
            Text(
              'ZtMyViewView is working',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'ZtMyViewView is working',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
