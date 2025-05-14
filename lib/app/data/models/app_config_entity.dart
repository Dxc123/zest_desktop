import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'app_config_entity.g.dart';

// /使用 json_serializable
// https://dartj.web.app/  json生成对应 model
/// 有数据模型更新要执行下面语句 =>>
/// dart run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class AppBaseEntity {
  AppBaseEntity();

  factory AppBaseEntity.fromJson(Map<String, dynamic> json) => _$AppBaseEntityFromJson(json);

  int? code;
  String? message;
  int? timestamp;
  dynamic data;

  Map<String, dynamic> toJson() => _$AppBaseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppConfigEntity {
  AppConfigEntity();

  factory AppConfigEntity.fromJson(Map<String, dynamic> json) => _$AppConfigEntityFromJson(json);

  int? code;
  String? message;
  int? timestamp;
  AppConfigEntityData? data;

  Map<String, dynamic> toJson() => _$AppConfigEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppConfigEntityData {
  AppConfigEntityData();

  factory AppConfigEntityData.fromJson(Map<String, dynamic> json) => _$AppConfigEntityDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigEntityDataToJson(this);

  String? aiHelp;
  int? sendMsgDiamondsPrice;
  String? appStoreWriteLink;
  @JsonKey(name: "free_message_count")
  String? freeMessageCount;
  String? email;
  String? promotionTime;
  String? whatsapp;
  String? agoraAppId;
  int? chargePrice; //收费 默认60
  bool? stopFbPurchase; // true 支付数据不上报fb
  String? scale;
  String? payScale;
  String? adjust;
  String? publicKey;
  String? leveldetailurl;
  String? discountvideourl;
  String? appUpdate;
  int? vipDailyDiamonds;
  int? matchTimes; //匹配次数，默认 10
  bool? fbLogin; //false隐藏fb登录,true 显示fb登录
  bool? stopTranslate; // true 停止翻译功能
  String? transferInfo;
  String? qrData; //二维码下载地址
  //中奖商品弹框是否一直显示  逗号分开  0,1,1  0新用户显示，1一直显示 位置（0，1，2）
  //位置3：看主播详情aib倒计时是否启用
  // 新增参数
  // 位置4：出现第一个弹框，需要的商品弹出次数，
  // 位置5：出现第二个弹框，需要的渠道弹出次数
  //位置6：出现第三个弹框，需要循环等待的秒数
  // 位置7 ：主播界面停留多少秒出现aib
  String? pddDialogDisplay;

  // 隐藏brl的google支付,逗号分开：BRL,CNY,(需要隐藏巴西谷歌支付时填写)
  String? hideCurrencyCode;
}

//  {"isShow":false,"content":" 因为... ","url":"https://baidu.com ","title":" 产品变更","type":2}
@JsonSerializable()
class AppUpdateEntity {
  AppUpdateEntity();

  factory AppUpdateEntity.fromJson(Map<String, dynamic> json) => _$AppUpdateEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AppUpdateEntityToJson(this);
  bool? isShow;

  // 1 google, 2 url
  int? type;
  String? title;
  String? content;
  String? url;
}

@JsonSerializable()
class AppPayScaleEntity {
  AppPayScaleEntity();

  factory AppPayScaleEntity.fromJson(Map<String, dynamic> json) => _$AppPayScaleEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AppPayScaleEntityToJson(this);
  double? adjustScale;
  double? facebookScale;
  double? defaultScale;
}
