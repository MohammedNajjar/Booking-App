import 'package:get/get.dart';
import '../../../data/models/Reservation.dart';
import '../../../data/repositories/reservations_repository.dart';
import '../../../data/providers/reservations_provider.dart';
import '../../cart/controllers/cart_controller.dart';

class EventsController extends GetxController {
  final ReservationsRepository repository = ReservationsRepository(
    provider: ReservationsProvider(),
  );

  final RxList<Reservation> reservations = <Reservation>[].obs;
  final RxBool isLoading = true.obs;

  final CartController cartController = Get.find<CartController>();

  @override
  void onInit() {
    super.onInit();
    fetchReservations();
  }

  Future<void> fetchReservations() async {
    try {
      isLoading.value = true;
      final data = await repository.getReservations();
      reservations.value = data;
    } catch (e) {
      print('Error fetching reservations: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void addToCart(Reservation reservation) {
    cartController.addItem(reservation);
    Get.snackbar(
      'Success'.tr,
      'Added to cart'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void goToCart() {
    Get.toNamed('/cart');
  }
}