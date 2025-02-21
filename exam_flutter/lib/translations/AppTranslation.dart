import 'package:get/get.dart';


class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'ar_SA': arSA,
  };
}

// app/translations/ar_SA.dart
final Map<String, String> arSA = {
  'events': 'الفعاليات',
  'cart': 'السلة',
  'add_to_card': 'إضافة إلى السلة',
  'go_to_card': 'الذهاب إلى السلة',
  'your_cart': 'سلة المشتريات',
  'items_added': 'العناصر المضافة',
  'clear_all': 'حذف الكل',
  'remove': 'حذف',
  'edit': 'تعديل',
  'have_coupon': 'لديك كوبون؟',
  'check': 'تحقق',
  'total_order_value': 'إجمالي قيمة الطلب',
  'successfully_discount': 'تم تطبيق الخصم بنجاح',
  'coupon_not_active': 'الكوبون غير نشط',
  'done': 'تم',
  'the_list_is_empty': 'القائمة فارغة',
};

// app/translations/en_US.dart
final Map<String, String> enUS = {
  'events': 'Events',
  'cart': 'Cart',
  'add_to_card': 'ADD TO CARD',
  'go_to_card': 'GO TO CARD',
  'your_cart': 'Your Cart',
  'items_added': 'Items added',
  'clear_all': 'Clear All',
  'remove': 'Remove',
  'edit': 'Edit',
  'have_coupon': 'Have Coupon?',
  'check': 'CHECK',
  'total_order_value': 'Total Order Value',
  'successfully_discount': 'Successfully Discount completed.',
  'coupon_not_active': 'Coupone is not active',
  'done': 'DONE',
  'the_list_is_empty': 'The List is Empty',
};