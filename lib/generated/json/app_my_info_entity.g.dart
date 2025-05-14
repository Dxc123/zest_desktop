import 'package:zest_desktop/generated/json/base/json_convert_content.dart';
import 'package:zest_desktop/app/data/models/app_my_info_entity.dart';
import 'package:json_annotation/json_annotation.dart';


AppInfoDetailBaseEntity $AppInfoDetailBaseEntityFromJson(Map<String, dynamic> json) {
  final AppInfoDetailBaseEntity appInfoDetailBaseEntity = AppInfoDetailBaseEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    appInfoDetailBaseEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    appInfoDetailBaseEntity.message = message;
  }
  final int? timestamp = jsonConvert.convert<int>(json['timestamp']);
  if (timestamp != null) {
    appInfoDetailBaseEntity.timestamp = timestamp;
  }
  final AppInfoDetailEntity? data = jsonConvert.convert<AppInfoDetailEntity>(json['data']);
  if (data != null) {
    appInfoDetailBaseEntity.data = data;
  }
  return appInfoDetailBaseEntity;
}

Map<String, dynamic> $AppInfoDetailBaseEntityToJson(AppInfoDetailBaseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['timestamp'] = entity.timestamp;
  data['data'] = entity.data?.toJson();
  return data;
}

extension AppInfoDetailBaseEntityExtension on AppInfoDetailBaseEntity {
  AppInfoDetailBaseEntity copyWith({
    int? code,
    String? message,
    int? timestamp,
    AppInfoDetailEntity? data,
  }) {
    return AppInfoDetailBaseEntity()
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..timestamp = timestamp ?? this.timestamp
      ..data = data ?? this.data;
  }
}

