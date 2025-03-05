import 'package:flutter/material.dart';
import '../widgets/tweet_list_widget.dart';
import '../widgets/sidebar_widget.dart'; // ✅ Pastikan sidebar_widget.dart ada

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: ProfileDrawer(), // ✅ Tambahkan drawer untuk sidebar
        appBar: AppBar(
          title: Text('X', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: Builder(
            builder: (context) => IconButton(
              icon: CircleAvatar(
                backgroundImage: AssetImage("assets/akuntwt.jpg"),
                radius: 16,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // ✅ Pastikan sidebar bisa dibuka
              },
            ),
          ),
          actions: [
            Icon(Icons.more_vert, color: Colors.white),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.tab, // ✅ Garis selebar tab
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 53, 161, 255), // ✅ Warna biru aktif
                    width: 3,
                  ),
                ),
              ),
              tabs: [
                Tab(text: "Untuk Anda"),
                Tab(text: "Mengikuti"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            TweetListWidget(category: "Untuk Anda"),
            TweetListWidget(category: "Mengikuti"),
          ],
        ),
      ),
    );
  }
}
