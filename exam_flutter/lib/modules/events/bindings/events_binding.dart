import 'package:get/get.dart';
import '../../cart/controllers/cart_controller.dart';
import '../controllers/events_controller.dart';

class EventsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
    Get.put(EventsController());
  }
}
