import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/api_net_request/api_net_request_service.dart';
import '../../../data/models/app_config_entity.dart';
import '../../../data/models/app_my_info_entity.dart';
import '../../../data/services/app_my_info_service.dart';
import '../../../data/utils/index.dart';
import '../../../routes/app_pages.dart';

class ZtSpalshController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getConfig();
    // EasyLoading.show(status: 'loading...');
    // Future.delayed(const Duration(seconds: 2), () {
    //   EasyLoading.dismiss();
    //   Get.offAllNamed(Routes.ZE_MAIN);
    // });
  }

  // 获取config
  void getConfig() async {
    // final AppConfigEntityData? config = await DioApiService.getConfig();
    // LoggerUtils.d("获取config  = ${config?.agoraAppId ?? ""}");
    // if(config != null) {
    //   AppMyInfoService.to.config = config;
    //   if (AppMyInfoService.to.authorization?.isNotEmpty == true) {
    //     _getDetail();
    //   } else {
    //     Get.offAllNamed(Routes.ZT_LOGIN);
    //   }
    // }

    await ApiNetRequestService.requestAppConfig(
        showLoading: true,
        netSuccessCallback: (AppConfigEntity config, originData) {
          if (config.data != null) {
            LoggerUtils.d("获取config.agoraAppId  = ${config.data?.agoraAppId ?? ""}");
            AppMyInfoService.to.config = config.data;
            if (AppMyInfoService.to.authorization?.isNotEmpty == true) {
              _getDetail();
            } else {
              Get.offAllNamed(Routes.ZT_LOGIN);
            }
          }
        },
        netErrorCallback: (e) {
          LoggerUtils.d("e = $e");
        });
  }
}

void _getDetail() {
  // DioClient().post<AppInfoDetailEntity>(DiaApiUrl.userInfoApi, errCallback: (AppErrorEntity err) {
  //   LoadingUtils.showToast(err.toString());
  // }, showLoading: true).then((AppInfoDetailEntity value) {
  //   getDetailToMain(value);
  // });

  ApiNetRequestService.requestDetailUserInfoApi(
    showLoading: true,
    netSuccessCallback: (data, originData) {
      if(data.data !=null){
        getDetailToMain(data.data!);
      }
    },
    netErrorCallback: (e) {},
  );
}

// 获取详情再去主页面
void getDetailToMain(AppInfoDetailEntity value) {
  //线上版本
  if (value.startBirthday == "fail" && value.timeBirthday == false && value.stateGender == 0) {
    AppMyInfoService.to.requestLastDetailUserData();
    Get.offAllNamed(Routes.ZE_MAIN);
  } else {
    AppMyInfoService.to.requestLastDetailUserData();
    Get.offAllNamed(Routes.ZE_MAIN);
  }
}
