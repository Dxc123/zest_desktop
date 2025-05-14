// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppBaseEntity _$AppBaseEntityFromJson(Map<String, dynamic> json) =>
    AppBaseEntity()
      ..code = (json['code'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..timestamp = (json['timestamp'] as num?)?.toInt()
      ..data = json['data'];

Map<String, dynamic> _$AppBaseEntityToJson(AppBaseEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'timestamp': instance.timestamp,
      'data': instance.data,
    };

AppConfigEntity _$AppConfigEntityFromJson(Map<String, dynamic> json) =>
    AppConfigEntity()
      ..code = (json['code'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..timestamp = (json['timestamp'] as num?)?.toInt()
      ..data = json['data'] == null
          ? null
          : AppConfigEntityData.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$AppConfigEntityToJson(AppConfigEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'timestamp': instance.timestamp,
      'data': instance.data,
    };

AppConfigEntityData _$AppConfigEntityDataFromJson(Map<String, dynamic> json) =>
    AppConfigEntityData()
      ..aiHelp = json['aiHelp'] as String?
      ..sendMsgDiamondsPrice = (json['sendMsgDiamondsPrice'] as num?)?.toInt()
      ..appStoreWriteLink = json['appStoreWriteLink'] as String?
      ..freeMessageCount = json['free_message_count'] as String?
      ..email = json['email'] as String?
      ..promotionTime = json['promotionTime'] as String?
      ..whatsapp = json['whatsapp'] as String?
      ..agoraAppId = json['agoraAppId'] as String?
      ..chargePrice = (json['chargePrice'] as num?)?.toInt()
      ..stopFbPurchase = json['stopFbPurchase'] as bool?
      ..scale = json['scale'] as String?
      ..payScale = json['payScale'] as String?
      ..adjust = json['adjust'] as String?
      ..publicKey = json['publicKey'] as String?
      ..leveldetailurl = json['leveldetailurl'] as String?
      ..discountvideourl = json['discountvideourl'] as String?
      ..appUpdate = json['appUpdate'] as String?
      ..vipDailyDiamonds = (json['vipDailyDiamonds'] as num?)?.toInt()
      ..matchTimes = (json['matchTimes'] as num?)?.toInt()
      ..fbLogin = json['fbLogin'] as bool?
      ..stopTranslate = json['stopTranslate'] as bool?
      ..transferInfo = json['transferInfo'] as String?
      ..qrData = json['qrData'] as String?
      ..pddDialogDisplay = json['pddDialogDisplay'] as String?
      ..hideCurrencyCode = json['hideCurrencyCode'] as String?;

Map<String, dynamic> _$AppConfigEntityDataToJson(
        AppConfigEntityData instance) =>
    <String, dynamic>{
      'aiHelp': instance.aiHelp,
      'sendMsgDiamondsPrice': instance.sendMsgDiamondsPrice,
      'appStoreWriteLink': instance.appStoreWriteLink,
      'free_message_count': instance.freeMessageCount,
      'email': instance.email,
      'promotionTime': instance.promotionTime,
      'whatsapp': instance.whatsapp,
      'agoraAppId': instance.agoraAppId,
      'chargePrice': instance.chargePrice,
      'stopFbPurchase': instance.stopFbPurchase,
      'scale': instance.scale,
      'payScale': instance.payScale,
      'adjust': instance.adjust,
      'publicKey': instance.publicKey,
      'leveldetailurl': instance.leveldetailurl,
      'discountvideourl': instance.discountvideourl,
      'appUpdate': instance.appUpdate,
      'vipDailyDiamonds': instance.vipDailyDiamonds,
      'matchTimes': instance.matchTimes,
      'fbLogin': instance.fbLogin,
      'stopTranslate': instance.stopTranslate,
      'transferInfo': instance.transferInfo,
      'qrData': instance.qrData,
      'pddDialogDisplay': instance.pddDialogDisplay,
      'hideCurrencyCode': instance.hideCurrencyCode,
    };

AppUpdateEntity _$AppUpdateEntityFromJson(Map<String, dynamic> json) =>
    AppUpdateEntity()
      ..isShow = json['isShow'] as bool?
      ..type = (json['type'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..content = json['content'] as String?
      ..url = json['url'] as String?;

Map<String, dynamic> _$AppUpdateEntityToJson(AppUpdateEntity instance) =>
    <String, dynamic>{
      'isShow': instance.isShow,
      'type': instance.type,
      'title': instance.title,
      'content': instance.content,
      'url': instance.url,
    };

AppPayScaleEntity _$AppPayScaleEntityFromJson(Map<String, dynamic> json) =>
    AppPayScaleEntity()
      ..adjustScale = (json['adjustScale'] as num?)?.toDouble()
      ..facebookScale = (json['facebookScale'] as num?)?.toDouble()
      ..defaultScale = (json['defaultScale'] as num?)?.toDouble();

Map<String, dynamic> _$AppPayScaleEntityToJson(AppPayScaleEntity instance) =>
    <String, dynamic>{
      'adjustScale': instance.adjustScale,
      'facebookScale': instance.facebookScale,
      'defaultScale': instance.defaultScale,
    };
