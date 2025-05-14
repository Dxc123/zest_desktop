import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ze_discover_controller.dart';

class ZeDiscoverView extends GetView<ZeDiscoverController> {
  const ZeDiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flow Widget Demo'),
        centerTitle: true,
      ),
      // body: Flow(
      //   delegate: FlowDelegateExample(),
      //   children: List.generate(5, (index) {
      //     return Container(
      //       width: 50,
      //       height: 50,
      //       color: Colors.primaries[index % Colors.primaries.length],
      //     );
      //   }),
      // ),
      // GridPaper 绘制网格的小部件,设计或调试期间，可用于对齐其他小部件。
      // Flow 创建视差滚动等复杂布局的小部件
      body:  GridPaper(
        color: Colors.blue,
        divisions: 4,
        interval: 100,
        subdivisions: 2,
        child: Flow(
          delegate: FlowDelegateExample(),
          children: List.generate(5, (index) {
            return Container(
              width: 50,
              height: 50,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }),
        ),
      ),
    );
  }
}

class FlowDelegateExample extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i = 0; i < context.childCount; i++) {
      final x = i * 60.0;
      final y = i * 60.0;
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) => false;
}
