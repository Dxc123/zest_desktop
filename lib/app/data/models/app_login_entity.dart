import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../../generated/json/app_login_entity.g.dart';


// /使用 json_serializable
// https://dartj.web.app/  json生成对应 model
/// 有数据模型更新要执行下面语句 =>>
/// dart run build_runner build --delete-conflicting-outputs
///
@JsonSerializable()
class AppLoginBaseEntity {
  AppLoginBaseEntity();

  factory AppLoginBaseEntity.fromJson(Map<String, dynamic> json) => $AppLoginBaseEntityFromJson(json);

  int? code;
  String? message;
  int? timestamp;
  AppLoginEntity? data;

  Map<String, dynamic> toJson() => $AppLoginBaseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppLoginEntity {
  AppLoginEntity();

  factory AppLoginEntity.fromJson(Map<String, dynamic> json) => $AppLoginEntityFromJson(json);

  Map<String, dynamic> toJson() => $AppLoginEntityToJson(this);

  AppLoginEntityToken? token;
  String? enterTheSystem;
  AppLoginEntityUser? user;
}

@JsonSerializable()
class AppLoginEntityToken {
  AppLoginEntityToken();

  factory AppLoginEntityToken.fromJson(Map<String, dynamic> json) => $AppLoginEntityTokenFromJson(json);

  Map<String, dynamic> toJson() => $AppLoginEntityTokenToJson(this);

  int? expire;
  String? agoraToken;
  String? authorization;
  String? rtmToken;
  String? userId;
  String? jpushAlias;
}

@JsonSerializable()
class AppLoginEntityUser {
  AppLoginEntityUser();

  factory AppLoginEntityUser.fromJson(Map<String, dynamic> json) => $AppLoginEntityUserFromJson(json);

  Map<String, dynamic> toJson() => $AppLoginEntityUserToJson(this);

  bool? accountNonExpired;
  bool? accountNonLocked;
  List<dynamic>? authorities;
  int? auth;
  bool? credentialsNonExpired;
  String? userId;
  String? portrait;
  bool? enabled;
  int? created;
  String? username;
  String? nickname;
  int? gender;
  String? status;
  int? areaCode;
}
