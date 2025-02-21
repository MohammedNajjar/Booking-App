import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../service/storageService.dart';

class SettingsController extends GetxController {

  var selectedLanguage = Locale(StorageService.getLanguage()).obs;


  var isDarkMode = StorageService.getTheme().obs;

  @override
  void onInit() {
    super.onInit();
    Get.updateLocale(selectedLanguage.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }


  void changeLanguage(String langCode) {
    selectedLanguage.value = Locale(langCode);
    StorageService.saveLanguage(langCode);
    Get.updateLocale(selectedLanguage.value);
  }


  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    StorageService.saveTheme(isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
