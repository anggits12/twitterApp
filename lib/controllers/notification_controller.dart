import 'package:get/get.dart';
import '../data/notification_data.dart';
import '../models/notification_model.dart';

class NotificationController extends GetxController {
  final RxInt selectedTabIndex = 0.obs;
  final RxList<NotificationModel> notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadInitialNotifications();
  }

  void loadInitialNotifications() {
    notifications.assignAll(dummyNotifications);
  }

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  List<Map<String, dynamic>> getFilteredNotifications() {
    List<NotificationModel> filteredList;

    switch (selectedTabIndex.value) {
      case 0:
        filteredList = notifications;
        break;

      case 1:
        filteredList = notifications
            .where((notif) =>
        notif.mentions == null || !notif.mentions!.contains('@JHJHJJ'))
            .toList();
        break;

      case 2:
        filteredList = notifications
            .where((notif) => notif.mentions?.contains('@JHJHJJ') ?? false)
            .toList();
        break;

      default:
        filteredList = notifications;
    }

    return filteredList.map((notif) => notif.toJson()).toList();
  }

  void addNotification(NotificationModel notification) {
    notifications.insert(0, notification);
  }

  void markAsRead(int index) {
    if (index >= 0 && index < notifications.length) {
      final notification = notifications[index];
      final updatedNotification = NotificationModel(
        type: notification.type,
        title: notification.title,
        message: notification.message,
        subtitle: notification.subtitle,
        username: notification.username,
        handle: notification.handle,
        time: notification.time,
        description: notification.description,
        emoji: notification.emoji,
        mentions: notification.mentions,
        reply: notification.reply,
      );
      notifications[index] = updatedNotification;
    }
  }
}