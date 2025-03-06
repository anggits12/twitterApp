class NotificationModel {
  final String type;
  final String? title;
  final String message;
  final String? subtitle;
  final String? username;
  final String? handle;
  final String time;
  final String? description;
  final String? emoji;
  final List<String>? mentions;
  final String? reply;

  NotificationModel({
    required this.type,
    this.title,
    required this.message,
    this.subtitle,
    this.username,
    this.handle,
    required this.time,
    this.description,
    this.emoji,
    this.mentions,
    this.reply,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
      'message': message,
      'subtitle': subtitle,
      'username': username,
      'handle': handle,
      'time': time,
      'description': description,
      'emoji': emoji,
      'mentions': mentions,
      'reply': reply,
    };
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      type: json['type'] as String? ?? '',
      title: json['title'] as String?,
      message: json['message'] as String? ?? '',
      subtitle: json['subtitle'] as String?,
      username: json['username'] as String?,
      handle: json['handle'] as String?,
      time: json['time'] as String? ?? '',
      description: json['description'] as String?,
      emoji: json['emoji'] as String?,
      mentions: (json['mentions'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      reply: json['reply'] as String?,
    );
  }
}