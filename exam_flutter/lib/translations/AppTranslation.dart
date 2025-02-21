import 'package:get/get.dart';
import 'ar_SA.dart';
import 'en_US.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'ar_SA': arSA,
  };
}