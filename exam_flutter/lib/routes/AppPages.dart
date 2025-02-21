import 'package:get/get.dart';

class AppPages {
  static const INITIAL = Routes.EVENTS;

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
  ];
}