import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class SettingsPopup extends StatelessWidget {
  final SettingsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Settings'.tr),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => DropdownButton<String>(
            value: controller.selectedLanguage.value.languageCode,
            onChanged: (String? newValue) {
              if (newValue != null) {
                controller.changeLanguage(newValue);
              }
            },
            items: const [
              DropdownMenuItem(value: 'ar', child: Text('العربية')),
              DropdownMenuItem(value: 'en', child: Text('English')),
            ],
          )),
          const SizedBox(height: 16),
          Obx(() => SwitchListTile(
            title: Text('Dark Mode'.tr),
            value: controller.isDarkMode.value,
            onChanged: (value) => controller.toggleTheme(),
          )),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('Close'.tr),
        ),
      ],
    );
  }
}
