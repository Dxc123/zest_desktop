import 'dart:async';

import 'package:flutter/material.dart';

mixin StreamControlMixin<T extends StatefulWidget> on State<T> {
  final Set<StreamSubscription> _subscriptions = {};

  void addSubscription(StreamSubscription subscription) {
    if (subscription != null) {
      _subscriptions.add(subscription);
    }
  }

  bool removeSubscription(StreamSubscription subscription) {
    if (subscription != null) {
      return _subscriptions.remove(subscription);
    }
    return false;
  }

  void cancelAllEvents() {
    for (var subscription in _subscriptions) {
      try {
        subscription.cancel();
      } catch (e) {
        debugPrint('Error canceling subscription: $e');
      }
    }
    _subscriptions.clear();
  }

  bool hasSubscription(StreamSubscription subscription) {
    return _subscriptions.contains(subscription);
  }

  @override
  void dispose() {
    if (_subscriptions.isNotEmpty) {
      cancelAllEvents();
    }
    super.dispose();
  }
}
