import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twitterapp/controllers/notification_controller.dart';

class NotificationTabs extends StatelessWidget {
  const NotificationTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[800]!, width: 0.5),
            ),
          ),
          child: TabBar(
            onTap: controller.changeTab,
            indicatorColor: Colors.blue,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(fontSize: 14),
            tabs: const [
              Tab(text: 'Semua'),
              Tab(text: 'Terverifikasi'),
              Tab(text: 'Sebutan'),
            ],
          ),
        );
      },
    );
  }
}
