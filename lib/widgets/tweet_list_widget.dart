import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tweet_controller.dart';

class TweetListWidget extends StatelessWidget {
  final String category; // Tambahkan parameter category
  final TweetController tweetController = Get.find();

  TweetListWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Filter tweet berdasarkan kategori
      final tweets = tweetController.tweets
          .where((tweet) => tweet.category == category) // Sesuaikan dengan kategori
          .toList();

      if (tweets.isEmpty) {
        return Center(
          child: Text(
            "Belum ada tweet di kategori $category",
            style: TextStyle(color: Colors.white),
          ),
        );
      }

      return ListView.builder(
        itemCount: tweets.length,
        itemBuilder: (context, index) {
          final tweet = tweets[index];
          return Card(
            color: Colors.black,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // **Avatar Profil**
                  CircleAvatar(
                    backgroundImage: AssetImage(tweet.profileImage),
                    radius: 24,
                  ),
                  SizedBox(width: 10),

                  // **Tweet Content (Nama, Handle, Isi, Gambar, Footer)**
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // **Header: Nama & Handle**
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(tweet.username,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: 5),
                                Text(tweet.handle,
                                    style: TextStyle(color: Colors.grey)),
                                Text(" • ${tweet.time}",
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            Icon(Icons.more_vert, color: Colors.grey),
                          ],
                        ),

                        SizedBox(height: 5),

                        // **Isi Tweet**
                        Text(tweet.content,
                            style: TextStyle(color: Colors.white)),

                        // **Gambar Tweet (Jika Ada)**
                        if (tweet.contentImage.isNotEmpty) ...[
                          SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(tweet.contentImage,
                                fit: BoxFit.cover),
                          ),
                        ],

                        SizedBox(height: 8),

                        // **Footer Tweet (Aksi)**
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Comments
                            Row(
                              children: [
                                Icon(Icons.comment,
                                    color: Colors.grey, size: 20),
                                SizedBox(width: 5),
                                Text(tweet.comments.toString(),
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),

                            // Retweets
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      tweetController.toggleRetweet(index),
                                  child: Icon(Icons.repeat,
                                      color: tweet.isRetweeted
                                          ? Colors.green
                                          : Colors.grey,
                                      size: 20),
                                ),
                                SizedBox(width: 5),
                                Text(tweet.retweets.toString(),
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),

                            // Likes
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      tweetController.toggleLike(index),
                                  child: Icon(Icons.favorite,
                                      color: tweet.isLiked
                                          ? Colors.red
                                          : Colors.grey,
                                      size: 20),
                                ),
                                SizedBox(width: 5),
                                Text(tweet.likes.toString(),
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),

                            Icon(Icons.bookmark_border,
                                color: Colors.grey), // 🔖 **Ikon Bookmark**
                            Icon(Icons.share, color: Colors.grey),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
