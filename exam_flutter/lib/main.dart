import 'package:exam_flutter/modules/settings/controllers/settings_controller.dart';
import 'package:exam_flutter/routes/AppPages.dart';
import 'package:exam_flutter/theme/AppTheme.dart';
import 'package:exam_flutter/translations/AppTranslation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
void main() async {
  await GetStorage.init();
  Get.put(SettingsController()); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SettingsController settingsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      title: 'Reservations App',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: settingsController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      translations: AppTranslation(),
      locale: settingsController.selectedLanguage.value,
      fallbackLocale: Locale('en', 'US'),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ));
  }
}