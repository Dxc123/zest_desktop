import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../../generated/json/app_my_info_entity.g.dart';
// /使用 json_serializable
// https://dartj.web.app/  json生成对应 model
/// 有数据模型更新要执行下面语句 =>>
/// dart run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class AppInfoDetailBaseEntity {
  AppInfoDetailBaseEntity();

  factory AppInfoDetailBaseEntity.fromJson(Map<String, dynamic> json) => $AppInfoDetailBaseEntityFromJson(json);

  int? code;
  String? message;
  int? timestamp;
  AppInfoDetailEntity? data;

  Map<String, dynamic> toJson() => $AppInfoDetailBaseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppInfoDetailEntity {
  AppInfoDetailEntity();

  factory AppInfoDetailEntity.fromJson(Map<String, dynamic> json) => $AppInfoDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $AppInfoDetailEntityToJson(this);

  int? userId;
  String? username;
  //认证状态(主播使用)
  int? auth;
  String? intro;
  String? portrait;
  String? nickname;
  //用户所在大地区
  int? areaCode;
  String? status;
  // 0,是否免打扰
  int? isDoNotDisturb;
  int? createdAt;
  //1新用户 0老用户
  int? created;
  // 0离线 1在线 2忙线
  int? isOnline;
  //是否已签到、1已签到
  int? isSignIn;
  //  所有道具数量,
  int? propCount;
  //  未使用的体验卡数量,
  int? callCardCount;
  // 已使用的体验卡数量,
  int? callCardUsedCount;
  // 体验卡时长,
  int? callCardDuration;
  //惩罚截止日期 时间戳
  int? releaseTime;
  // 性别1男2女
  int? gender;
  //国家码：如 840
  int? country;
  int? connectRate;
  //生日
  int? birthday;
  //经验值
  int? expLevel;

  AppBalanceBeanEntity? userBalance;
//  新增审核字段
  // success/fail
  String? startBirthday;
  //true/false
  bool? timeBirthday;
  // 10/0
  int? stateGender;

  // 是否vip用户:1是vip
  int? isVip;
  // vip是否已签到:1，已签到
  int? vipSignIn;
  // vip到期时间
  int? vipEndTime;
  //
  int? vipSupport;
  // 是否支持一键乞讨，0.不支持，1.支持
  int? begging;
  // 充值抽奖次数
  int? rechargeDrawCount;
  // 邀请人的邀请码
  String? inviterCode;
  // 是否绑定google账号, 0 未绑定 1 已绑定
  int? boundGoogle;
  int? hasPassword; // 是否设置过密码 0：没有 1：有
  //是否是新用户
  int? isNewUser;
  // 靓号号码
  String? prettyUsername;
  //靓号等级
  int? prettyLevel;
  //靓号到期时间
  int? prettyEndTime;
}

@JsonSerializable()
class AppBalanceBeanEntity {
  AppBalanceBeanEntity();

  factory AppBalanceBeanEntity.fromJson(Map<String, dynamic> json) => $AppBalanceBeanEntityFromJson(json);

  Map<String, dynamic> toJson() => $AppBalanceBeanEntityToJson(this);

  int? userId;
  //总充值
  int? totalRecharge;
  //总钻石
  int? totalDiamonds;
  //钻石余额
  int? remainDiamonds;
  int? freeDiamonds;
  //已发送消息条数
  int? freeMsgCount;
  //经验值
  int? expLevel;
  int? createdAt;
  int? updatedAt;

  // 0：未充值
  // 1：累计充值金额10美元以下
  // 2：累计充值金额10-20
  // 3：累计充值金额20-30
  // 4：累计充值金额30-50
  // 5：累计充值金额50-80
  // 6：累计充值金额80-120
  // 7：累计充值金额120-200
  // 8：累计充值金额200-400
  // 9: 累计充值金额400-1000
  // 10：累计充值金额>1000
  int get userLevel {
    // 美元（分）
    final int money = totalRecharge ?? 0;
    if (money <= 0) {
      return 0;
    } else if (money < 1000) {
      return 1;
    } else if (money < 2000) {
      return 2;
    } else if (money < 3000) {
      return 3;
    } else if (money < 5000) {
      return 4;
    } else if (money < 8000) {
      return 5;
    } else if (money < 12000) {
      return 6;
    } else if (money < 20000) {
      return 7;
    } else if (money < 40000) {
      return 8;
    } else if (money < 100000) {
      return 9;
    } else {
      return 10;
    }
  }
}
