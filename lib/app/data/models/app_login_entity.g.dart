// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_login_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppLoginEntity _$AppLoginEntityFromJson(Map<String, dynamic> json) =>
    AppLoginEntity()
      ..token = json['token'] == null
          ? null
          : AppLoginEntityToken.fromJson(json['token'] as Map<String, dynamic>)
      ..enterTheSystem = json['enterTheSystem'] as String?
      ..user = json['user'] == null
          ? null
          : AppLoginEntityUser.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$AppLoginEntityToJson(AppLoginEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
      'enterTheSystem': instance.enterTheSystem,
      'user': instance.user,
    };

AppLoginEntityToken _$AppLoginEntityTokenFromJson(Map<String, dynamic> json) =>
    AppLoginEntityToken()
      ..expire = (json['expire'] as num?)?.toInt()
      ..agoraToken = json['agoraToken'] as String?
      ..authorization = json['authorization'] as String?
      ..rtmToken = json['rtmToken'] as String?
      ..userId = json['userId'] as String?
      ..jpushAlias = json['jpushAlias'] as String?;

Map<String, dynamic> _$AppLoginEntityTokenToJson(
        AppLoginEntityToken instance) =>
    <String, dynamic>{
      'expire': instance.expire,
      'agoraToken': instance.agoraToken,
      'authorization': instance.authorization,
      'rtmToken': instance.rtmToken,
      'userId': instance.userId,
      'jpushAlias': instance.jpushAlias,
    };

AppLoginEntityUser _$AppLoginEntityUserFromJson(Map<String, dynamic> json) =>
    AppLoginEntityUser()
      ..accountNonExpired = json['accountNonExpired'] as bool?
      ..accountNonLocked = json['accountNonLocked'] as bool?
      ..authorities = json['authorities'] as List<dynamic>?
      ..auth = (json['auth'] as num?)?.toInt()
      ..credentialsNonExpired = json['credentialsNonExpired'] as bool?
      ..userId = json['userId'] as String?
      ..portrait = json['portrait'] as String?
      ..enabled = json['enabled'] as bool?
      ..created = (json['created'] as num?)?.toInt()
      ..username = json['username'] as String?
      ..nickname = json['nickname'] as String?
      ..gender = (json['gender'] as num?)?.toInt()
      ..status = json['status'] as String?
      ..areaCode = json['areaCode'] as String?;

Map<String, dynamic> _$AppLoginEntityUserToJson(AppLoginEntityUser instance) =>
    <String, dynamic>{
      'accountNonExpired': instance.accountNonExpired,
      'accountNonLocked': instance.accountNonLocked,
      'authorities': instance.authorities,
      'auth': instance.auth,
      'credentialsNonExpired': instance.credentialsNonExpired,
      'userId': instance.userId,
      'portrait': instance.portrait,
      'enabled': instance.enabled,
      'created': instance.created,
      'username': instance.username,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'status': instance.status,
      'areaCode': instance.areaCode,
    };
