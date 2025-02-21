import 'package:get_storage/get_storage.dart';

class StorageService {
  static final _box = GetStorage();

  static void saveTheme(bool isDark) => _box.write('isDarkMode', isDark);
  static bool getTheme() => _box.read('isDarkMode') ?? false;

  static void saveLanguage(String langCode) => _box.write('language', langCode);
  static String getLanguage() => _box.read('language') ?? 'ar';
}
