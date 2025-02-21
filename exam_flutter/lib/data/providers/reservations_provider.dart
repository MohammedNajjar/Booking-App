import '../models/Reservation.dart';
import 'package:get/get.dart';

class ReservationsProvider extends GetConnect {
  Future<List<Reservation>> getReservations() async {
    // Simulate API call
    await Future.delayed(Duration(milliseconds: 800));

    // Return mocked data
    return [
      Reservation(
        id: '1',
        name: 'New Music Event on Dubai Botek for Valentine Day',
        location: 'Dubai Botek',
        image: 'assets/images/image.png',
        price: 500,
        rating: 4.5,
        address: 'Riyadh, Marash Tower',
        isAvailable: true,
      ),
      Reservation(
        id: '2',
        name: 'New Music Event on Dubai Botek for Valentine Day',
        location: 'Dubai Botek',
        image: 'assets/images/image31.png',
        price: 500,
        rating: 4.5,
        address: 'Riyadh, Marash Tower',
        isAvailable: true,
      ),
      Reservation(
        id: '3',
        name: 'New Music Event on Dubai Botek for Valentine Day',
        location: 'Dubai Botek',
        image: 'assets/images/image3.png',
        price: 500,
        rating: 4.5,
        address: 'Riyadh, Marash Tower',
        isAvailable: true,
      ),
    ];
  }

  Future<bool> validateCoupon(String code) async {
    // Simulate API validation
    await Future.delayed(Duration(milliseconds: 800));

    // Valid coupons
    final validCoupons = {
      'A123': 0.10, // 10% discount
      'B123': 0.20, // 20% discount
      'C123': 0.30, // 30% discount
    };

    return validCoupons.containsKey(code);
  }

  double getDiscountPercentage(String code) {
    final discounts = {
      'A123': 0.10, // 10% discount
      'B123': 0.20, // 20% discount
      'C123': 0.30, // 30% discount
    };

    return discounts[code] ?? 0.0;
  }
}
