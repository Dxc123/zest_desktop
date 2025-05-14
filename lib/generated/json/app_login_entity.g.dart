import 'package:zest_desktop/generated/json/base/json_convert_content.dart';
import 'package:zest_desktop/app/data/models/app_login_entity.dart';
import 'package:json_annotation/json_annotation.dart';


AppLoginBaseEntity $AppLoginBaseEntityFromJson(Map<String, dynamic> json) {
  final AppLoginBaseEntity appLoginBaseEntity = AppLoginBaseEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    appLoginBaseEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    appLoginBaseEntity.message = message;
  }
  final int? timestamp = jsonConvert.convert<int>(json['timestamp']);
  if (timestamp != null) {
    appLoginBaseEntity.timestamp = timestamp;
  }
  final AppLoginEntity? data = jsonConvert.convert<AppLoginEntity>(json['data']);
  if (data != null) {
    appLoginBaseEntity.data = data;
  }
  return appLoginBaseEntity;
}

Map<String, dynamic> $AppLoginBaseEntityToJson(AppLoginBaseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['timestamp'] = entity.timestamp;
  data['data'] = entity.data?.toJson();
  return data;
}

extension AppLoginBaseEntityExtension on AppLoginBaseEntity {
  AppLoginBaseEntity copyWith({
    int? code,
    String? message,
    int? timestamp,
    AppLoginEntity? data,
  }) {
    return AppLoginBaseEntity()
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..timestamp = timestamp ?? this.timestamp
      ..data = data ?? this.data;
  }
}

AppLoginEntity $AppLoginEntityFromJson(Map<String, dynamic> json) {
  final AppLoginEntity appLoginEntity = AppLoginEntity();
  final AppLoginEntityToken? token = jsonConvert.convert<AppLoginEntityToken>(json['token']);
  if (token != null) {
    appLoginEntity.token = token;
  }
  final String? enterTheSystem = jsonConvert.convert<String>(json['enterTheSystem']);
  if (enterTheSystem != null) {
    appLoginEntity.enterTheSystem = enterTheSystem;
  }
  final AppLoginEntityUser? user = jsonConvert.convert<AppLoginEntityUser>(json['user']);
  if (user != null) {
    appLoginEntity.user = user;
  }
  return appLoginEntity;
}

Map<String, dynamic> $AppLoginEntityToJson(AppLoginEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['token'] = entity.token?.toJson();
  data['enterTheSystem'] = entity.enterTheSystem;
  data['user'] = entity.user?.toJson();
  return data;
}

extension AppLoginEntityExtension on AppLoginEntity {
  AppLoginEntity copyWith({
    AppLoginEntityToken? token,
    String? enterTheSystem,
    AppLoginEntityUser? user,
  }) {
    return AppLoginEntity()
      ..token = token ?? this.token
      ..enterTheSystem = enterTheSystem ?? this.enterTheSystem
      ..user = user ?? this.user;
  }
}

AppLoginEntityToken $AppLoginEntityTokenFromJson(Map<String, dynamic> json) {
  final AppLoginEntityToken appLoginEntityToken = AppLoginEntityToken();
  final int? expire = jsonConvert.convert<int>(json['expire']);
  if (expire != null) {
    appLoginEntityToken.expire = expire;
  }
  final String? agoraToken = jsonConvert.convert<String>(json['agoraToken']);
  if (agoraToken != null) {
    appLoginEntityToken.agoraToken = agoraToken;
  }
  final String? authorization = jsonConvert.convert<String>(json['authorization']);
  if (authorization != null) {
    appLoginEntityToken.authorization = authorization;
  }
  final String? rtmToken = jsonConvert.convert<String>(json['rtmToken']);
  if (rtmToken != null) {
    appLoginEntityToken.rtmToken = rtmToken;
  }
  final String? userId = jsonConvert.convert<String>(json['userId']);
  if (userId != null) {
    appLoginEntityToken.userId = userId;
  }
  final String? jpushAlias = jsonConvert.convert<String>(json['jpushAlias']);
  if (jpushAlias != null) {
    appLoginEntityToken.jpushAlias = jpushAlias;
  }
  return appLoginEntityToken;
}

Map<String, dynamic> $AppLoginEntityTokenToJson(AppLoginEntityToken entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['expire'] = entity.expire;
  data['agoraToken'] = entity.agoraToken;
  data['authorization'] = entity.authorization;
  data['rtmToken'] = entity.rtmToken;
  data['userId'] = entity.userId;
  data['jpushAlias'] = entity.jpushAlias;
  return data;
}

