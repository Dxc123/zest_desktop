import 'dart:convert';

import '../../../generated/json/api_user_Info_entity.g.dart';
import '../../../generated/json/base/json_field.dart';

@JsonSerializable()
class ApiUserInfoFatherEntity {
  ApiUserInfoFatherEntity();

  factory ApiUserInfoFatherEntity.fromJson(Map<String, dynamic> json) => $ApiUserInfoFatherEntityFromJson(json);
  int? errorCode;
  String? errorMsg;
  ApiUserInfoEntity? data;

  Map<String, dynamic> toJson() => $ApiUserInfoFatherEntityToJson(this);
}

@JsonSerializable()
class ApiUserInfoEntity {
  ApiUserInfoEntity();

  factory ApiUserInfoEntity.fromJson(Map<String, dynamic> json) => $ApiUserInfoEntityFromJson(json);

  bool? admin;
  List<dynamic>? chapterTops;
  int? coinCount;
  List<int>? collectIds;
  String? email;
  String? icon;
  int? id;
  String? nickname;
  String? password;
  String? publicName;
  String? token;
  int? type;
  String? username;

  Map<String, dynamic> toJson() => $ApiUserInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
