import '../Models/BookingModel.dart';
import 'package:get/get.dart';
class BookingController extends GetxController {
  var bookings = <BookingModel>[].obs;
  var cartItems = <BookingModel>[].obs;
  var couponCode = ''.obs;
  var discount = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadBookings();
  }

  void loadBookings() {
    bookings.value = [
      BookingModel(
        id: '1',
        name: 'New Music Event on Dubai Botek',
        location: 'Riyadh, Marash Tower',
        price: 500,
        imageUrl: 'assets/event1.jpg',
        rating: 4.5,
      ),
      // Add more bookings as needed
    ];
  }

  void addToCart(BookingModel booking) {
    if (booking.isVisible) {
      cartItems.add(booking);
      update();
    }
  }

  void removeFromCart(BookingModel booking) {
    cartItems.remove(booking);
    update();
  }

  void clearCart() {
    cartItems.clear();
    update();
  }

  double calculateTotal() {
    double total = cartItems.fold(0, (sum, item) => sum + item.price);
    return total - (total * discount.value);
  }

  void applyCoupon(String code) {
    switch (code) {
      case 'A123':
        discount.value = 0.10;
        Get.snackbar('نجاح', 'Successfully Discount');
        break;
      case 'B123':
        discount.value = 0.20;
        Get.snackbar('نجاح', 'Successfully Discount');
        break;
      case 'C123':
        discount.value = 0.30;
        Get.snackbar('نجاح', 'Successfully Discount');
        break;
      default:
        Get.snackbar('خطأ', 'Coupone is not active');
        discount.value = 0;
    }
    update();
  }
}