extension AppLoginEntityTokenExtension on AppLoginEntityToken {
  AppLoginEntityToken copyWith({
    int? expire,
    String? agoraToken,
    String? authorization,
    String? rtmToken,
    String? userId,
    String? jpushAlias,
  }) {
    return AppLoginEntityToken()
      ..expire = expire ?? this.expire
      ..agoraToken = agoraToken ?? this.agoraToken
      ..authorization = authorization ?? this.authorization
      ..rtmToken = rtmToken ?? this.rtmToken
      ..userId = userId ?? this.userId
      ..jpushAlias = jpushAlias ?? this.jpushAlias;
  }
}

AppLoginEntityUser $AppLoginEntityUserFromJson(Map<String, dynamic> json) {
  final AppLoginEntityUser appLoginEntityUser = AppLoginEntityUser();
  final bool? accountNonExpired = jsonConvert.convert<bool>(json['accountNonExpired']);
  if (accountNonExpired != null) {
    appLoginEntityUser.accountNonExpired = accountNonExpired;
  }
  final bool? accountNonLocked = jsonConvert.convert<bool>(json['accountNonLocked']);
  if (accountNonLocked != null) {
    appLoginEntityUser.accountNonLocked = accountNonLocked;
  }
  final List<dynamic>? authorities = (json['authorities'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (authorities != null) {
    appLoginEntityUser.authorities = authorities;
  }
  final int? auth = jsonConvert.convert<int>(json['auth']);
  if (auth != null) {
    appLoginEntityUser.auth = auth;
  }
  final bool? credentialsNonExpired = jsonConvert.convert<bool>(json['credentialsNonExpired']);
  if (credentialsNonExpired != null) {
    appLoginEntityUser.credentialsNonExpired = credentialsNonExpired;
  }
  final String? userId = jsonConvert.convert<String>(json['userId']);
  if (userId != null) {
    appLoginEntityUser.userId = userId;
  }
  final String? portrait = jsonConvert.convert<String>(json['portrait']);
  if (portrait != null) {
    appLoginEntityUser.portrait = portrait;
  }
  final bool? enabled = jsonConvert.convert<bool>(json['enabled']);
  if (enabled != null) {
    appLoginEntityUser.enabled = enabled;
  }
  final int? created = jsonConvert.convert<int>(json['created']);
  if (created != null) {
    appLoginEntityUser.created = created;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    appLoginEntityUser.username = username;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    appLoginEntityUser.nickname = nickname;
  }
  final int? gender = jsonConvert.convert<int>(json['gender']);
  if (gender != null) {
    appLoginEntityUser.gender = gender;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    appLoginEntityUser.status = status;
  }
  final int? areaCode = jsonConvert.convert<int>(json['areaCode']);
  if (areaCode != null) {
    appLoginEntityUser.areaCode = areaCode;
  }
  return appLoginEntityUser;
}

Map<String, dynamic> $AppLoginEntityUserToJson(AppLoginEntityUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['accountNonExpired'] = entity.accountNonExpired;
  data['accountNonLocked'] = entity.accountNonLocked;
  data['authorities'] = entity.authorities;
  data['auth'] = entity.auth;
  data['credentialsNonExpired'] = entity.credentialsNonExpired;
  data['userId'] = entity.userId;
  data['portrait'] = entity.portrait;
  data['enabled'] = entity.enabled;
  data['created'] = entity.created;
  data['username'] = entity.username;
  data['nickname'] = entity.nickname;
  data['gender'] = entity.gender;
  data['status'] = entity.status;
  data['areaCode'] = entity.areaCode;
  return data;
}

extension AppLoginEntityUserExtension on AppLoginEntityUser {
  AppLoginEntityUser copyWith({
    bool? accountNonExpired,
    bool? accountNonLocked,
    List<dynamic>? authorities,
    int? auth,
    bool? credentialsNonExpired,
    String? userId,
    String? portrait,
    bool? enabled,
    int? created,
    String? username,
    String? nickname,
    int? gender,
    String? status,
    int? areaCode,
  }) {
    return AppLoginEntityUser()
      ..accountNonExpired = accountNonExpired ?? this.accountNonExpired
      ..accountNonLocked = accountNonLocked ?? this.accountNonLocked
      ..authorities = authorities ?? this.authorities
      ..auth = auth ?? this.auth
      ..credentialsNonExpired = credentialsNonExpired ?? this.credentialsNonExpired
      ..userId = userId ?? this.userId
      ..portrait = portrait ?? this.portrait
      ..enabled = enabled ?? this.enabled
      ..created = created ?? this.created
      ..username = username ?? this.username
      ..nickname = nickname ?? this.nickname
      ..gender = gender ?? this.gender
      ..status = status ?? this.status
      ..areaCode = areaCode ?? this.areaCode;
  }
}