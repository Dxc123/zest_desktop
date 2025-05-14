import 'package:flutter/material.dart';

// 自定义动画辅助对象
extension AnimatedWidgetExtensions on Widget {
  Widget fadeIn({Duration duration = const Duration(milliseconds: 500)}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: duration,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: child,
      ),
      child: this,
    );
  }

  Widget slideUp({Duration duration = const Duration(milliseconds: 500)}) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: const Offset(0, 0.3), end: Offset.zero),
      duration: duration,
      builder: (context, value, child) => Transform.translate(
        offset: value * 100,
        child: child,
      ),
      child: this,
    );
  }
}

/**
    Text("Animated Text")
    .fadeIn()
    .slideUp();
 */