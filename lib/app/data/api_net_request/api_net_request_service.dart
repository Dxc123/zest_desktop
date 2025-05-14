import '../models/app_config_entity.dart';
import '../models/app_login_entity.dart';
import '../models/app_my_info_entity.dart';
import 'api_net_request.dart';
import 'api_net_request_url.dart';

abstract class ApiNetRequestService {
  /// 获取App 初始化Config配置
  static requestAppConfig({
    bool showLoading = false,
    required Function(AppConfigEntity, dynamic)? netSuccessCallback,
    required Function(String)? netErrorCallback,
  }) async {
    await ApiNetRequestManager.request<AppConfigEntity>(
      ApiNetRequestUrl.configApi,
      showLoading: showLoading,
      showNetError: false,
      netSuccessCallback: netSuccessCallback,
      netErrorCallback: netErrorCallback,
    );
  }

  // //账号登录
  static requestAccountLogin({
    String? username,
    String? password,
    bool showLoading = true,
    bool showNetError = true,
    Function(AppLoginBaseEntity, dynamic)? netSuccessCallback,
    Function(String)? netErrorCallback,
  }) async {
    String requestApiUrl = "";
    final Map para = {};
    requestApiUrl = ApiNetRequestUrl.accountLogin;
    para["username"] = username ?? "";
    para["password"] = password ?? "";
    await ApiNetRequestManager.request<AppLoginBaseEntity>(
      requestApiUrl,
      data: para,
      showLoading: showLoading,
      showNetError: showNetError,
      netSuccessCallback: netSuccessCallback,
      netErrorCallback: netErrorCallback,
    );
  }

  /// 获取用户详细信息信息
  static requestDetailUserInfoApi({
    bool showLoading = true,
    Function(AppInfoDetailBaseEntity, dynamic)? netSuccessCallback,
    Function(String)? netErrorCallback,
  }) async {
    await ApiNetRequestManager.request<AppInfoDetailBaseEntity>(
      ApiNetRequestUrl.userInfoApi,
      showLoading: showLoading,
      netSuccessCallback: netSuccessCallback,
      netErrorCallback: netErrorCallback,
    );
  }

// /// 注销当前用户的账号
// static requestDeleteCurrentAccount(
//     {bool showLoading = false,
//     Function(ApiNetResponseEntity, dynamic)? netSuccessCallback,
//     Function(String)? netErrorCallback}) async {
//   await ApiNetRequestManager.request<ApiNetResponseEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.delete_current_account,
//       showLoad: showLoading, netSuccessCallback: netSuccessCallback, netErrorCallback: netErrorCallback);
// }

//
// //账号登注册
// static requestAccountRegist(
//     {String? username,
//     String? password,
//     bool showLoading = true,
//     bool showNeterror = true,
//     Function(ApiNetResponseEntity, dynamic)? netSuccessCallback,
//     Function(String)? netErrorCallback}) async {
//   String requestApiUrl = "";
//   Map para = {};
//   requestApiUrl = Pearl_oivgp_NetRequestUrls_nZDnXGoL.auditModeRegister;
//   para["username"] = username ?? "";
//   para["password"] = password ?? "";
//   await ApiNetRequestManager.request<ApiNetResponseEntity>(requestApiUrl,
//       para: para,
//       showLoad: showLoading,
//       showNeterror: showNeterror,
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback);
// }