AppInfoDetailEntity $AppInfoDetailEntityFromJson(Map<String, dynamic> json) {
  final AppInfoDetailEntity appInfoDetailEntity = AppInfoDetailEntity();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    appInfoDetailEntity.userId = userId;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    appInfoDetailEntity.username = username;
  }
  final int? auth = jsonConvert.convert<int>(json['auth']);
  if (auth != null) {
    appInfoDetailEntity.auth = auth;
  }
  final String? intro = jsonConvert.convert<String>(json['intro']);
  if (intro != null) {
    appInfoDetailEntity.intro = intro;
  }
  final String? portrait = jsonConvert.convert<String>(json['portrait']);
  if (portrait != null) {
    appInfoDetailEntity.portrait = portrait;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    appInfoDetailEntity.nickname = nickname;
  }
  final int? areaCode = jsonConvert.convert<int>(json['areaCode']);
  if (areaCode != null) {
    appInfoDetailEntity.areaCode = areaCode;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    appInfoDetailEntity.status = status;
  }
  final int? isDoNotDisturb = jsonConvert.convert<int>(json['isDoNotDisturb']);
  if (isDoNotDisturb != null) {
    appInfoDetailEntity.isDoNotDisturb = isDoNotDisturb;
  }
  final int? createdAt = jsonConvert.convert<int>(json['createdAt']);
  if (createdAt != null) {
    appInfoDetailEntity.createdAt = createdAt;
  }
  final int? created = jsonConvert.convert<int>(json['created']);
  if (created != null) {
    appInfoDetailEntity.created = created;
  }
  final int? isOnline = jsonConvert.convert<int>(json['isOnline']);
  if (isOnline != null) {
    appInfoDetailEntity.isOnline = isOnline;
  }
  final int? isSignIn = jsonConvert.convert<int>(json['isSignIn']);
  if (isSignIn != null) {
    appInfoDetailEntity.isSignIn = isSignIn;
  }
  final int? propCount = jsonConvert.convert<int>(json['propCount']);
  if (propCount != null) {
    appInfoDetailEntity.propCount = propCount;
  }
  final int? callCardCount = jsonConvert.convert<int>(json['callCardCount']);
  if (callCardCount != null) {
    appInfoDetailEntity.callCardCount = callCardCount;
  }
  final int? callCardUsedCount = jsonConvert.convert<int>(json['callCardUsedCount']);
  if (callCardUsedCount != null) {
    appInfoDetailEntity.callCardUsedCount = callCardUsedCount;
  }
  final int? callCardDuration = jsonConvert.convert<int>(json['callCardDuration']);
  if (callCardDuration != null) {
    appInfoDetailEntity.callCardDuration = callCardDuration;
  }
  final int? releaseTime = jsonConvert.convert<int>(json['releaseTime']);
  if (releaseTime != null) {
    appInfoDetailEntity.releaseTime = releaseTime;
  }
  final int? gender = jsonConvert.convert<int>(json['gender']);
  if (gender != null) {
    appInfoDetailEntity.gender = gender;
  }
  final int? country = jsonConvert.convert<int>(json['country']);
  if (country != null) {
    appInfoDetailEntity.country = country;
  }
  final int? connectRate = jsonConvert.convert<int>(json['connectRate']);
  if (connectRate != null) {
    appInfoDetailEntity.connectRate = connectRate;
  }
  final int? birthday = jsonConvert.convert<int>(json['birthday']);
  if (birthday != null) {
    appInfoDetailEntity.birthday = birthday;
  }
  final int? expLevel = jsonConvert.convert<int>(json['expLevel']);
  if (expLevel != null) {
    appInfoDetailEntity.expLevel = expLevel;
  }
  final AppBalanceBeanEntity? userBalance = jsonConvert.convert<AppBalanceBeanEntity>(json['userBalance']);
  if (userBalance != null) {
    appInfoDetailEntity.userBalance = userBalance;
  }
  final String? startBirthday = jsonConvert.convert<String>(json['startBirthday']);
  if (startBirthday != null) {
    appInfoDetailEntity.startBirthday = startBirthday;
  }
  final bool? timeBirthday = jsonConvert.convert<bool>(json['timeBirthday']);
  if (timeBirthday != null) {
    appInfoDetailEntity.timeBirthday = timeBirthday;
  }
  final int? stateGender = jsonConvert.convert<int>(json['stateGender']);
  if (stateGender != null) {
    appInfoDetailEntity.stateGender = stateGender;
  }
  final int? isVip = jsonConvert.convert<int>(json['isVip']);
  if (isVip != null) {
    appInfoDetailEntity.isVip = isVip;
  }
  final int? vipSignIn = jsonConvert.convert<int>(json['vipSignIn']);
  if (vipSignIn != null) {
    appInfoDetailEntity.vipSignIn = vipSignIn;
  }
  final int? vipEndTime = jsonConvert.convert<int>(json['vipEndTime']);
  if (vipEndTime != null) {
    appInfoDetailEntity.vipEndTime = vipEndTime;
  }
  final int? vipSupport = jsonConvert.convert<int>(json['vipSupport']);
  if (vipSupport != null) {
    appInfoDetailEntity.vipSupport = vipSupport;
  }
  final int? begging = jsonConvert.convert<int>(json['begging']);
  if (begging != null) {
    appInfoDetailEntity.begging = begging;
  }
  final int? rechargeDrawCount = jsonConvert.convert<int>(json['rechargeDrawCount']);
  if (rechargeDrawCount != null) {
    appInfoDetailEntity.rechargeDrawCount = rechargeDrawCount;
  }
  final String? inviterCode = jsonConvert.convert<String>(json['inviterCode']);
  if (inviterCode != null) {
    appInfoDetailEntity.inviterCode = inviterCode;
  }
  final int? boundGoogle = jsonConvert.convert<int>(json['boundGoogle']);
  if (boundGoogle != null) {
    appInfoDetailEntity.boundGoogle = boundGoogle;
  }
  final int? hasPassword = jsonConvert.convert<int>(json['hasPassword']);
  if (hasPassword != null) {
    appInfoDetailEntity.hasPassword = hasPassword;
  }
  final int? isNewUser = jsonConvert.convert<int>(json['isNewUser']);
  if (isNewUser != null) {
    appInfoDetailEntity.isNewUser = isNewUser;
  }
  final String? prettyUsername = jsonConvert.convert<String>(json['prettyUsername']);
  if (prettyUsername != null) {
    appInfoDetailEntity.prettyUsername = prettyUsername;
  }
  final int? prettyLevel = jsonConvert.convert<int>(json['prettyLevel']);
  if (prettyLevel != null) {
    appInfoDetailEntity.prettyLevel = prettyLevel;
  }
  final int? prettyEndTime = jsonConvert.convert<int>(json['prettyEndTime']);
  if (prettyEndTime != null) {
    appInfoDetailEntity.prettyEndTime = prettyEndTime;
  }
  return appInfoDetailEntity;
}

