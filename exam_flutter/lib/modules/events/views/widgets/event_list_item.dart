import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/Reservation.dart';
class EventListItem extends StatelessWidget {
  final Reservation reservation;
  final VoidCallback onAddToCart;

  const EventListItem({
    required this.reservation,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event Image with Price
          Stack(
            children: [
              Image.asset(
                reservation.image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (ctx, _, __) => Container(
                  height: 180,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported, size: 50),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${reservation.price.toInt()} SR',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Event Details
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Rating
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.black,
                      child: Column(
                        children: [
                          Text(
                            '${reservation.rating}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.star, color: Colors.white, size: 20),
                        ],
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 8),
                // Event Name
                Text(
                  reservation.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                // Event Location
                Text(
                  reservation.address,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                // Add to Cart Button
                Align(
                  alignment: Get.locale?.languageCode == 'ar'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: SizedBox(
                    width: 128,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: onAddToCart,
                      child: Text('add_to_card'.tr),
                    ),
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
