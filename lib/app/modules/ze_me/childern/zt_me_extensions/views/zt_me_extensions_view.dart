import 'package:flutter/material.dart';

import 'package:get/get.dart' hide WidgetPaddingX;
import 'package:awesome_extensions/awesome_extensions.dart';

import '../controllers/zt_me_extensions_controller.dart';

class ZtMeExtensionsView extends GetView<ZtMeExtensionsController> {
  const ZtMeExtensionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('awesome_extensions使用示例'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: <Widget>[
          const Text('Hello World').bold().fontSize(25).italic().withUnderLine().textColor(Colors.red),
          5.0.heightBox,
          5.0.widthBox,
          const Text("text").paddingAll(8.0),
          const Text("填充扩展").marginAll(8.0),
          const Text("透明度").setOpacity(opacity: 0.5),

          // const Text("SliverToBoxAdapter").sliver,

          // const Text("expanded").expanded(),
          // const Text("flexible").flexible()

          Container(
            height: 50,
            width: 50,
            color: Colors.cyan,
          ).applyShimmer(),

          //Shimmer Effect  闪光效果
          const Text("applyShimmer").applyShimmer(),
          // 添加圆角、阴影、对齐和添加手势
          Container(
            height: 30,
            width: 30,
            color: Colors.red,
          )
              .withRoundCorners(backgroundColor: Colors.grey)
              .withShadow()
              .alignAtCenter()
              .toCenter()
              .withTooltip('My Tooltip')
              .paddingOnly(left: 10)
              .paddingAll(20)
              .onTap(
                () => print('tap'),
              )
              .onLongPress(
                () => print('long press'),
              ),

          // notNullWidget
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget?>[
              Container(
                height: 100,
                width: 100,
                color: Colors.cyan,
              ).showIf(true),
              Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ).showIf(false),
            ].notNullWidget(), // 仅返回非空的小部件
          ),
          // 分隔
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Hello').paddingAll(5),
              const Text('World').paddingAll(5),
              const Text('Seperated').paddingAll(5),
              const Text('By').paddingAll(5),
              const Text('Commas').paddingAll(5),
            ].separatedby(
              const Text(','),
            ),
          ),
        ]),
      ),
    );
  }
}
