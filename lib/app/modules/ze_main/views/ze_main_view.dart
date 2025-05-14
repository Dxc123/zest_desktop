import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../ze_discover/views/ze_discover_view.dart';
import '../../ze_me/views/ze_me_view.dart';
import '../../ze_message/views/ze_message_view.dart';
import '../../zt_home/views/zt_home_view.dart';
import '../controllers/ze_main_controller.dart';

class ZeMainView extends StatefulWidget {
  const ZeMainView({super.key});

  @override
  State<ZeMainView> createState() => _ZeMainViewState();
}

class _ZeMainViewState extends State<ZeMainView> with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  final ZeMainController controller = Get.put(ZeMainController());

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    Get.delete<ZeMainController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Obx(() {
        controller.pageSelectedIndex.value;
        return Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: PageView(
                    pageSnapping: false,
                    scrollBehavior: null,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    children: const <Widget>[
                      ZtHomeView(),
                      ZeDiscoverView(),
                      ZeMessageView(),
                      ZeMeView(),
                    ],
                  ),
                ),
              ],
            ),
            PositionedDirectional(
              start: 0,
              end: 0,
              bottom: 0,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _buildSelect("app_tab_home", 0),
                          _buildSelect("app_tab_discover", 1),
                          _buildSelect("app_tab_message", 2),
                          _buildSelect("app_tab_me", 3),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  _buildSelect(String imgName, int index) {
    return GestureDetector(
      onTap: () => controller.handleNavBarTap(index),
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Image.asset(
          "assets/images/$imgName${index == controller.pageSelectedIndex.value ? "_select" : "_normal"}.png",
          excludeFromSemantics: true,
          gaplessPlayback: true,
        ),
      ),
    );
  }

  // 主入口的Widget 监听App生命周期的作用
//   当应用从前台切换到后台时，首先会失去用户交互的能力（inactive），
//   然后窗口变得不可见（hidden），最后进入完全后台运行状态（paused）。

  // 从后台台进入前台会依次调用到：
//  首先会触发 hidden 状态，表示应用窗口开始显示，但尚未完全与用户交互。
//  接下来，应用会进入 inactive 状态，这时应用已经可见但仍处于「非活动」状态，可能还在加载一些资源或准备好恢复与用户的交互。
//  最后，应用进入 resumed 状态，此时应用完全恢复可见并可以响应用户的交互。这是应用进入前台后最终稳定的状态。
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        //应用程序处于闲置状态并且没有收到用户的输入事件。
        //注意这个状态，在切换到后台时候会触发，所以流程应该是先冻结窗口，然后停止UI
        break;

      case AppLifecycleState.detached:
        //从当前页面离开
        break;

      case AppLifecycleState.resumed:
        //进入页面的时候不会触发该状态
        //应用程序处于可见状态，并且可以响应用户的输入事件
        break;

      case AppLifecycleState.hidden:
        // 用于表示应用界面不可见但仍在后台运行
        break;

      case AppLifecycleState.paused:
        //应用程序处于不可见状态
        break;
    }
  }
}
