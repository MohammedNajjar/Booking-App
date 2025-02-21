import 'package:exam_flutter/modules/settings/views/settings_popup.dart';
import 'package:exam_flutter/routes/Routes.dart';
import 'package:get/get.dart';
import 'package:exam_flutter/modules/events/views/events_view.dart';
import 'package:exam_flutter/modules/events/bindings/events_binding.dart';
import 'package:exam_flutter/modules/cart/views/cart_view.dart';
import 'package:exam_flutter/modules/cart/bindings/cart_binding.dart';

import '../modules/settings/bindings/settings_binding.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.EVENTS,
      page: () => EventsView(),
      binding: EventsBinding(),
    ),
    GetPage(
      name: Routes.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingsPopup(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}