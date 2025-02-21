import 'package:flutter/material.dart';

import '../Controllers/BookingController.dart';
import 'package:get/get.dart';
class CartPage extends StatelessWidget {
  final BookingController bookingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'.tr),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text(
                  'Items: ${bookingController.cartItems.length}'.tr,
                )),
                TextButton(
                  onPressed: bookingController.clearCart,
                  child: Text('Clear All'.tr),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
                  () => bookingController.cartItems.isEmpty
                  ? Center(child: Text('The List is Empty'.tr))
                  : ListView.builder(
                itemCount: bookingController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = bookingController.cartItems[index];
                  return CartItemCard(item: item);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) =>
                        bookingController.couponCode.value = value,
                        decoration: InputDecoration(
                          hintText: 'Have Coupon?'.tr,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => bookingController.applyCoupon(
                        bookingController.couponCode.value,
                      ),
                      child: Text('CHECK'.tr),
                    ),
                  ],
                ),
                Obx(
                      () => Text(
                    'Total: ${bookingController.calculateTotal()} SR'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