// /// 获取礼物列表
// static requestGiftListApi(
//     {bool showLoading = false,
//     Function(GiftDatasEntity, dynamic)? netSuccessCallback,
//     Function(String)? netErrorCallback}) async {
//   await ApiNetRequestManager.request<GiftDatasEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.gift_list_api,
//       showLoad: showLoading, netSuccessCallback: netSuccessCallback, netErrorCallback: netErrorCallback);
// }
//
// /// 赠送礼物
// static requestSendGift(
//     {required int receiverId,
//     required int quantity,
//     required int giftId,
//     bool showLoading = false,
//     Function(GiftSendEntity, dynamic)? netSuccessCallback,
//     Function(String)? netErrorCallback}) async {
//   Map para = {"quantity": quantity, "gid": giftId};
//   para["receiverId"] = receiverId;
//
//   await ApiNetRequestManager.request<GiftSendEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.send_gift_api,
//       para: para, showLoad: showLoading, netSuccessCallback: netSuccessCallback, netErrorCallback: netErrorCallback);
// }
//
// ///获取单个礼物详情
// static requestGetOneGift(
//     {required int giftId,
//     bool showLoading = false,
//     Function(GiftDetailEntity, dynamic)? netSuccessCallback,
//     Function(String)? netErrorCallback}) async {
//   await ApiNetRequestManager.request<GiftDetailEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.getOnegift + "${giftId}",
//       showLoad: showLoading, netSuccessCallback: netSuccessCallback, netErrorCallback: netErrorCallback);
// }
//
// /// 获取用户简要信息
// static requestSimpleUserInfoApi(
//     {bool showLoading = false,
//     Function(SimpleUserEntity, dynamic)? netSuccessCallback,
//     Function(String)? netErrorCallback}) async {
//   await ApiNetRequestManager.request<SimpleUserEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.user_simple_info_api,
//       showLoad: showLoading, netSuccessCallback: netSuccessCallback, netErrorCallback: netErrorCallback);
// }
//
// /// 更新用户免打扰信息
// static requestUpdateUserInfoApiIsDoNotDisturb(int isDoNotDisturb,
//     {bool showLoading = false,
//     Function(DetailUserEntity, dynamic)? netSuccessCallback,
//     Function(String)? netErrorCallback}) async {
//   await ApiNetRequestManager.request<DetailUserEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.update_user_info_api,
//       para: {"isDoNotDisturb": isDoNotDisturb},
//       showLoad: showLoading,
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback);
// }
//
// /// 更新用户昵称/个性签名
// static requestUpdateUserInfoApiWityType(int type, String content,
//     {bool showLoading = false,
//     Function(DetailUserEntity, dynamic)? netSuccessCallback,
//     Function(String)? netErrorCallback}) async {
//   if (AppNetCacheService.to.isReviewing() == false) {
//     AppLogTool.debug("线上模式下 进行敏感词校验");
//     if (type == InputType.nickname || type == InputType.intro) {
//       bool hasSenstiveWord = false;
//
//       AppNetCacheService.to.getSensitiveWords()?.forEach((element) {
//         if (element.words?.isNotEmpty == true) {
//           if (content.toLowerCase().contains(element.words!.toLowerCase()) == true) {
//             hasSenstiveWord = true;
//           }
//         }
//       });
//
//       if (hasSenstiveWord == true) {
//         showToast(Tr.tikiHasSensitiveWordsTip.tr);
//         return;
//       }
//     } else if (type == InputType.sex) {
//       if (AppStorage.userSex()?.isNotEmpty == true) {
//         showToast(Tr.tikiChangeSexLimit.tr);
//         return;
//       } else {
//         AppStorage.saveUserSex();
//       }
//     }
//   }
//
//   Map para = {};
//   switch (type) {
//     case InputType.nickname:
//       {
//         para = {"nickname": content.replaceAll(RegExp(r'\s*$'), "").replaceAll(RegExp(r"\d"), "*")};
//       }
//       break;
//     case InputType.intro:
//       {
//         para = {"intro": content.replaceAll(RegExp(r"\d"), "*")};
//       }
//       break;
//     case InputType.portrait:
//       {
//         para = {"portrait": content};
//       }
//       break;
//     case InputType.sex:
//       {
//         para = {"gender": content};
//       }
//       break;
//     case InputType.birthday:
//       {
//         para = {"birthday": content};
//       }
//       break;
//   }
//   await ApiNetRequestManager.request<DetailUserEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.update_user_info_api,
//       para: para, showLoad: showLoading, netSuccessCallback: netSuccessCallback, netErrorCallback: netErrorCallback);
// }
//

