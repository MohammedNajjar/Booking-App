import '../models/Reservation.dart';
import '../providers/reservations_provider.dart';

class ReservationsRepository {
  final ReservationsProvider provider;

  ReservationsRepository({required this.provider});

  Future<List<Reservation>> getReservations() async {
    return await provider.getReservations();
  }

  Future<bool> validateCoupon(String code) async {
    return await provider.validateCoupon(code);
  }

  double getDiscountPercentage(String code) {
    return provider.getDiscountPercentage(code);
  }
}