import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:secure_application/secure_application.dart';
import 'package:signals/signals_flutter.dart';

import 'app/data/services/app_my_info_service.dart';
import 'app/data/services/app_service.dart';
import 'app/routes/app_pages.dart';
import 'core/env_config.dart';
import 'generated/locales.g.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => AppService().init());
  await Get.putAsync(() => AppMyInfoService().init());
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  await EnvConfig.loadEnv();
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(savedThemeMode: savedThemeMode),
  // ));
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, this.savedThemeMode});

  final AdaptiveThemeMode? savedThemeMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData theme22(Brightness brightness) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: brightness,
      ),
      brightness: brightness,
      useMaterial3: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => AdaptiveTheme(
          light: ThemeData.light(useMaterial3: true),
          dark: ThemeData.dark(useMaterial3: true),
          initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
          debugShowFloatingThemeButton: true,
          builder: (theme, darkTheme) {
            return ProviderScope(
              child: GetMaterialApp(
                useInheritedMediaQuery: true,
                title: "Application",
                initialRoute: AppPages.INITIAL,
                getPages: AppPages.routes,
                debugShowCheckedModeBanner: false,
                //隐藏右上角Debug标签
                theme: theme,
                darkTheme: darkTheme,
                // theme: theme22(Brightness.light),
                // darkTheme: theme22(Brightness.dark),
                // themeMode: themeMode.watch(context),
                locale: Get.deviceLocale,
                fallbackLocale: const Locale('en', 'US'),
                translationsKeys: AppTranslation.translations,
                // translations: AppTrans(),
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  S.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                navigatorObservers: const [],
                builder: (context, child) {
                  return SecureApplication(
                    nativeRemoveDelay: 800,
                    onNeedUnlock: (secureApplicationController) async {
                      return null;
                    },
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      resizeToAvoidBottomInset: GetPlatform.isIOS == true ? false : true,
                      body: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        padding: const EdgeInsetsDirectional.only(bottom: 0),
                        child: GestureDetector(
                          onTap: () {
                            if (GetPlatform.isIOS) appGlobalHideKeyboard();
                          },
                          child: EasyLoading.init()(
                            context,
                            child,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }



}

//关闭键盘
void appGlobalHideKeyboard({Function? callBack}) {
  FocusScopeNode currentFocus = FocusScope.of(Get.context!);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
    Future.delayed(const Duration(milliseconds: 250), () {
      callBack?.call();
    });
  } else {
    callBack?.call();
  }
}
