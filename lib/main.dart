import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/data/common/services/app_service.dart';
import 'app/data/common/utils/loading_until.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LoadingUtils.init();
  await GetStorage.init(); // 初始化 GetStorage
  await SharedPreferences.getInstance(); // 初始化 SharedPreferences
  await Get.putAsync(() => AppService().init());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      translationsKeys: AppTranslation.translations,
      // 使用flutter_intl国际化
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    ),
  );
}
