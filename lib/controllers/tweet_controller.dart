import 'package:get/get.dart';
import '../models/tweet_model.dart';
import '../data/tweet_data.dart';

class TweetController extends GetxController {
  var tweets = <Tweet>[].obs;

  @override
  void onInit() {
    super.onInit();
    tweets.addAll(dummyTweets);
  }

  void addTweet(
      String username, String content, String profileImage, String category) {
    tweets.insert(
      0,
      Tweet(
        username: username,
        handle: "@$username",
        time: "Baru saja",
        content: content,
        profileImage: profileImage,
        likes: 0,
        retweets: 0,
        comments: 0,
        impressions: 0,
        contentImage: '',
        category: "Untuk Anda",
      ),
    );
  }

  void toggleLike(int index) {
    final updatedTweet = tweets[index].copyWith(
      likes: tweets[index].likes + 1,
    );
    tweets[index] = updatedTweet;
  }

  void toggleRetweet(int index) {
    final updatedTweet = tweets[index].copyWith(
      retweets: tweets[index].retweets + 1,
    );
    tweets[index] = updatedTweet;
  }
}
