import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:signals/signals_flutter.dart';

import '../controllers/ze_me_signals_controller.dart';

class ZeMeSignalsView extends StatefulWidget {
  const ZeMeSignalsView({super.key});

  @override
  State<ZeMeSignalsView> createState() => _ZeMeSignalsViewState();
}

class _ZeMeSignalsViewState extends State<ZeMeSignalsView> with SignalsMixin {
  final ZeMeSignalsController controller = Get.put(ZeMeSignalsController());

  late final Signal<int> counter = createSignal(0);
  late final Computed<bool> isEven = createComputed(() => counter.value.isEven);
  late final Computed<bool> isOdd = createComputed(() => counter.value.isOdd);

  @override
  void dispose() {
    Get.delete<ZeMeSignalsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Signals Demo '),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Counter: $counter'),
            const SizedBox(height: 20),
            Text('Is Even: $isEven'),
            const SizedBox(height: 20),
            Text('Is Odd: $isOdd'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => counter.value++,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
