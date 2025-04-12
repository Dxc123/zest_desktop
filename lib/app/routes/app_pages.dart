import 'package:get/get.dart';

import '../modules/ze_discover/bindings/ze_discover_binding.dart';
import '../modules/ze_discover/views/ze_discover_view.dart';
import '../modules/ze_main/bindings/ze_main_binding.dart';
import '../modules/ze_main/views/ze_main_view.dart';
import '../modules/ze_me/bindings/ze_me_binding.dart';
import '../modules/ze_me/childern/ze_me_debouncer/bindings/ze_me_debouncer_binding.dart';
import '../modules/ze_me/childern/ze_me_debouncer/views/ze_me_debouncer_view.dart';
import '../modules/ze_me/childern/ze_me_form/bindings/ze_me_form_binding.dart';
import '../modules/ze_me/childern/ze_me_form/views/ze_me_form_view.dart';
import '../modules/ze_me/childern/ze_me_language/bindings/ze_me_language_binding.dart';
import '../modules/ze_me/childern/ze_me_language/views/ze_me_language_view.dart';
import '../modules/ze_me/childern/ze_me_river_pod/bindings/ze_me_river_pod_binding.dart';
import '../modules/ze_me/childern/ze_me_river_pod/views/ze_me_river_pod_view.dart';
import '../modules/ze_me/childern/ze_me_signals/bindings/ze_me_signals_binding.dart';
import '../modules/ze_me/childern/ze_me_signals/views/ze_me_signals_view.dart';
import '../modules/ze_me/childern/ze_me_theme/bindings/ze_me_theme_binding.dart';
import '../modules/ze_me/childern/ze_me_theme/views/ze_me_theme_view.dart';
import '../modules/ze_me/childern/ze_me_value_notifier/bindings/ze_me_value_notifier_binding.dart';
import '../modules/ze_me/childern/ze_me_value_notifier/views/ze_me_value_notifier_view.dart';
import '../modules/ze_me/views/ze_me_view.dart';
import '../modules/ze_message/bindings/ze_message_binding.dart';
import '../modules/ze_message/views/ze_message_view.dart';
import '../modules/zt_home/bindings/zt_home_binding.dart';
import '../modules/zt_home/views/zt_home_view.dart';
import '../modules/zt_login/bindings/zt_login_binding.dart';
import '../modules/zt_login/views/zt_login_view.dart';
import '../modules/zt_spalsh/bindings/zt_spalsh_binding.dart';
import '../modules/zt_spalsh/views/zt_spalsh_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ZT_SPALSH;

  static final routes = [
    GetPage(
      name: _Paths.ZT_HOME,
      page: () => const ZtHomeView(),
      binding: ZtHomeBinding(),
    ),
    GetPage(
      name: _Paths.ZT_SPALSH,
      page: () => const ZtSpalshView(),
      binding: ZtSpalshBinding(),
    ),
    GetPage(
      name: _Paths.ZT_LOGIN,
      page: () => const ZtLoginView(),
      binding: ZtLoginBinding(),
    ),
    GetPage(
      name: _Paths.ZE_ME_SIGNALS,
      page: () => const ZeMeSignalsView(),
      binding: ZeMeSignalsBinding(),
    ),
    GetPage(
      name: _Paths.ZE_ME_RIVER_POD,
      page: () => const ZeMeRiverPodView(),
      binding: ZeMeRiverPodBinding(),
    ),
    GetPage(
      name: _Paths.ZE_ME_FORM,
      page: () => const ZeMeFormView(),
      binding: ZeMeFormBinding(),
    ),
    GetPage(
      name: _Paths.ZE_ME_VALUE_NOTIFIER,
      page: () => const ZeMeValueNotifierView(),
      binding: ZeMeValueNotifierBinding(),
    ),
    GetPage(
      name: _Paths.ZE_ME_THEME,
      page: () => const ZeMeThemeView(),
      binding: ZeMeThemeBinding(),
    ),
    GetPage(
      name: _Paths.ZE_ME_DEBOUNCER,
      page: () => const ZeMeDebouncerView(),
      binding: ZeMeDebouncerBinding(),
    ),
    GetPage(
      name: _Paths.ZE_MAIN,
      page: () => const ZeMainView(),
      binding: ZeMainBinding(),
    ),
    GetPage(
      name: _Paths.ZE_ME,
      page: () => const ZeMeView(),
      binding: ZeMeBinding(),
    ),
    GetPage(
      name: _Paths.ZE_DISCOVER,
      page: () => const ZeDiscoverView(),
      binding: ZeDiscoverBinding(),
    ),
    GetPage(
      name: _Paths.ZE_ME_LANGUAGE,
      page: () => const ZeMeLanguageView(),
      binding: ZeMeLanguageBinding(),
    ),
    GetPage(
      name: _Paths.ZE_MESSAGE,
      page: () => const ZeMessageView(),
      binding: ZeMessageBinding(),
    ),
  ];
}
