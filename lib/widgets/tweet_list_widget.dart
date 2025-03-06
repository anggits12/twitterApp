import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/tweet_controller.dart';

class TweetListWidget extends StatelessWidget {
  final String category;
  final TweetController tweetController = Get.find();

  TweetListWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final tweets = tweetController.tweets
          .where((tweet) => tweet.category == category)
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
                  CircleAvatar(
                    backgroundImage: AssetImage(tweet.profileImage),
                    radius: 24,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        Text(tweet.content,
                            style: TextStyle(color: Colors.white)),
                        if (tweet.contentImage.isNotEmpty) ...[
                          SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(tweet.contentImage,
                                fit: BoxFit.cover),
                          ),
                        ],
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/comment.svg",
                                    width: 20, color: Colors.grey),
                                SizedBox(width: 5),
                                Text(tweet.comments.toString(),
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      tweetController.toggleRetweet(index),
                                  child: SvgPicture.asset("assets/repeat.svg",
                                      width: 20,
                                      color: tweet.isRetweeted
                                          ? Colors.green
                                          : Colors.grey),
                                ),
                                SizedBox(width: 5),
                                Text(tweet.retweets.toString(),
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      tweetController.toggleLike(index),
                                  child: SvgPicture.asset("assets/like.svg",
                                      width: 20,
                                      color: tweet.isLiked
                                          ? Colors.red
                                          : Colors.grey),
                                ),
                                SizedBox(width: 5),
                                Text(tweet.likes.toString(),
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/impressions.svg",
                                    width: 20, color: Colors.grey),
                                SizedBox(width: 5),
                                Text(tweet.impressions.toString(),
                                    style: TextStyle(color: Colors.grey)),
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
            ),
          );
        },
      );
    });
  }
}
