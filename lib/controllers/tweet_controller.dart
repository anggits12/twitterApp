import 'package:get/get.dart';
import '../models/tweet_model.dart';
import '../data/tweet_data.dart'; // Impor data dummy

class TweetController extends GetxController {
  var tweets = <Tweet>[].obs;

  @override
  void onInit() {
    super.onInit();
    tweets.addAll(
        dummyTweets); // ✅ Tambahkan data dummy saat controller diinisialisasi
  }

 void addTweet(String username, String content, String profileImage, String category) {
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
        contentImage: '',
        category: "Untuk Anda", // ✅ Simpan kategori tweet
      ),
    );
  }

  // ✅ Toggle Like
  void toggleLike(int index) {
    final updatedTweet = tweets[index].copyWith(
      likes: tweets[index].likes + 1, // Tambah 1 like
    );
    tweets[index] = updatedTweet; // Update daftar tweet
  }

  // ✅ Toggle Retweet
  void toggleRetweet(int index) {
    final updatedTweet = tweets[index].copyWith(
      retweets: tweets[index].retweets + 1, // Tambah 1 retweet
    );
    tweets[index] = updatedTweet;
  }
}