//
// /// 苹果 facebook 谷歌 登录
// static thirdLoginRequestApi(AppAuthType authType,
//     {String? token,
//     String? id,
//     String? nickname,
//     String? cover,
//     bool showLoading = true,
//     bool showNeterror = true,
//     Function(AppLoginEntity, dynamic)? netSuccessCallback,
//     Function(String)? netErrorCallback}) async {
//   String requestApiUrl = "";
//   Map para = {};
//
//   if (authType == AppAuthType.apple) {
//     requestApiUrl = Pearl_oivgp_NetRequestUrls_nZDnXGoL.apple_login_api;
//     para["identityToken"] = token ?? "";
//     para["nickname"] = nickname ?? "User";
//   } else if (authType == AppAuthType.facebook) {
//     requestApiUrl = Pearl_oivgp_NetRequestUrls_nZDnXGoL.fb_login_api;
//     para["accessToken"] = token ?? "";
//   } else if (authType == AppAuthType.google || authType == AppAuthType.numLogin) {
//     requestApiUrl = Pearl_oivgp_NetRequestUrls_nZDnXGoL.google_login_api;
//     para["id"] = id ?? "";
//     para["cover"] = cover ?? "";
//     para["token"] = token ?? "";
//     para["nickname"] = nickname ?? "";
//   } else if (authType == AppAuthType.bindGoogle) {
//     requestApiUrl = Pearl_oivgp_NetRequestUrls_nZDnXGoL.bindGoogleApi;
//     para["id"] = id ?? "";
//     para["cover"] = cover ?? "";
//     para["token"] = token ?? "";
//     para["nickname"] = nickname ?? "";
//   } else if (authType == AppAuthType.fbBindGoogleLogin) {
//     requestApiUrl = Pearl_oivgp_NetRequestUrls_nZDnXGoL.fbBindGoogle;
//     para["id"] = id ?? "";
//     para["cover"] = cover ?? "";
//     para["token"] = token ?? "";
//     para["nickname"] = nickname ?? "";
//   }
//
//   await ApiNetRequestManager.request<AppLoginEntity>(requestApiUrl,
//       para: para,
//       showLoad: showLoading,
//       showNeterror: showNeterror,
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback);
// }
//

