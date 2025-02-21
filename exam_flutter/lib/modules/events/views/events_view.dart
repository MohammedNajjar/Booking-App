import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../settings/views/settings_popup.dart';
import '../controllers/events_controller.dart';
import 'widgets/event_list_item.dart';

class EventsView extends GetView<EventsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('events'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Get.dialog(SettingsPopup());
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.reservations.length,
                itemBuilder: (context, index) {
                  final reservation = controller.reservations[index];
                  return EventListItem(
                    reservation: reservation,
                    onAddToCart: () => controller.addToCart(reservation),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: controller.goToCart,
                child: Text(
                  'go_to_card'.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
