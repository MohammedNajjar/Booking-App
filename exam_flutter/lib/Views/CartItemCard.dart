import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/BookingController.dart';
import '../Models/BookingModel.dart';

class CartItemCard extends StatelessWidget {
  final BookingModel item;

  const CartItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final BookingController controller = Get.find();

    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Image.asset(
          item.imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(item.name),
        subtitle: Text(item.location),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Implement edit functionality
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => controller.removeFromCart(item),
            ),
          ],
        ),
      ),
    );
  }
}
