import 'package:zest_desktop/generated/json/base/json_convert_content.dart';
import 'package:zest_desktop/app/data/models/app_config_entity.dart';
import 'package:json_annotation/json_annotation.dart';


AppBaseEntity $AppBaseEntityFromJson(Map<String, dynamic> json) {
  final AppBaseEntity appBaseEntity = AppBaseEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    appBaseEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    appBaseEntity.message = message;
  }
  final int? timestamp = jsonConvert.convert<int>(json['timestamp']);
  if (timestamp != null) {
    appBaseEntity.timestamp = timestamp;
  }
  final dynamic data = json['data'];
  if (data != null) {
    appBaseEntity.data = data;
  }
  return appBaseEntity;
}

Map<String, dynamic> $AppBaseEntityToJson(AppBaseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['timestamp'] = entity.timestamp;
  data['data'] = entity.data;
  return data;
}

extension AppBaseEntityExtension on AppBaseEntity {
  AppBaseEntity copyWith({
    int? code,
    String? message,
    int? timestamp,
    dynamic data,
  }) {
    return AppBaseEntity()
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..timestamp = timestamp ?? this.timestamp
      ..data = data ?? this.data;
  }
}

AppConfigEntity $AppConfigEntityFromJson(Map<String, dynamic> json) {
  final AppConfigEntity appConfigEntity = AppConfigEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    appConfigEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    appConfigEntity.message = message;
  }
  final int? timestamp = jsonConvert.convert<int>(json['timestamp']);
  if (timestamp != null) {
    appConfigEntity.timestamp = timestamp;
  }
  final AppConfigEntityData? data = jsonConvert.convert<AppConfigEntityData>(json['data']);
  if (data != null) {
    appConfigEntity.data = data;
  }
  return appConfigEntity;
}

Map<String, dynamic> $AppConfigEntityToJson(AppConfigEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['timestamp'] = entity.timestamp;
  data['data'] = entity.data?.toJson();
  return data;
}

extension AppConfigEntityExtension on AppConfigEntity {
  AppConfigEntity copyWith({
    int? code,
    String? message,
    int? timestamp,
    AppConfigEntityData? data,
  }) {
    return AppConfigEntity()
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..timestamp = timestamp ?? this.timestamp
      ..data = data ?? this.data;
  }
}

