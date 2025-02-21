import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LocalizationController extends GetxController {
  var locale = const Locale('ar').obs;

  void toggleLanguage() {
    locale.value = locale.value.languageCode == 'ar'
        ? const Locale('en')
        : const Locale('ar');
    Get.updateLocale(locale.value);
    // Save language state
    saveLanguageState();
  }

  void saveLanguageState() {
    Get.storage.write('language', locale.value.languageCode);
  }

  @override
  void onInit() {
    super.onInit();
    // Load saved language
    String? savedLang = Get.storage.read('language');
    if (savedLang != null) {
      locale.value = Locale(savedLang);
    }
  }
}