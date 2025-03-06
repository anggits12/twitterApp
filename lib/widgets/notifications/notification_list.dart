import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/notification_controller.dart';
import 'notification_item.dart';

class NotificationList extends StatelessWidget {
  final NotificationController controller;

  const NotificationList({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final notifications = controller.getFilteredNotifications();
        return ListView.builder(
          itemCount: notifications.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return NotificationItem(notification: notifications[index]);
          },
        );
      }),
    );
  }
}
