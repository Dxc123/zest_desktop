import 'package:get/get.dart';

import '../../../data/api_service/api_service.dart';
import '../../../data/models/ap_banner_entity.dart';
import '../../../data/models/api_user_Info_entity.dart';

enum UserRole {
//  添加属性
  admin('Administrator with full access', 1),
  editor('Editor with content management access', 2),
  viewer('Viewer with read-only access', 3);

  final String description;
  final int number;

  const UserRole(this.description, this.number);

//  向枚举添加方法
  bool canEdit() => this == UserRole.admin || this == UserRole.editor;
}

class ZeMeController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    print("UserRole.admin.number = ${UserRole.admin.number}");
    print("UserRole.admin.description = ${UserRole.admin.description}");

    print("UserRole.admin.canEdit() = ${UserRole.admin.canEdit()}"); // Output: true
    print("UserRole.viewer.canEdit() = ${UserRole.viewer.canEdit()}"); // Output: false
  }
  void apiLogin() async {
    final ApiUserInfoEntity? userInfo = await ApiService.login(
      username: "daixingchuang",
      password: "Dxc1462711230",
    );
    print("userInfo = ${userInfo?.nickname ?? ""}");
  }

  void apiBanner() async {
    final List<ApiBannerEntity>? banners = await ApiService.getBanner();
    print("banners = ${banners?.length ?? ""}");
  }
}
