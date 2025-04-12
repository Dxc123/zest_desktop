import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ze_me_value_notifier_controller.dart';
import 'counter_value_notifier.dart';

class ZeMeValueNotifierView extends StatefulWidget {
  const ZeMeValueNotifierView({super.key});

  @override
  State<ZeMeValueNotifierView> createState() => _ZeMeValueNotifierViewState();
}

class _ZeMeValueNotifierViewState extends State<ZeMeValueNotifierView> {
  final zeMeValueNotifierController = Get.put(ZeMeValueNotifierController());

  final CounterValueNotifier counter = CounterValueNotifier();

  @override
  void dispose() {
    Get.delete<ZeMeValueNotifierController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZeMeValueNotifierView'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'ZeMeValueNotifierView is working',
                style: TextStyle(fontSize: 20),
              ),
              ValueListenableBuilder<int>(
                valueListenable: counter.count,
                builder: (BuildContext context, int value, child) {
                  return Text(
                    '$value',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              ElevatedButton(
                onPressed: () => counter.incrementCount(),
                child: const Text('Increment'),
              ),
              const SizedBox(height: 50),
              TextField(
                onChanged: (String value) {
                  setState(() {
                    counter.email.value = value;
                  });
                },
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              TextField(
                onChanged: (String value) {
                  setState(() {
                    counter.password.value = value;
                  });
                },
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: ValueNotifier<bool>(counter.isValid),
                builder: (BuildContext context, bool isValid, child) {
                  return ElevatedButton(
                    onPressed: () => counter.incrementCount(),
                    child: const Text('Increment'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
