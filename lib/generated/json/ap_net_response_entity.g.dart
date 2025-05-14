import 'package:zest_desktop/generated/json/base/json_convert_content.dart';
import 'package:zest_desktop/app/data/api_net_request/ap_net_response_entity.dart';

ApiNetResponseEntity $ApiNetResponseEntityFromJson(Map<String, dynamic> json) {
  final ApiNetResponseEntity apiNetResponseEntity = ApiNetResponseEntity();
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    apiNetResponseEntity.message = message;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    apiNetResponseEntity.code = code;
  }
  final dynamic data = json['data'];
  if (data != null) {
    apiNetResponseEntity.data = data;
  }
  return apiNetResponseEntity;
}

Map<String, dynamic> $ApiNetResponseEntityToJson(ApiNetResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['message'] = entity.message;
  data['code'] = entity.code;
  data['data'] = entity.data;
  return data;
}

extension ApiNetResponseEntityExtension on ApiNetResponseEntity {
  ApiNetResponseEntity copyWith({
    String? message,
    int? code,
    dynamic data,
  }) {
    return ApiNetResponseEntity()
      ..message = message ?? this.message
      ..code = code ?? this.code
      ..data = data ?? this.data;
  }
}

NetDataStringEntity $NetDataStringEntityFromJson(Map<String, dynamic> json) {
  final NetDataStringEntity netDataStringEntity = NetDataStringEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    netDataStringEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    netDataStringEntity.message = message;
  }
  final String? data = jsonConvert.convert<String>(json['data']);
  if (data != null) {
    netDataStringEntity.data = data;
  }
  return netDataStringEntity;
}

Map<String, dynamic> $NetDataStringEntityToJson(NetDataStringEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['data'] = entity.data;
  return data;
}

extension NetDataStringEntityExtension on NetDataStringEntity {
  NetDataStringEntity copyWith({
    int? code,
    String? message,
    String? data,
  }) {
    return NetDataStringEntity()
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}