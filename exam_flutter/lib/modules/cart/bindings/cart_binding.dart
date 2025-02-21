import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    // CartController is already injected in EventsBinding
    // This binding ensures it's available if we navigate directly to cart
    if (!Get.isRegistered<CartController>()) {
      Get.put(CartController());
    }
  }
}