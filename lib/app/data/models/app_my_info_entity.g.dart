// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_my_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppInfoDetailEntity _$AppInfoDetailEntityFromJson(Map<String, dynamic> json) =>
    AppInfoDetailEntity()
      ..userId = json['userId'] as String?
      ..username = json['username'] as String?
      ..auth = (json['auth'] as num?)?.toInt()
      ..intro = json['intro'] as String?
      ..portrait = json['portrait'] as String?
      ..nickname = json['nickname'] as String?
      ..areaCode = (json['areaCode'] as num?)?.toInt()
      ..status = json['status'] as String?
      ..isDoNotDisturb = (json['isDoNotDisturb'] as num?)?.toInt()
      ..createdAt = (json['createdAt'] as num?)?.toInt()
      ..created = (json['created'] as num?)?.toInt()
      ..isOnline = (json['isOnline'] as num?)?.toInt()
      ..isSignIn = (json['isSignIn'] as num?)?.toInt()
      ..propCount = (json['propCount'] as num?)?.toInt()
      ..callCardCount = (json['callCardCount'] as num?)?.toInt()
      ..callCardUsedCount = (json['callCardUsedCount'] as num?)?.toInt()
      ..callCardDuration = (json['callCardDuration'] as num?)?.toInt()
      ..releaseTime = (json['releaseTime'] as num?)?.toInt()
      ..gender = (json['gender'] as num?)?.toInt()
      ..country = (json['country'] as num?)?.toInt()
      ..connectRate = (json['connectRate'] as num?)?.toInt()
      ..birthday = (json['birthday'] as num?)?.toInt()
      ..expLevel = (json['expLevel'] as num?)?.toInt()
      ..userBalance = json['userBalance'] == null
          ? null
          : AppBalanceBeanEntity.fromJson(
              json['userBalance'] as Map<String, dynamic>)
      ..startBirthday = json['startBirthday'] as String?
      ..timeBirthday = json['timeBirthday'] as bool?
      ..stateGender = (json['stateGender'] as num?)?.toInt()
      ..isVip = (json['isVip'] as num?)?.toInt()
      ..vipSignIn = (json['vipSignIn'] as num?)?.toInt()
      ..vipEndTime = (json['vipEndTime'] as num?)?.toInt()
      ..vipSupport = (json['vipSupport'] as num?)?.toInt()
      ..begging = (json['begging'] as num?)?.toInt()
      ..rechargeDrawCount = (json['rechargeDrawCount'] as num?)?.toInt()
      ..inviterCode = json['inviterCode'] as String?
      ..boundGoogle = (json['boundGoogle'] as num?)?.toInt()
      ..hasPassword = (json['hasPassword'] as num?)?.toInt()
      ..isNewUser = (json['isNewUser'] as num?)?.toInt()
      ..prettyUsername = json['prettyUsername'] as String?
      ..prettyLevel = (json['prettyLevel'] as num?)?.toInt()
      ..prettyEndTime = (json['prettyEndTime'] as num?)?.toInt();

Map<String, dynamic> _$AppInfoDetailEntityToJson(
        AppInfoDetailEntity instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'auth': instance.auth,
      'intro': instance.intro,
      'portrait': instance.portrait,
      'nickname': instance.nickname,
      'areaCode': instance.areaCode,
      'status': instance.status,
      'isDoNotDisturb': instance.isDoNotDisturb,
      'createdAt': instance.createdAt,
      'created': instance.created,
      'isOnline': instance.isOnline,
      'isSignIn': instance.isSignIn,
      'propCount': instance.propCount,
      'callCardCount': instance.callCardCount,
      'callCardUsedCount': instance.callCardUsedCount,
      'callCardDuration': instance.callCardDuration,
      'releaseTime': instance.releaseTime,
      'gender': instance.gender,
      'country': instance.country,
      'connectRate': instance.connectRate,
      'birthday': instance.birthday,
      'expLevel': instance.expLevel,
      'userBalance': instance.userBalance,
      'startBirthday': instance.startBirthday,
      'timeBirthday': instance.timeBirthday,
      'stateGender': instance.stateGender,
      'isVip': instance.isVip,
      'vipSignIn': instance.vipSignIn,
      'vipEndTime': instance.vipEndTime,
      'vipSupport': instance.vipSupport,
      'begging': instance.begging,
      'rechargeDrawCount': instance.rechargeDrawCount,
      'inviterCode': instance.inviterCode,
      'boundGoogle': instance.boundGoogle,
      'hasPassword': instance.hasPassword,
      'isNewUser': instance.isNewUser,
      'prettyUsername': instance.prettyUsername,
      'prettyLevel': instance.prettyLevel,
      'prettyEndTime': instance.prettyEndTime,
    };

AppBalanceBeanEntity _$AppBalanceBeanEntityFromJson(
        Map<String, dynamic> json) =>
    AppBalanceBeanEntity()
      ..userId = (json['userId'] as num?)?.toInt()
      ..totalRecharge = (json['totalRecharge'] as num?)?.toInt()
      ..totalDiamonds = (json['totalDiamonds'] as num?)?.toInt()
      ..remainDiamonds = (json['remainDiamonds'] as num?)?.toInt()
      ..freeDiamonds = (json['freeDiamonds'] as num?)?.toInt()
      ..freeMsgCount = (json['freeMsgCount'] as num?)?.toInt()
      ..expLevel = (json['expLevel'] as num?)?.toInt()
      ..createdAt = (json['createdAt'] as num?)?.toInt()
      ..updatedAt = (json['updatedAt'] as num?)?.toInt();

Map<String, dynamic> _$AppBalanceBeanEntityToJson(
        AppBalanceBeanEntity instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'totalRecharge': instance.totalRecharge,
      'totalDiamonds': instance.totalDiamonds,
      'remainDiamonds': instance.remainDiamonds,
      'freeDiamonds': instance.freeDiamonds,
      'freeMsgCount': instance.freeMsgCount,
      'expLevel': instance.expLevel,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
