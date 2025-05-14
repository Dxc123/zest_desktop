import 'dart:async';

import 'package:event_bus/event_bus.dart';

/*
使用示例
// 定义事件类
class CounterEvent {
  final int count;
  CounterEvent(this.count);
}
// 发布计数事件
EventBusUtils.fire(CounterEvent(newCount));


// 订阅计数事件
StreamSubscription<CounterEvent> subscription = EventBusUtils.on<CounterEvent>((event) {
  print('收到计数事件，当前计数：${event.count}');
});

// 取消订阅事件
EventBusUtils.off<CounterEvent>();

// 取消所有订阅
EventBusUtils.offAll();

*/

class EventBusUtils {
  // 单例的 EventBus 实例
  static final EventBus _eventBus = EventBus();

  // 用于管理所有的订阅
  static final Map<String, StreamSubscription> _subscriptions = <String, StreamSubscription>{};

  // 获取 EventBus 实例
  static EventBus get instance => _eventBus;

  // ===========================
  // 订阅事件
  // ===========================

  /// 订阅事件
  static StreamSubscription<T> on<T>(void Function(T event) onData) {
    final StreamSubscription<T> subscription = _eventBus.on<T>().listen(onData);
    _subscriptions[T.toString()] = subscription;
    return subscription;
  }

  // ===========================
  // 发布事件
  // ===========================

  /// 发布事件
  static void fire<T>(T event) {
    _eventBus.fire(event);
  }

  // ===========================
  // 取消订阅
  // ===========================

  /// 取消订阅某个事件
  static void off<T>() {
    final String key = T.toString();
    final StreamSubscription? subscription = _subscriptions[key];
    if (subscription != null) {
      subscription.cancel();
      _subscriptions.remove(key);
    }
  }

  /// 取消所有订阅
  static void offAll() {
    _subscriptions.forEach((String key, StreamSubscription subscription) {
      subscription.cancel();
    });
    _subscriptions.clear();
  }
}
