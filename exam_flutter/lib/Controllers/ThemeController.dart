import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
    // Save theme state
    saveThemeState();
  }

  void saveThemeState() {
    Get.storage.write('isDarkMode', isDarkMode.value);
  }

  @override
  void onInit() {
    super.onInit();
    // Load saved theme
    isDarkMode.value = Get.storage.read('isDarkMode') ?? false;
  }
}