AppConfigEntityData $AppConfigEntityDataFromJson(Map<String, dynamic> json) {
  final AppConfigEntityData appConfigEntityData = AppConfigEntityData();
  final String? aiHelp = jsonConvert.convert<String>(json['aiHelp']);
  if (aiHelp != null) {
    appConfigEntityData.aiHelp = aiHelp;
  }
  final int? sendMsgDiamondsPrice = jsonConvert.convert<int>(json['sendMsgDiamondsPrice']);
  if (sendMsgDiamondsPrice != null) {
    appConfigEntityData.sendMsgDiamondsPrice = sendMsgDiamondsPrice;
  }
  final String? appStoreWriteLink = jsonConvert.convert<String>(json['appStoreWriteLink']);
  if (appStoreWriteLink != null) {
    appConfigEntityData.appStoreWriteLink = appStoreWriteLink;
  }
  final String? freeMessageCount = jsonConvert.convert<String>(json['freeMessageCount']);
  if (freeMessageCount != null) {
    appConfigEntityData.freeMessageCount = freeMessageCount;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    appConfigEntityData.email = email;
  }
  final String? promotionTime = jsonConvert.convert<String>(json['promotionTime']);
  if (promotionTime != null) {
    appConfigEntityData.promotionTime = promotionTime;
  }
  final String? whatsapp = jsonConvert.convert<String>(json['whatsapp']);
  if (whatsapp != null) {
    appConfigEntityData.whatsapp = whatsapp;
  }
  final String? agoraAppId = jsonConvert.convert<String>(json['agoraAppId']);
  if (agoraAppId != null) {
    appConfigEntityData.agoraAppId = agoraAppId;
  }
  final int? chargePrice = jsonConvert.convert<int>(json['chargePrice']);
  if (chargePrice != null) {
    appConfigEntityData.chargePrice = chargePrice;
  }
  final bool? stopFbPurchase = jsonConvert.convert<bool>(json['stopFbPurchase']);
  if (stopFbPurchase != null) {
    appConfigEntityData.stopFbPurchase = stopFbPurchase;
  }
  final String? scale = jsonConvert.convert<String>(json['scale']);
  if (scale != null) {
    appConfigEntityData.scale = scale;
  }
  final String? payScale = jsonConvert.convert<String>(json['payScale']);
  if (payScale != null) {
    appConfigEntityData.payScale = payScale;
  }
  final String? adjust = jsonConvert.convert<String>(json['adjust']);
  if (adjust != null) {
    appConfigEntityData.adjust = adjust;
  }
  final String? publicKey = jsonConvert.convert<String>(json['publicKey']);
  if (publicKey != null) {
    appConfigEntityData.publicKey = publicKey;
  }
  final String? leveldetailurl = jsonConvert.convert<String>(json['leveldetailurl']);
  if (leveldetailurl != null) {
    appConfigEntityData.leveldetailurl = leveldetailurl;
  }
  final String? discountvideourl = jsonConvert.convert<String>(json['discountvideourl']);
  if (discountvideourl != null) {
    appConfigEntityData.discountvideourl = discountvideourl;
  }
  final String? appUpdate = jsonConvert.convert<String>(json['appUpdate']);
  if (appUpdate != null) {
    appConfigEntityData.appUpdate = appUpdate;
  }
  final int? vipDailyDiamonds = jsonConvert.convert<int>(json['vipDailyDiamonds']);
  if (vipDailyDiamonds != null) {
    appConfigEntityData.vipDailyDiamonds = vipDailyDiamonds;
  }
  final int? matchTimes = jsonConvert.convert<int>(json['matchTimes']);
  if (matchTimes != null) {
    appConfigEntityData.matchTimes = matchTimes;
  }
  final bool? fbLogin = jsonConvert.convert<bool>(json['fbLogin']);
  if (fbLogin != null) {
    appConfigEntityData.fbLogin = fbLogin;
  }
  final bool? stopTranslate = jsonConvert.convert<bool>(json['stopTranslate']);
  if (stopTranslate != null) {
    appConfigEntityData.stopTranslate = stopTranslate;
  }
  final String? transferInfo = jsonConvert.convert<String>(json['transferInfo']);
  if (transferInfo != null) {
    appConfigEntityData.transferInfo = transferInfo;
  }
  final String? qrData = jsonConvert.convert<String>(json['qrData']);
  if (qrData != null) {
    appConfigEntityData.qrData = qrData;
  }
  final String? pddDialogDisplay = jsonConvert.convert<String>(json['pddDialogDisplay']);
  if (pddDialogDisplay != null) {
    appConfigEntityData.pddDialogDisplay = pddDialogDisplay;
  }
  final String? hideCurrencyCode = jsonConvert.convert<String>(json['hideCurrencyCode']);
  if (hideCurrencyCode != null) {
    appConfigEntityData.hideCurrencyCode = hideCurrencyCode;
  }
  return appConfigEntityData;
}

Map<String, dynamic> $AppConfigEntityDataToJson(AppConfigEntityData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['aiHelp'] = entity.aiHelp;
  data['sendMsgDiamondsPrice'] = entity.sendMsgDiamondsPrice;
  data['appStoreWriteLink'] = entity.appStoreWriteLink;
  data['freeMessageCount'] = entity.freeMessageCount;
  data['email'] = entity.email;
  data['promotionTime'] = entity.promotionTime;
  data['whatsapp'] = entity.whatsapp;
  data['agoraAppId'] = entity.agoraAppId;
  data['chargePrice'] = entity.chargePrice;
  data['stopFbPurchase'] = entity.stopFbPurchase;
  data['scale'] = entity.scale;
  data['payScale'] = entity.payScale;
  data['adjust'] = entity.adjust;
  data['publicKey'] = entity.publicKey;
  data['leveldetailurl'] = entity.leveldetailurl;
  data['discountvideourl'] = entity.discountvideourl;
  data['appUpdate'] = entity.appUpdate;
  data['vipDailyDiamonds'] = entity.vipDailyDiamonds;
  data['matchTimes'] = entity.matchTimes;
  data['fbLogin'] = entity.fbLogin;
  data['stopTranslate'] = entity.stopTranslate;
  data['transferInfo'] = entity.transferInfo;
  data['qrData'] = entity.qrData;
  data['pddDialogDisplay'] = entity.pddDialogDisplay;
  data['hideCurrencyCode'] = entity.hideCurrencyCode;
  return data;
}