Map<String, dynamic> $AppInfoDetailEntityToJson(AppInfoDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userId'] = entity.userId;
  data['username'] = entity.username;
  data['auth'] = entity.auth;
  data['intro'] = entity.intro;
  data['portrait'] = entity.portrait;
  data['nickname'] = entity.nickname;
  data['areaCode'] = entity.areaCode;
  data['status'] = entity.status;
  data['isDoNotDisturb'] = entity.isDoNotDisturb;
  data['createdAt'] = entity.createdAt;
  data['created'] = entity.created;
  data['isOnline'] = entity.isOnline;
  data['isSignIn'] = entity.isSignIn;
  data['propCount'] = entity.propCount;
  data['callCardCount'] = entity.callCardCount;
  data['callCardUsedCount'] = entity.callCardUsedCount;
  data['callCardDuration'] = entity.callCardDuration;
  data['releaseTime'] = entity.releaseTime;
  data['gender'] = entity.gender;
  data['country'] = entity.country;
  data['connectRate'] = entity.connectRate;
  data['birthday'] = entity.birthday;
  data['expLevel'] = entity.expLevel;
  data['userBalance'] = entity.userBalance?.toJson();
  data['startBirthday'] = entity.startBirthday;
  data['timeBirthday'] = entity.timeBirthday;
  data['stateGender'] = entity.stateGender;
  data['isVip'] = entity.isVip;
  data['vipSignIn'] = entity.vipSignIn;
  data['vipEndTime'] = entity.vipEndTime;
  data['vipSupport'] = entity.vipSupport;
  data['begging'] = entity.begging;
  data['rechargeDrawCount'] = entity.rechargeDrawCount;
  data['inviterCode'] = entity.inviterCode;
  data['boundGoogle'] = entity.boundGoogle;
  data['hasPassword'] = entity.hasPassword;
  data['isNewUser'] = entity.isNewUser;
  data['prettyUsername'] = entity.prettyUsername;
  data['prettyLevel'] = entity.prettyLevel;
  data['prettyEndTime'] = entity.prettyEndTime;
  return data;
}

extension AppInfoDetailEntityExtension on AppInfoDetailEntity {
  AppInfoDetailEntity copyWith({
    int? userId,
    String? username,
    int? auth,
    String? intro,
    String? portrait,
    String? nickname,
    int? areaCode,
    String? status,
    int? isDoNotDisturb,
    int? createdAt,
    int? created,
    int? isOnline,
    int? isSignIn,
    int? propCount,
    int? callCardCount,
    int? callCardUsedCount,
    int? callCardDuration,
    int? releaseTime,
    int? gender,
    int? country,
    int? connectRate,
    int? birthday,
    int? expLevel,
    AppBalanceBeanEntity? userBalance,
    String? startBirthday,
    bool? timeBirthday,
    int? stateGender,
    int? isVip,
    int? vipSignIn,
    int? vipEndTime,
    int? vipSupport,
    int? begging,
    int? rechargeDrawCount,
    String? inviterCode,
    int? boundGoogle,
    int? hasPassword,
    int? isNewUser,
    String? prettyUsername,
    int? prettyLevel,
    int? prettyEndTime,
  }) {
    return AppInfoDetailEntity()
      ..userId = userId ?? this.userId
      ..username = username ?? this.username
      ..auth = auth ?? this.auth
      ..intro = intro ?? this.intro
      ..portrait = portrait ?? this.portrait
      ..nickname = nickname ?? this.nickname
      ..areaCode = areaCode ?? this.areaCode
      ..status = status ?? this.status
      ..isDoNotDisturb = isDoNotDisturb ?? this.isDoNotDisturb
      ..createdAt = createdAt ?? this.createdAt
      ..created = created ?? this.created
      ..isOnline = isOnline ?? this.isOnline
      ..isSignIn = isSignIn ?? this.isSignIn
      ..propCount = propCount ?? this.propCount
      ..callCardCount = callCardCount ?? this.callCardCount
      ..callCardUsedCount = callCardUsedCount ?? this.callCardUsedCount
      ..callCardDuration = callCardDuration ?? this.callCardDuration
      ..releaseTime = releaseTime ?? this.releaseTime
      ..gender = gender ?? this.gender
      ..country = country ?? this.country
      ..connectRate = connectRate ?? this.connectRate
      ..birthday = birthday ?? this.birthday
      ..expLevel = expLevel ?? this.expLevel
      ..userBalance = userBalance ?? this.userBalance
      ..startBirthday = startBirthday ?? this.startBirthday
      ..timeBirthday = timeBirthday ?? this.timeBirthday
      ..stateGender = stateGender ?? this.stateGender
      ..isVip = isVip ?? this.isVip
      ..vipSignIn = vipSignIn ?? this.vipSignIn
      ..vipEndTime = vipEndTime ?? this.vipEndTime
      ..vipSupport = vipSupport ?? this.vipSupport
      ..begging = begging ?? this.begging
      ..rechargeDrawCount = rechargeDrawCount ?? this.rechargeDrawCount
      ..inviterCode = inviterCode ?? this.inviterCode
      ..boundGoogle = boundGoogle ?? this.boundGoogle
      ..hasPassword = hasPassword ?? this.hasPassword
      ..isNewUser = isNewUser ?? this.isNewUser
      ..prettyUsername = prettyUsername ?? this.prettyUsername
      ..prettyLevel = prettyLevel ?? this.prettyLevel
      ..prettyEndTime = prettyEndTime ?? this.prettyEndTime;
  }
}

