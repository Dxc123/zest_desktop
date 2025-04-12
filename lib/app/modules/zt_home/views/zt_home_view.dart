import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';

import '../../../../core/env_config.dart';
import '../../../data/utils/log_utils.dart';
import '../../../routes/app_pages.dart';
import '../controllers/zt_home_controller.dart';

class ZtHomeView extends GetView<ZtHomeController> {
  const ZtHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('API_URL: ${EnvConfig.apiUrl}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Wrap(
          spacing: 20,
          runSpacing: 10,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              // Flutter 3.24 CarouselView组件
              child: CarouselView(
                itemExtent: 330,
                shrinkExtent: 200,
                padding: const EdgeInsets.all(10.0),
                children: List.generate(
                  9,
                      (index) => Container(color: Colors.green, child: Text("${index + 1}"),),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                LoggerUtils.d("${dotenv.env['API_URL']}");
              },
              child: const Text('flutter_dotenv示例',style: TextStyle(color: Colors.red),),
            ),
            OutlinedButton(
              onPressed: () {
                Get.toNamed(Routes.ZT_HOME);
              },
              child: const Text('多语言示例-Getx/Flutter Intl'),
            ),
            OutlinedButton(
              onPressed: () {
                Get.toNamed(Routes.ZE_ME_SIGNALS);
              },
              child: const Text('Signals状态库示例---主题切换'),
            ),
            OutlinedButton(
              onPressed: () {
                Get.toNamed(Routes.ZE_ME_FORM);
              },
              child: const Text('Form表单校验'),
            ),
            OutlinedButton(
              onPressed: () {
                Get.toNamed(Routes.ZE_ME_VALUE_NOTIFIER);
              },
              child: const Text('ValueNotifier示例'),
            ),
            OutlinedButton(
              onPressed: () {
                Get.toNamed(Routes.ZE_ME_THEME);
              },
              child: const Text('设置暗黑模式'),
            ),
            OutlinedButton(
              onPressed: () {
                Get.toNamed(Routes.ZE_ME_DEBOUNCER);
              },
              child: const Text('使用防抖示例'),
            ),
          ],
        ),
      ),
    );
  }


}

class MyUserModel {
  int? id;
  String? name;

  MyUserModel({this.id, this.name});

  MyUserModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class RxUserModel {
  final id = 0.obs;
  final nome = 'nome'.obs;
}

class UserModel {
  UserModel({id, nome});

  final rx = RxUserModel();

  get nome => rx.nome.value;

  set nome(value) => rx.nome.value = value;

  get id => rx.id.value;

  set id(value) => rx.id.value = value;

  UserModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    return data;
  }
}
