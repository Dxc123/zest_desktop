import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/api/index.dart';
import '../../../data/models/app_config_entity.dart';
import '../../../data/models/app_my_info_entity.dart';
import '../../../data/services/app_my_info_service.dart';
import '../../../data/utils/_index.dart';
import '../../../routes/app_pages.dart';

class ZtSpalshController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // getConfig();
    EasyLoading.show(status: 'loading...');
    Future.delayed(const Duration(seconds: 2), () {
      EasyLoading.dismiss();
      Get.offAllNamed(Routes.ZE_MAIN);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 获取config
  void getConfig() async {
    DioClient().post<AppConfigEntityData>(DiaApiUrl.configApi, errCallback: (e) {
      LoggerUtils.d("获取config error = ${e.message}");
      LoadingUtils.showToast(e.message);
      Future.delayed(const Duration(seconds: 2), () {
        getConfig();
      });
    }).then((value) {
      LoggerUtils.d("获取config  = ${value.pddDialogDisplay ?? ""}");
      AppMyInfoService.to.config = value;
      if (AppMyInfoService.to.authorization?.isNotEmpty == true) {
        _getDetail();
      } else {
        Get.offAllNamed(Routes.ZT_LOGIN);
      }
    });
  }
}

void _getDetail() {
  DioClient().post<AppInfoDetailEntity>(DiaApiUrl.userInfoApi, errCallback: (err) {
    LoadingUtils.showToast(err.toString());
  }, showLoading: true).then((value) {
    getDetailToMain(value);
  });
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
