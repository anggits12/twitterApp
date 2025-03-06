class Tweet {
  final String username;
  final String handle;
  final String time;
  final String content;
  final int comments;
  final int retweets;
  final int likes;
  final int impressions;
  final String profileImage;
  final String contentImage;
  bool isRetweeted;
  bool isLiked;
  final String category;

  Tweet({
    required this.username,
    required this.handle,
    required this.time,
    required this.content,
    required this.comments,
    required this.retweets,
    required this.likes,
    required this.impressions,
    required this.profileImage,
    required this.contentImage,
    this.isRetweeted = false,
    this.isLiked = false,
    required this.category,
  });

  Tweet copyWith({
    String? username,
    String? handle,
    String? time,
    String? content,
    int? comments,
    int? retweets,
    int? likes,
    int? impressions,
    String? profileImage,
    String? contentImage,
    String? category,
  }) {
    return Tweet(
      username: username ?? this.username,
      handle: handle ?? this.handle,
      time: time ?? this.time,
      content: content ?? this.content,
      comments: comments ?? this.comments,
      retweets: retweets ?? this.retweets,
      likes: likes ?? this.likes,
      impressions: impressions ?? this.impressions,
      profileImage: profileImage ?? this.profileImage,
      contentImage: contentImage ?? this.contentImage,
      category: category ?? this.category,
    );
  }
}
