import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:exam_flutter/Views/HomePage.dart';
void main() async {
  await Get.storage.initStorage();

  runApp(
    GetMaterialApp(
      title: 'Booking App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      translations: AppTranslations(),
      locale: const Locale('ar'),
      fallbackLocale: const Locale('en'),
      home: HomePage(),
    ),
  );
}