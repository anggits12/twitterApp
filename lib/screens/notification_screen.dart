import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/sidebar_widget.dart';

class NotificationScreen extends GetView<NotificationController> {
  NotificationScreen({Key? key}) : super(key: key) {
    Get.put(NotificationController());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: ProfileDrawer(),
        appBar: _buildAppBar(),
        body: Column(
          children: [
            _buildTabs(),
            Expanded(
              child: Obx(() => _buildNotificationList()),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leadingWidth: 56,
      leading: Builder(
        builder: (context) => IconButton(
          icon: CircleAvatar(
            backgroundImage: AssetImage("assets/akuntwt.jpg"),
            radius: 16,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 1),
        child: Text(
          'Notifikasi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.settings_outlined, color: Colors.white, size: 22),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTabs() {
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
        labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontSize: 14),
        tabs: [
          Tab(text: 'Semua'),
          Tab(text: 'Terverifikasi'),
          Tab(text: 'Sebutan'),
        ],
      ),
    );
  }

  Widget _buildNotificationList() {
    final notifications = controller.getFilteredNotifications();
    return ListView.builder(
      itemCount: notifications.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return _buildNotificationItem(notification);
      },
    );
  }

  Widget _buildNotificationItem(Map notification) {
    switch (notification['type']) {
      case 'new_post':
        return _buildNewPostNotification(notification);
      case 'menfess':
        return _buildMenfessNotification(notification);
      case 'chat':
        return _buildChatNotification(notification);
      case 'reply':
        return _buildReplyNotification(notification);
      default:
        return SizedBox();
    }
  }

  Widget _buildNewPostNotification(Map notification) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Icon(Icons.notifications, color: Colors.blue, size: 24),
      title: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 14),
          children: [
            TextSpan(
              text: notification['message'] + ' ',
              style: TextStyle(color: Colors.grey[400]),
            ),
            TextSpan(
              text: notification['title'],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      trailing: Icon(Icons.more_horiz, color: Colors.grey[600], size: 20),
    );
  }

  Widget _buildMenfessNotification(Map notification) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 2),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple[400],
            ),
            child: Icon(Icons.star, color: Colors.white, size: 16),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: TextStyle(fontSize: 14),
                    children: [
                      TextSpan(
                        text: notification['message'] + ' ',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      TextSpan(
                        text: notification['title'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                if (notification['subtitle'] != null) ...[
                  SizedBox(height: 2),
                  Text(
                    notification['subtitle'],
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          Icon(Icons.more_horiz, color: Colors.grey[600], size: 20),
        ],
      ),
    );
  }

  Widget _buildChatNotification(Map notification) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Icon(Icons.chat_bubble_outline, color: Colors.blue, size: 24),
      title: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 14),
          children: [
            TextSpan(
              text: notification['message'] + ' ',
              style: TextStyle(color: Colors.white),
            ),
            TextSpan(
              text: notification['emoji'],
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      trailing: Icon(Icons.more_horiz, color: Colors.grey[600], size: 20),
    );
  }

  Widget _buildReplyNotification(Map notification) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[900],
            child: Icon(Icons.person, color: Colors.lightBlue, size: 24),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      notification['username'] ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "${notification['handle']} • ${notification['time']}",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.more_horiz, color: Colors.grey[600], size: 20),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 14),
                    children: [
                      TextSpan(
                        text: notification['message'] ?? '',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight:
                              false ? FontWeight.normal : FontWeight.w500,
                        ),
                      ),
                      if (notification['mentions'] != null &&
                          notification['mentions'].isNotEmpty) ...[
                        TextSpan(
                          text: " " + notification['mentions'].join(' '),
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                      if (notification['reply'] != null) ...[
                        TextSpan(
                          text: "\n" + (notification['reply'] as String),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                                false ? FontWeight.normal : FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/comment.svg",
                          width: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "0",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/repeat.svg",
                          width: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "0",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/like.svg",
                          width: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "0",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/impressions.svg",
                          width: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "0",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Icon(Icons.bookmark_border, color: Colors.grey),
                    Icon(Icons.share, color: Colors.grey),
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
