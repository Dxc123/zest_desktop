import 'package:get/get.dart';

import '../../../data/api_net_request/api_net_request_service.dart';
import '../../../data/models/app_login_entity.dart';
import '../../../data/services/app_my_info_service.dart';
import '../../../data/utils/log_utils.dart';

class ZtLoginController extends GetxController {
  //TODO: Implement ZtLoginController

  final RxInt count = 0.obs;

  final RxInt _age = 0.obs;

  set age(int val) => _age.value = val;

  int get age => _age.value;

  void increment() => count.value++;

  void login() async {
    // final AppLoginEntity? loginEntity = await DioApiService.accountLogin();
    // LoggerUtils.d("获取enterTheSystem  = ${loginEntity?.enterTheSystem ?? ""}");
    // if (loginEntity != null) {
    //   AppMyInfoService.to.setLoginData(loginEntity);
    // }
    // "username": "159065190",
    // "password": "123456",

    ApiNetRequestService.requestAccountLogin(
        username: "159065190",
        password: "123456",
        showLoading: false,
        netSuccessCallback: (AppLoginBaseEntity data, originData) {
          if(data.data !=null){
            AppMyInfoService.to.setLoginData(data.data!);
            
          }

        },
        netErrorCallback: (e) {
        });


  }
}
