import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final Map notification;

  const NotificationItem({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (notification['type']) {
      case 'new_post':
        return _buildNewPostNotification();
      case 'menfess':
        return _buildMenfessNotification();
      case 'reply':
        return _buildReplyNotification();
      default:
        return SizedBox();
    }
  }

  Widget _buildNewPostNotification() {
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

  Widget _buildMenfessNotification() {
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

  Widget _buildReplyNotification() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[800],
            backgroundImage: NetworkImage('https://via.placeholder.com/32'),
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
                          fontWeight: FontWeight.w500,
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
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