extension AppConfigEntityDataExtension on AppConfigEntityData {
  AppConfigEntityData copyWith({
    String? aiHelp,
    int? sendMsgDiamondsPrice,
    String? appStoreWriteLink,
    String? freeMessageCount,
    String? email,
    String? promotionTime,
    String? whatsapp,
    String? agoraAppId,
    int? chargePrice,
    bool? stopFbPurchase,
    String? scale,
    String? payScale,
    String? adjust,
    String? publicKey,
    String? leveldetailurl,
    String? discountvideourl,
    String? appUpdate,
    int? vipDailyDiamonds,
    int? matchTimes,
    bool? fbLogin,
    bool? stopTranslate,
    String? transferInfo,
    String? qrData,
    String? pddDialogDisplay,
    String? hideCurrencyCode,
  }) {
    return AppConfigEntityData()
      ..aiHelp = aiHelp ?? this.aiHelp
      ..sendMsgDiamondsPrice = sendMsgDiamondsPrice ?? this.sendMsgDiamondsPrice
      ..appStoreWriteLink = appStoreWriteLink ?? this.appStoreWriteLink
      ..freeMessageCount = freeMessageCount ?? this.freeMessageCount
      ..email = email ?? this.email
      ..promotionTime = promotionTime ?? this.promotionTime
      ..whatsapp = whatsapp ?? this.whatsapp
      ..agoraAppId = agoraAppId ?? this.agoraAppId
      ..chargePrice = chargePrice ?? this.chargePrice
      ..stopFbPurchase = stopFbPurchase ?? this.stopFbPurchase
      ..scale = scale ?? this.scale
      ..payScale = payScale ?? this.payScale
      ..adjust = adjust ?? this.adjust
      ..publicKey = publicKey ?? this.publicKey
      ..leveldetailurl = leveldetailurl ?? this.leveldetailurl
      ..discountvideourl = discountvideourl ?? this.discountvideourl
      ..appUpdate = appUpdate ?? this.appUpdate
      ..vipDailyDiamonds = vipDailyDiamonds ?? this.vipDailyDiamonds
      ..matchTimes = matchTimes ?? this.matchTimes
      ..fbLogin = fbLogin ?? this.fbLogin
      ..stopTranslate = stopTranslate ?? this.stopTranslate
      ..transferInfo = transferInfo ?? this.transferInfo
      ..qrData = qrData ?? this.qrData
      ..pddDialogDisplay = pddDialogDisplay ?? this.pddDialogDisplay
      ..hideCurrencyCode = hideCurrencyCode ?? this.hideCurrencyCode;
  }
}

AppUpdateEntity $AppUpdateEntityFromJson(Map<String, dynamic> json) {
  final AppUpdateEntity appUpdateEntity = AppUpdateEntity();
  final bool? isShow = jsonConvert.convert<bool>(json['isShow']);
  if (isShow != null) {
    appUpdateEntity.isShow = isShow;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    appUpdateEntity.type = type;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    appUpdateEntity.title = title;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    appUpdateEntity.content = content;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    appUpdateEntity.url = url;
  }
  return appUpdateEntity;
}

Map<String, dynamic> $AppUpdateEntityToJson(AppUpdateEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['isShow'] = entity.isShow;
  data['type'] = entity.type;
  data['title'] = entity.title;
  data['content'] = entity.content;
  data['url'] = entity.url;
  return data;
}

extension AppUpdateEntityExtension on AppUpdateEntity {
  AppUpdateEntity copyWith({
    bool? isShow,
    int? type,
    String? title,
    String? content,
    String? url,
  }) {
    return AppUpdateEntity()
      ..isShow = isShow ?? this.isShow
      ..type = type ?? this.type
      ..title = title ?? this.title
      ..content = content ?? this.content
      ..url = url ?? this.url;
  }
}

AppPayScaleEntity $AppPayScaleEntityFromJson(Map<String, dynamic> json) {
  final AppPayScaleEntity appPayScaleEntity = AppPayScaleEntity();
  final double? adjustScale = jsonConvert.convert<double>(json['adjustScale']);
  if (adjustScale != null) {
    appPayScaleEntity.adjustScale = adjustScale;
  }
  final double? facebookScale = jsonConvert.convert<double>(json['facebookScale']);
  if (facebookScale != null) {
    appPayScaleEntity.facebookScale = facebookScale;
  }
  final double? defaultScale = jsonConvert.convert<double>(json['defaultScale']);
  if (defaultScale != null) {
    appPayScaleEntity.defaultScale = defaultScale;
  }
  return appPayScaleEntity;
}

Map<String, dynamic> $AppPayScaleEntityToJson(AppPayScaleEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['adjustScale'] = entity.adjustScale;
  data['facebookScale'] = entity.facebookScale;
  data['defaultScale'] = entity.defaultScale;
  return data;
}

extension AppPayScaleEntityExtension on AppPayScaleEntity {
  AppPayScaleEntity copyWith({
    double? adjustScale,
    double? facebookScale,
    double? defaultScale,
  }) {
    return AppPayScaleEntity()
      ..adjustScale = adjustScale ?? this.adjustScale
      ..facebookScale = facebookScale ?? this.facebookScale
      ..defaultScale = defaultScale ?? this.defaultScale;
  }
}