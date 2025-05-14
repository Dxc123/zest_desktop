import 'package:flutter/material.dart';

mixin AddListenerMixin<T extends StatefulWidget> on State<T> {
  final Map<Listenable, VoidCallback> _registrationInfo = {};

  void addListener(Listenable listenable, VoidCallback listener) {
    listenable.addListener(listener);
    _registrationInfo[listenable] = listener;
  }

  @override
  void dispose() {
    for (var entry in _registrationInfo.entries) {
      entry.key.removeListener(entry.value);
    }
    _registrationInfo.clear();
    super.dispose();
  }
}
