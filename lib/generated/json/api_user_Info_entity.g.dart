import 'package:zest_desktop/generated/json/base/json_convert_content.dart';
import 'package:zest_desktop/app/data/models/api_user_Info_entity.dart';

ApiUserInfoFatherEntity $ApiUserInfoFatherEntityFromJson(Map<String, dynamic> json) {
  final ApiUserInfoFatherEntity apiUserInfoFatherEntity = ApiUserInfoFatherEntity();
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    apiUserInfoFatherEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    apiUserInfoFatherEntity.errorMsg = errorMsg;
  }
  final ApiUserInfoEntity? data = jsonConvert.convert<ApiUserInfoEntity>(json['data']);
  if (data != null) {
    apiUserInfoFatherEntity.data = data;
  }
  return apiUserInfoFatherEntity;
}

Map<String, dynamic> $ApiUserInfoFatherEntityToJson(ApiUserInfoFatherEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  data['data'] = entity.data?.toJson();
  return data;
}

extension ApiUserInfoFatherEntityExtension on ApiUserInfoFatherEntity {
  ApiUserInfoFatherEntity copyWith({
    int? errorCode,
    String? errorMsg,
    ApiUserInfoEntity? data,
  }) {
    return ApiUserInfoFatherEntity()
      ..errorCode = errorCode ?? this.errorCode
      ..errorMsg = errorMsg ?? this.errorMsg
      ..data = data ?? this.data;
  }
}

ApiUserInfoEntity $ApiUserInfoEntityFromJson(Map<String, dynamic> json) {
  final ApiUserInfoEntity apiUserInfoEntity = ApiUserInfoEntity();
  final bool? admin = jsonConvert.convert<bool>(json['admin']);
  if (admin != null) {
    apiUserInfoEntity.admin = admin;
  }
  final List<dynamic>? chapterTops = (json['chapterTops'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (chapterTops != null) {
    apiUserInfoEntity.chapterTops = chapterTops;
  }
  final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
  if (coinCount != null) {
    apiUserInfoEntity.coinCount = coinCount;
  }
  final List<int>? collectIds = (json['collectIds'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (collectIds != null) {
    apiUserInfoEntity.collectIds = collectIds;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    apiUserInfoEntity.email = email;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    apiUserInfoEntity.icon = icon;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    apiUserInfoEntity.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    apiUserInfoEntity.nickname = nickname;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    apiUserInfoEntity.password = password;
  }
  final String? publicName = jsonConvert.convert<String>(json['publicName']);
  if (publicName != null) {
    apiUserInfoEntity.publicName = publicName;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    apiUserInfoEntity.token = token;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    apiUserInfoEntity.type = type;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    apiUserInfoEntity.username = username;
  }
  return apiUserInfoEntity;
}

Map<String, dynamic> $ApiUserInfoEntityToJson(ApiUserInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['admin'] = entity.admin;
  data['chapterTops'] = entity.chapterTops;
  data['coinCount'] = entity.coinCount;
  data['collectIds'] = entity.collectIds;
  data['email'] = entity.email;
  data['icon'] = entity.icon;
  data['id'] = entity.id;
  data['nickname'] = entity.nickname;
  data['password'] = entity.password;
  data['publicName'] = entity.publicName;
  data['token'] = entity.token;
  data['type'] = entity.type;
  data['username'] = entity.username;
  return data;
}

extension ApiUserInfoEntityExtension on ApiUserInfoEntity {
  ApiUserInfoEntity copyWith({
    bool? admin,
    List<dynamic>? chapterTops,
    int? coinCount,
    List<int>? collectIds,
    String? email,
    String? icon,
    int? id,
    String? nickname,
    String? password,
    String? publicName,
    String? token,
    int? type,
    String? username,
  }) {
    return ApiUserInfoEntity()
      ..admin = admin ?? this.admin
      ..chapterTops = chapterTops ?? this.chapterTops
      ..coinCount = coinCount ?? this.coinCount
      ..collectIds = collectIds ?? this.collectIds
      ..email = email ?? this.email
      ..icon = icon ?? this.icon
      ..id = id ?? this.id
      ..nickname = nickname ?? this.nickname
      ..password = password ?? this.password
      ..publicName = publicName ?? this.publicName
      ..token = token ?? this.token
      ..type = type ?? this.type
      ..username = username ?? this.username;
  }
}