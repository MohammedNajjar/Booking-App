import 'package:flutter/material.dart';

import '../Models/BookingModel.dart';

class BookingCard extends StatelessWidget {
  final BookingModel booking;
  final VoidCallback onAddToCart;

  const BookingCard({
    required this.booking,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            booking.imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow),
                    Text('${booking.rating}'),
                  ],
                ),
                Text(
                  booking.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(booking.location),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${booking.price} SR',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: onAddToCart,
                      child: Text('ADD TO CARD'.tr),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}