AppBalanceBeanEntity $AppBalanceBeanEntityFromJson(Map<String, dynamic> json) {
  final AppBalanceBeanEntity appBalanceBeanEntity = AppBalanceBeanEntity();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    appBalanceBeanEntity.userId = userId;
  }
  final int? totalRecharge = jsonConvert.convert<int>(json['totalRecharge']);
  if (totalRecharge != null) {
    appBalanceBeanEntity.totalRecharge = totalRecharge;
  }
  final int? totalDiamonds = jsonConvert.convert<int>(json['totalDiamonds']);
  if (totalDiamonds != null) {
    appBalanceBeanEntity.totalDiamonds = totalDiamonds;
  }
  final int? remainDiamonds = jsonConvert.convert<int>(json['remainDiamonds']);
  if (remainDiamonds != null) {
    appBalanceBeanEntity.remainDiamonds = remainDiamonds;
  }
  final int? freeDiamonds = jsonConvert.convert<int>(json['freeDiamonds']);
  if (freeDiamonds != null) {
    appBalanceBeanEntity.freeDiamonds = freeDiamonds;
  }
  final int? freeMsgCount = jsonConvert.convert<int>(json['freeMsgCount']);
  if (freeMsgCount != null) {
    appBalanceBeanEntity.freeMsgCount = freeMsgCount;
  }
  final int? expLevel = jsonConvert.convert<int>(json['expLevel']);
  if (expLevel != null) {
    appBalanceBeanEntity.expLevel = expLevel;
  }
  final int? createdAt = jsonConvert.convert<int>(json['createdAt']);
  if (createdAt != null) {
    appBalanceBeanEntity.createdAt = createdAt;
  }
  final int? updatedAt = jsonConvert.convert<int>(json['updatedAt']);
  if (updatedAt != null) {
    appBalanceBeanEntity.updatedAt = updatedAt;
  }
  return appBalanceBeanEntity;
}

Map<String, dynamic> $AppBalanceBeanEntityToJson(AppBalanceBeanEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userId'] = entity.userId;
  data['totalRecharge'] = entity.totalRecharge;
  data['totalDiamonds'] = entity.totalDiamonds;
  data['remainDiamonds'] = entity.remainDiamonds;
  data['freeDiamonds'] = entity.freeDiamonds;
  data['freeMsgCount'] = entity.freeMsgCount;
  data['expLevel'] = entity.expLevel;
  data['createdAt'] = entity.createdAt;
  data['updatedAt'] = entity.updatedAt;
  return data;
}

extension AppBalanceBeanEntityExtension on AppBalanceBeanEntity {
  AppBalanceBeanEntity copyWith({
    int? userId,
    int? totalRecharge,
    int? totalDiamonds,
    int? remainDiamonds,
    int? freeDiamonds,
    int? freeMsgCount,
    int? expLevel,
    int? createdAt,
    int? updatedAt,
  }) {
    return AppBalanceBeanEntity()
      ..userId = userId ?? this.userId
      ..totalRecharge = totalRecharge ?? this.totalRecharge
      ..totalDiamonds = totalDiamonds ?? this.totalDiamonds
      ..remainDiamonds = remainDiamonds ?? this.remainDiamonds
      ..freeDiamonds = freeDiamonds ?? this.freeDiamonds
      ..freeMsgCount = freeMsgCount ?? this.freeMsgCount
      ..expLevel = expLevel ?? this.expLevel
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}