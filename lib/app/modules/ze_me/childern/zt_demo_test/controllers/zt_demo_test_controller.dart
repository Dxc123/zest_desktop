import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../../data/api_net_request/api_net_request_service.dart';
import '../../../../../data/api_retrofit/api_client.dart';
import '../../../../../data/api_retrofit/api_client_service.dart';
import '../../../../../data/api_service/api_service.dart';
import '../../../../../data/models/ap_banner_entity.dart';
import '../../../../../data/models/api_user_Info_entity.dart';
import '../../../../../data/utils/log_utils.dart';

class ZtDemoTestController extends GetxController {
  //TODO: Implement ZtDemoTestController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void apiLogin() async {
    // final ApiUserInfoEntity? userInfo = await ApiService.login(
    //   username: "daixingchuang",
    //   password: "Dxc1462711230",
    // );
    // LoggerUtils.d("userInfo = ${userInfo?.nickname ?? ""}");

    ApiClientService.client()
        .login(
      "daixingchuang",
      "Dxc1462711230",
    )
        .then((ApiUserInfoFatherEntity? value) {
      LoggerUtils.d("value = ${value?.data?.nickname ?? ""}");
    });
  }

  void apiBanner() async {
    final List<ApiBannerEntity>? banners = await ApiService.getBanner();
    LoggerUtils.d("banners = ${banners?.length ?? ""}");
  }

  void apiHomePageArticle() {}

  void getAppConfig() {
    ApiNetRequestService.requestAppConfig(
      netSuccessCallback: (data, originData) {},
      netErrorCallback: (e) {},
    );
  }
}
