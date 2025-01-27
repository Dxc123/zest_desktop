import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppService extends GetxService {
  static AppService get to => Get.find();
 late final SharedPreferences pref;

  Future<AppService> init() async {
   pref = await SharedPreferences.getInstance();
    return this;
  }

}
