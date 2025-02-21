import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/Reservation.dart';
import '../../../data/repositories/reservations_repository.dart';
import '../../../data/providers/reservations_provider.dart';

class CartController extends GetxController {
  final ReservationsRepository repository = ReservationsRepository(
    provider: ReservationsProvider(),
  );

  final RxList<Reservation> cartItems = <Reservation>[].obs;
  final RxString couponCode = ''.obs;
  final RxBool isValidCoupon = false.obs;
  final RxBool isProcessing = false.obs;
  final Rx<double> discountPercentage = 0.0.obs;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  double get discountAmount => totalPrice * discountPercentage.value;

  double get finalPrice => totalPrice - discountAmount;

  int get itemCount => cartItems.length;

  void addItem(Reservation reservation) {
    if (!cartItems.any((item) => item.id == reservation.id)) {
      cartItems.add(reservation);
    }
  }

  void removeItem(Reservation reservation) {
    cartItems.removeWhere((item) => item.id == reservation.id);
  }

  void clearCart() {
    cartItems.clear();
    resetCoupon();
  }

  void resetCoupon() {
    couponCode.value = '';
    isValidCoupon.value = false;
    discountPercentage.value = 0.0;
  }

  Future<void> validateCoupon(String code) async {
    if (code.isEmpty) return;

    try {
      isProcessing.value = true;
      final isValid = await repository.validateCoupon(code);

      isValidCoupon.value = isValid;

      if (isValid) {
        couponCode.value = code;
        discountPercentage.value = repository.getDiscountPercentage(code);

        _showDiscountPopup(true);
      } else {
        _showDiscountPopup(false);
      }
    } catch (e) {
      print('Error validating coupon: $e');
      isValidCoupon.value = false;
      _showDiscountPopup(false);
    } finally {
      isProcessing.value = false;
    }
  }

  void _showDiscountPopup(bool isSuccess) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Container(
          width: 300,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSuccess ? Colors.purple : Colors.red,
                    width: 2,
                  ),
                ),
                child: Icon(
                  isSuccess ? Icons.check : Icons.close,
                  color: isSuccess ? Colors.purple : Colors.red,
                  size: 40,
                ),
              ),
              SizedBox(height: 20),
              Text(
                isSuccess ? 'successfully_discount'.tr : 'coupon_not_active'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => Get.back(),
                  child: Text('done'.tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
