import 'package:flutter/material.dart';

import '../Controllers/BookingController.dart';
import '../Controllers/LocalizationController.dart';
import '../Controllers/ThemeController.dart';
import 'package:get/get.dart';

import 'BookingCard.dart';
import 'CartPage.dart';
class HomePage extends StatelessWidget {
  final BookingController bookingController = Get.put(BookingController());
  final ThemeController themeController = Get.put(ThemeController());
  final LocalizationController localizationController = Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => _showSettingsDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: bookingController.bookings.length,
                itemBuilder: (context, index) {
                  final booking = bookingController.bookings[index];
                  if (!booking.isVisible) return const SizedBox.shrink();

                  return BookingCard(
                    booking: booking,
                    onAddToCart: () => bookingController.addToCart(booking),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Get.to(() => CartPage()),
            child: Text('Go to Card'.tr),
          ),
        ],
      ),
    );
  }

  void _showSettingsDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text('Settings'.tr),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Language'.tr),
              trailing: Obx(
                    () => Switch(
                  value: localizationController.locale.value.languageCode == 'ar',
                  onChanged: (_) => localizationController.toggleLanguage(),
                ),
              ),
            ),
            ListTile(
              title: Text('Dark Theme'.tr),
              trailing: Obx(
                    () => Switch(
                  value: themeController.isDarkMode.value,
                  onChanged: (_) => themeController.toggleTheme(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
