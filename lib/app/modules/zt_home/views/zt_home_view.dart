import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/zt_home_controller.dart';

class ZtHomeView extends GetView<ZtHomeController> {
  const ZtHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZtHomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ZtHomeView is working',
          style: TextStyle(fontSize: 20),
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
