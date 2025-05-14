import 'dart:convert';

import 'package:get/get.dart';

import '../api/index.dart';
import '../api_net_request/api_net_request_service.dart';
import '../models/app_config_entity.dart';
import '../models/app_login_entity.dart';
import '../models/app_my_info_entity.dart';
import '../utils/index.dart';
import 'app_device_service.dart';

class AppMyInfoService extends GetxService {
  static AppMyInfoService get to => Get.find();
  //登录信息//////////////
  static const String userLoginData = 'userLoginData';
  AppConfigEntityData? config; //app config信息
  AppLoginEntityUser? userLogin;
  AppLoginEntityToken? token;
  String? enterTheSystem;
  String? authorization;

  Future<AppMyInfoService> init() async {
    _setupCacheConfigInfo();
    return this;
  }

  void clear() {
    authorization = null;
    // config = null;
    token = null;
    enterTheSystem = null;
    userLogin = null;
  }

  //设置缓存的 config信息
  void _setupCacheConfigInfo() {
    final String? str = AppDeviceService.to.prefs.getString(userLoginData);
    if ((str ?? "").isNotEmpty) {
      try {
        final AppLoginEntity login = AppLoginEntity.fromJson(jsonDecode(str ?? ""));
        setLoginData(login);
      } catch (e) {
        LoggerUtils.d("e= $e");
      }
    }
  }

  void setLoginData(AppLoginEntity theLogin) {
    token = theLogin.token;
    enterTheSystem = theLogin.enterTheSystem;
    userLogin = theLogin.user;
    authorization = token?.authorization;
    final String str = jsonEncode(theLogin.toJson());
    AppDeviceService.to.prefs.setString(userLoginData, str);
  }

  /// 用户信息相关相关/////////////////////////
  //用于监听
  final Rx<AppInfoDetailEntity> _userDetail = AppInfoDetailEntity().obs;

  /// 直接获取最近一次的用户详细信息
  AppInfoDetailEntity? get myUserData {
    return _userDetail.value;
  }

  // /// 获取用户基本信息 无则请求 有则直接返回最近一次的缓存信息
  // Future<AppInfoDetailEntity?> get detailUserData async {
  //   if (myUserData?.userId == null) {
  //     await DioClient().post<AppInfoDetailEntity>(DiaApiUrl.userInfoApi, showLoading: false, errCallback: (AppErrorEntity err) {}).then((AppInfoDetailEntity value) {
  //       LoggerUtils.d("获取个人详细信息data = $value");
  //       _userDetail(value);
  //     });
  //     return myUserData;
  //   }
  //   return myUserData;
  // }

  /// 获取最新一次的用户详细信息
  void requestLastDetailUserData({bool showLoading = false, Function? requestFinishCallBack}) {
    // DioClient().post<AppInfoDetailEntity>(DiaApiUrl.userInfoApi, showLoading: false, errCallback: (AppErrorEntity err) {
    //   requestFinishCallBack?.call();
    // }).then((AppInfoDetailEntity value) {
    //   LoggerUtils.d("获取个人详细信息data = ${value.areaCode ?? 0}");
    //   _userDetail(value);
    //   requestFinishCallBack?.call();
    // });
    ApiNetRequestService.requestDetailUserInfoApi(
      showLoading: true,
      netSuccessCallback: (data, originData) {
        if(data.data !=null){
          _userDetail(data.data!);
          requestFinishCallBack?.call();
        }
      },
      netErrorCallback: (e) {
        requestFinishCallBack?.call();
      },
    );
  }

  /// 用户是否VIP
  bool get isVIP {
    return (AppMyInfoService.to.myUserData?.isVip ?? 0) > 0;
  }

  /// 用户VIP到期时间
  int get vipEndTime {
    return (AppMyInfoService.to.myUserData?.vipEndTime ?? 0);
  }

  /// 1,vip是否已签到
  bool get vipSignIn {
    return (AppMyInfoService.to.myUserData?.vipSignIn ?? 0) > 0;
  }

  /// 抽奖次数
  int get lotteryCount {
    return AppMyInfoService.to.myUserData?.rechargeDrawCount ?? 0;
  }

  ///绑定的邀请码
  String get inviterCode {
    return AppMyInfoService.to.myUserData?.inviterCode ?? "";
  }

  /// 获取用户余额
  int get remainDiamonds {
    return AppMyInfoService.to.myUserData?.userBalance?.remainDiamonds ?? 0;
  }

  /// 获取用户总充值数
  int get totalRecharge {
    return AppMyInfoService.to.myUserData?.userBalance?.totalRecharge ?? 0;
  }

  /// 获取用户充值的等级
  int get rechargeLevel {
    return AppMyInfoService.to.myUserData?.userBalance?.userLevel ?? 0;
  }

  /// 用户是否有体验卡
  bool get haveCallCard {
    return (AppMyInfoService.to.myUserData?.callCardCount ?? 0) > 0;
  }

  /// 用户是否有钻石加成卡
  bool get haveDimondsAddCard {
    return ((AppMyInfoService.to.myUserData?.propCount ?? 0) - (AppMyInfoService.to.myUserData?.callCardCount ?? 0)) > 0;
  }

  /// 获取用户等级
  int get userLevel {
    return AppMyInfoService.to.myUserData?.userBalance?.userLevel ?? 0;
  }
}
