import 'dart:convert';

import '../../../../../generated/json/base/json_field.dart';
import '../../../generated/json/ap_net_response_entity.g.dart';

@JsonSerializable()
class ApiNetResponseEntity {
  ApiNetResponseEntity();

  factory ApiNetResponseEntity.fromJson(Map<String, dynamic> json) => $ApiNetResponseEntityFromJson(json);
  String? message;
  int? code;
  dynamic data;

  Map<String, dynamic> toJson() => $ApiNetResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NetDataStringEntity {
  NetDataStringEntity();

  factory NetDataStringEntity.fromJson(Map<String, dynamic> json) => $NetDataStringEntityFromJson(json);
  int? code;
  String? message;
  String? data;

  Map<String, dynamic> toJson() => $NetDataStringEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}


