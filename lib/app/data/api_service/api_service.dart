import '../models/ap_banner_entity.dart';
import '../models/api_user_Info_entity.dart';
import 'api_url.dart';
import 'api_dio_service.dart';

// 玩安卓 api请求
class ApiService {
  /// 登录
  static Future<ApiUserInfoEntity?> login({
    required String username,
    required String password,
    bool showLoading = false,
    Function(ApiUserInfoEntity, dynamic)? netSuccessCallback,
    Function(String)? netErrorCallback,
  }) async {
    final res = await DioService().post(
      ApiUrl.login,
      data: {
        "username": "daixingchuang",
        "password": "Dxc1462711230",
      },
    );
    final items = ApiUserInfoFatherEntity.fromJson(res.data).data;
    return items;
  }

  static Future logout() async {
    await DioService().get(
      ApiUrl.login,
    );
  }

  static Future<List<ApiBannerEntity>?> getBanner() async {
    final res = await DioService().get(ApiUrl.banner);
    final items = ApiBannerFatherEntity.fromJson(res.data).data;
    // final List<ApiBannerEntity> items = [];
    // for (var item in res.data) {
    //   items.add(ApiBannerEntity.fromJson(item));
    // }
    return items;
  }
}