//
//   //上传用户归因数据
//   static requestUploadAttributionData(
//       {bool showLoading = true,
//       bool showNeterror = true,
//       Function(ApiNetResponseEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     String requestApiUrl = "";
//     Map para = {
//       "trackerToken": "",
//       "trackerName": "",
//       "network": "googleplay",
//       "campaign": "",
//       "adgroup": "",
//       "creative": "",
//       "clickLabel": "",
//       "adid": "",
//       "costType": "",
//       "costAmount": '',
//       "costCurrency": "",
//     };
//     requestApiUrl = Pearl_oivgp_NetRequestUrls_nZDnXGoL.attributionData;
//     await ApiNetRequestManager.request<ApiNetResponseEntity>(requestApiUrl,
//         para: para,
//         showLoad: showLoading,
//         showNeterror: showNeterror,
//         netSuccessCallback: netSuccessCallback,
//         netErrorCallback: netErrorCallback);
//   }
//
//   /// 获取内购商品列表
//   static requestPayGoodListApi(
//       {bool showLoading = false,
//       Function(GoodPayEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<GoodPayEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.pay_good_list_api + "/1" + "/USD",
//         showLoad: showLoading, netSuccessCallback: netSuccessCallback, netErrorCallback: netErrorCallback);
//   }
//
//   // /// 获取内购商品列表 新的
//   // static requestPayGoodListApiNew(
//   //     {bool showLoading = false,
//   //     Function(NoraGoodPayEntity, dynamic)? netSuccessCallback,
//   //     Function(String)? netErrorCallback}) async {
//   //   await ApiNetRequestManager.request<NoraGoodPayEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.getCompositeProduct + "2",
//   //       showLoad: showLoading, netSuccessCallback: netSuccessCallback, netErrorCallback: netErrorCallback);
//   // }
//
//   /// 获取内购商品列表 新的 (type: 1.快捷充值，2.充值中心,3.vip商品)
//   static requestPayGoodListApiNew(
//       {int? type,
//       bool showLoading = false,
//       Function(NoraGoodPayEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<NoraGoodPayEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.getCompositeProduct + "${type ?? 2}",
//         showLoad: showLoading, netSuccessCallback: netSuccessCallback, netErrorCallback: netErrorCallback);
//   }
//
//   /// 获取S3上传信息
//   static requestS3FileUploadTokenApi(
//       {required String endType,
//       bool showLoading = true,
//       Function(S3UploadEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<S3UploadEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.s3_file_upload_api,
//         para: {"endType": endType},
//         showLoad: showLoading,
//         netSuccessCallback: netSuccessCallback,
//         netErrorCallback: netErrorCallback);
//   }
//
//   /// s3 put上传文件
//   static requestS3UploadApi(
//       {required String totalUrlPath,
//       required File file,
//       bool showLoading = true,
//       Function(ApiNetResponseEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<ApiNetResponseEntity>("",
//         totalUrlPath: totalUrlPath,
//         uploadFile: file,
//         connectTimeout: 30,
//         receiveTimeout: 30,
//         requestMethod: ApiNetRequestManager.dioPut,
//         showLoad: showLoading,
//         netSuccessCallback: netSuccessCallback,
//         netErrorCallback: netErrorCallback);
//   }
//
//   //******************订单/支付******************
//   /// 创建订单
//   static requestCreateOrder(String createPath, GoodPayData? goodPayData, GoodPayDataCommodities? good,
//       {int? anchorUserId,
//       bool showLoading = false,
//       Function(AppOrderCreateEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<AppOrderCreateEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.create_order_api,
//         para: {
//           "channelType": goodPayData?.channelType,
//           "payType": goodPayData?.payType,
//           "productCode": good?.productCode,
//           "storeCode": good?.storeCode,
//           "currencyCode": good?.currency,
//           "currencyFee": good?.currencyPrice,
//           "refereeUserId": anchorUserId,
//           "createPath": createPath
//         },
//         showLoad: showLoading,
//         netSuccessCallback: netSuccessCallback,
//         netErrorCallback: netErrorCallback);
//   }
//
//   /// 创建订单（新的）
//   static requestCreateOrderNew(
//       {String? createPath,
//       NoraPayQuickCommodite? element,
//       NoraPayQuickChannel? channel,
//       String? anchorUserId,
//       int? countryCode,
//       bool showLoading = false,
//       Function(AppOrderCreateEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<AppOrderCreateEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.create_order_api,
//         para: {
//           "channelType": channel?.channelType ?? "",
//           "payType": channel?.payType ?? -1,
//           "productCode": channel?.productCode ?? "",
//           "storeCode": channel?.storeCode ?? "",
//           "currencyCode": channel?.currency ?? "",
//           "currencyFee": channel?.currencyPrice ?? 0,
//           "refereeUserId": anchorUserId ?? "",
//           "createPath": createPath ?? "",
//           "countryCode": countryCode ?? 0,
//           "productId": channel?.productId ?? 0,
//         },
//         showLoad: showLoading,
//         netSuccessCallback: netSuccessCallback,
//         netErrorCallback: netErrorCallback);
//   }
//
//   /// 校验苹果内购验签
//   static requestVertifyApplePurchaseSign(String serverVerificationData,
//       {bool showLoading = false,
//       Function(ApiNetResponseEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<ApiNetResponseEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.app_in_app_purchase_vertify,
//         para: {"receipt": serverVerificationData},
//         showLoad: showLoading,
//         netSuccessCallback: netSuccessCallback,
//         netErrorCallback: netErrorCallback);
//   }
//
//   /// 校验google内购验签
//   static requestVertifyGooglePurchaseSign(String signature, String jsonPurchaseInfo,
//       {bool showLoading = false,
//       Function(ApiNetResponseEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<ApiNetResponseEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.app_google_purchase_vertify,
//         para: {"signature": signature, "jsonPurchaseInfo": jsonPurchaseInfo},
//         showLoad: showLoading,
//         netSuccessCallback: netSuccessCallback,
//         netErrorCallback: netErrorCallback);
//   }
//
// //aib相关
//   ///拉取ai配置
//   static requestGetAiConfig(
//       {bool showLoading = false,
//       Function(AibConfingEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<AibConfingEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.getAiConfig,
//         showLoad: showLoading,
//         showNeterror: false,
//         netSuccessCallback: netSuccessCallback,
//         netErrorCallback: netErrorCallback);
//   }
//
//   ///拉取aib主播
//   static requestGetAibAnchor(
//       {bool showLoading = false,
//       Function(AnchorDetailEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<AnchorDetailEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.getAibAnchor,
//         showLoad: showLoading,
//         showNeterror: false,
//         netSuccessCallback: netSuccessCallback,
//         netErrorCallback: netErrorCallback);
//   }
//
//   ///拉取aiv主播
//   static requestGetAivAnchor(
//       {bool showLoading = false,
//       Function(AnchorDetailEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<AnchorDetailEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.getAivAnchor,
//         showLoad: showLoading,
//         showNeterror: false,
//         netSuccessCallback: netSuccessCallback,
//         netErrorCallback: netErrorCallback);
//   }
//
//   ///获取自己的邀请码
//   static requestGetInviteCode(
//       {bool showLoading = false,
//       Function(InviteInfoEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<InviteInfoEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.getInviteInfo,
//         showLoad: showLoading, netSuccessCallback: netSuccessCallback, netErrorCallback: netErrorCallback);
//   }
//
//   ///绑定邀请码
//   static requestBindInviteCode(
//       {required String inviteCode,
//       bool showLoading = false,
//       Function(ApiNetResponseEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<ApiNetResponseEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.bindInviteCode + inviteCode,
//         showLoad: showLoading, netSuccessCallback: netSuccessCallback, netErrorCallback: netErrorCallback);
//   }
//
//   ///累加分享次数
//   static requestAccumulateShareCount(
//       {bool showLoading = false,
//       Function(ApiNetResponseEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<ApiNetResponseEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.accumulateShareCount,
//         showLoad: showLoading, netSuccessCallback: netSuccessCallback, netErrorCallback: netErrorCallback);
//   }
//
//   ///获取可选的国家列表
//   static requestGetPayCountry(
//       {bool showLoading = false,
//       Function(ChannelAreaEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<ChannelAreaEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.getPayCountry,
//         showLoad: showLoading, netSuccessCallback: netSuccessCallback, netErrorCallback: netErrorCallback);
//   }
//
//   ///获取指定国家的指定商品列表
//   static requestGetCountryProduct(
//       {required String productId,
//       required String countryCode,
//       bool showLoading = false,
//       Function(ChannelAreaProductEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<ChannelAreaProductEntity>(
//         Pearl_oivgp_NetRequestUrls_nZDnXGoL.getCountryProduct + "/${productId}/${countryCode}",
//         showLoad: showLoading,
//         netSuccessCallback: netSuccessCallback,
//         netErrorCallback: netErrorCallback);
//   }
//
//   //*******************审核模式*******************//
//   static requestReviewPopularAnchors(int page,
//       {bool showLoading = false,
//       Function(ReviewHomeEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<ReviewHomeEntity>(Pearl_oivgp_NetRequestUrls_nZDnXGoL.review_datas_api,
//         showLoad: showLoading,
//         showNeterror: false,
//         netSuccessCallback: netSuccessCallback,
//         netErrorCallback: netErrorCallback);
//   }
//
// //*******************游戏*******************//
//
//   ///获取游戏⼊⼝开关
//   static requestPlayEnterApi(
//       {bool showLoading = false,
//       Function(Pearl_q42Ob_PlayEnterEntity_YRSpQDbRY, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<Pearl_q42Ob_PlayEnterEntity_YRSpQDbRY>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.playEnterApi,
//       showLoad: showLoading,
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///购买幸运泡泡抽奖次数
//   static requestBuyBubbleCount(
//       {required int? anchorUserId,
//       required int drawCount,
//       required int locationType,
//       required int guideId,
//       bool showLoading = false,
//       Function(ApiNetResponseEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     Map para = {"drawCount": drawCount, "guideId": guideId, "locationType": locationType};
//     if (anchorUserId != null) {
//       para["anchorUserId"] = anchorUserId;
//     }
//     await ApiNetRequestManager.request<ApiNetResponseEntity>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.buyBubbleCount,
//       para: para,
//       showLoad: showLoading,
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///幸运泡泡抽奖
//   static requestBubbleAction(
//       {bool showLoading = false,
//       Function(Pearl_a3dNz_PlayBubbleEntity_rFddVlW, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<Pearl_a3dNz_PlayBubbleEntity_rFddVlW>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.bubbleAction,
//       showLoad: showLoading,
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///幸运泡泡奖品
//   static requestBubbleReward(
//       {bool showLoading = false,
//       Function(Pearl_uVqjo_PayBubbleRewardsEntity_ZkVDFoUA, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<Pearl_uVqjo_PayBubbleRewardsEntity_ZkVDFoUA>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.bubbleReward,
//       showLoad: showLoading,
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///获取幸运泡泡抽奖次数
//   static requestGetBubbleDrawCount(
//       {bool showLoading = false,
//       Function(Pearl_T3HhK_PlayBubbleInfoEntity_OKbZ82W3, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<Pearl_T3HhK_PlayBubbleInfoEntity_OKbZ82W3>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.getBubbleDrawCount,
//       showLoad: showLoading,
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///礼物卡背包
//   static requestGiftBackPackage(
//       {bool showLoading = false,
//       Function(Pearl_wo6Ri_PropLIstEntity_YFm44ly, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<Pearl_wo6Ri_PropLIstEntity_YFm44ly>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.giftBackPackage,
//       showLoad: showLoading,
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///森林舞会下注
//   ///animalTypes 必填，投注动物
//   ///diamonds 必填，每个动物投注的钻⽯数
//   ///locationType 必填，打开位置，1.主播相关⻚⾯，2.语⾳房，3.其他
//   ///anchorUserId 选填，locationType=1或者2的时候必填，主播id
//   static requestPlayWheelChipApi(
//       {required List<Map<String, int?>> animalTypes,
//       required int locationType,
//       required int? anchorUserId,
//       required int guideId,
//       bool showLoading = false,
//       Function(Pearl_wo6Ri_PropLIstEntity_YFm44ly, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<Pearl_wo6Ri_PropLIstEntity_YFm44ly>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.playWheelChipApi,
//       showLoad: showLoading,
//       para: {
//         "details": animalTypes,
//         "guideId": guideId,
//         "locationType": locationType,
//         "anchorUserId": anchorUserId,
//       },
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///获取森林舞会规则
//   static requestPlayWheelRuleApi(
//       {bool showLoading = false,
//       Function(NetDataStringEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<NetDataStringEntity>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.playWheelRule,
//       showLoad: showLoading,
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///幸运数字下注
//   ///animalTypes 必填，投注动物
//   ///diamonds 必填，每个动物投注的钻⽯数
//   ///locationType 必填，打开位置，1.主播相关⻚⾯，2.语⾳房，3.其他
//   ///anchorUserId 选填，locationType=1或者2的时候必填，主播id
//   static requestPlayRollChipApi(
//       {required List<Map<String, int?>> numberSum,
//       required int locationType,
//       required int? anchorUserId,
//       required int guideId,
//       bool showLoading = false,
//       Function(Pearl_wo6Ri_PropLIstEntity_YFm44ly, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<Pearl_wo6Ri_PropLIstEntity_YFm44ly>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.playRollChipApi,
//       showLoad: showLoading,
//       para: {
//         "details": numberSum,
//         "guideId": guideId,
//         "locationType": locationType,
//         "anchorUserId": anchorUserId,
//       },
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///获取幸运数字规则
//   static requestPlayRollRuleApi(
//       {bool showLoading = false,
//       Function(Pearl_Ip3Rf_PlayRollRuleEntity_CkSNzBt, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<Pearl_Ip3Rf_PlayRollRuleEntity_CkSNzBt>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.playRollRule,
//       showLoad: showLoading,
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///获取幸运数字记录
//   static requestPlayRollRecordApi(int page,
//       {int pageSize = 10,
//       bool showLoading = false,
//       Function(Pearl_yPLQI_PlayRollRecordEntity_PUaHC4OBf, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<Pearl_yPLQI_PlayRollRecordEntity_PUaHC4OBf>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.playRollRecord,
//       showLoad: showLoading,
//       para: {
//         "page": page,
//         "pageSize": pageSize,
//       },
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///赛⻋下注
//   ///racingS 必填，投注赛⻋
//   ///diamonds 必填，每个赛⻋投注的钻⽯数
//   ///locationType 必填，打开位置，1.主播相关⻚⾯，2.语⾳房，3.其他
//   ///anchorUserId 选填，locationType=1或者2的时候必填，主播id
//   static requestPlayRacingChipApi(
//       {required List<Map<String, int?>> racingS,
//       required int locationType,
//       required int? anchorUserId,
//       required int guideId,
//       bool showLoading = false,
//       Function(Pearl_wo6Ri_PropLIstEntity_YFm44ly, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<Pearl_wo6Ri_PropLIstEntity_YFm44ly>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.playRacingChipApi,
//       showLoad: showLoading,
//       para: {
//         "details": racingS,
//         "guideId": guideId,
//         "locationType": locationType,
//         "anchorUserId": anchorUserId,
//       },
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///赛⻋指定路段对⻋辆进⾏排序
//   static requestPlayRacingCarSpeedSortApi(
//       {required int roadType,
//       bool showLoading = false,
//       Function(Pearl_uENho_PlayRacingCarSortEntity_uv8i0n, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<Pearl_uENho_PlayRacingCarSortEntity_uv8i0n>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.playRacingCarSpeedSortApi + "/$roadType",
//       showLoad: showLoading,
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///所有赛⻋开奖记录
//   static requestPlayRacingAllRecordApi(int page,
//       {int pageSize = 10,
//       bool showLoading = false,
//       Function(Pearl_RulKi_PlayRacingRecordEntity_phBLBdDo, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<Pearl_RulKi_PlayRacingRecordEntity_phBLBdDo>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.playRacingRecord,
//       showLoad: showLoading,
//       para: {
//         "page": page,
//         "pageSize": pageSize,
//       },
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///当前⽤户赛⻋开奖记录
//   static requestPlayRacingPersonalRecordApi(int page,
//       {int pageSize = 10,
//       bool showLoading = false,
//       Function(Pearl_RulKi_PlayRacingRecordEntity_phBLBdDo, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<Pearl_RulKi_PlayRacingRecordEntity_phBLBdDo>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.playRacingPersonalRecord,
//       showLoad: showLoading,
//       para: {"page": page, "pageSize": pageSize},
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///获取赛⻋规则
//   static requestPlayRacingRuleApi(
//       {bool showLoading = false,
//       Function(Pearl_HUqPz_PlayRacingHelpEntity_RkAT7d1, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<Pearl_HUqPz_PlayRacingHelpEntity_RkAT7d1>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.playRacingRule,
//       showLoad: showLoading,
//       showNeterror: false,
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///赛⻋⻋辆综合信息
//   static requestPlayRacingCarDetailApi(
//       {bool showLoading = false,
//       Function(Pearl_dnOzw_PlayRacingCarDetailEntity_XSelb, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<Pearl_dnOzw_PlayRacingCarDetailEntity_XSelb>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.playRacingCarDetail,
//       showLoad: showLoading,
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
//
//   ///游戏埋点
//   /// probeType 埋点类型 0.游戏展示，2.游戏点击，3.游戏内充值弹框
//   /// guideId 0:0,1,2,3 -0 ⽤户⾃⼰点 -1这⾥有很多钻⽯冒泡 -2获奖信息冒泡 -3⾸⻚
//   ///滑动三次打开 -4banner
//   /// gameId 0-⽓泡 1-森林舞会 2-幸运数字 3-赛⻋
//   static requestGameProbeApi(
//       {required int probeType,
//       required int guideId,
//       int? gameId,
//       bool showLoading = false,
//       Function(NetDataStringEntity, dynamic)? netSuccessCallback,
//       Function(String)? netErrorCallback}) async {
//     await ApiNetRequestManager.request<NetDataStringEntity>(
//       Pearl_oivgp_NetRequestUrls_nZDnXGoL.gameProbe,
//       showLoad: showLoading,
//       showNeterror: false,
//       para: {
//         "probeType": probeType,
//         "guideId": guideId,
//         "gameId": gameId,
//       },
//       netSuccessCallback: netSuccessCallback,
//       netErrorCallback: netErrorCallback,
//     );
//   }
}
