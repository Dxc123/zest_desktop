import 'package:flutter/foundation.dart';

class CounterValueNotifier {
  final ValueNotifier<int> count = ValueNotifier<int>(0);

  void incrementCount() {
    count.value++;
  }

  final ValueNotifier< String > email = ValueNotifier< String >( '' );
  final ValueNotifier< String > password = ValueNotifier< String >( '' );

  // 检查电子邮件和密码是否为空
  bool  get isValid => email.value.isNotEmpty && password.value.isNotEmpty;
}
