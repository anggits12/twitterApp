import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navbar_controller.dart';
import '../widgets/bottom_navbar_widget.dart';
import '../widgets/sidebar_widget.dart';
import 'create_screen.dart';
import 'dm_screen.dart';
import 'home_screen.dart';
import 'notification_screen.dart';
import 'search_screen.dart';

class MainScreen extends StatelessWidget {
  final NavController navController = Get.find();

  final List<Widget> pages = [
    HomeScreen(),
    SearchPage(),
    NotificationsPage(),
    DMPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black,
        drawer: ProfileDrawer(), // ⬅️ Pastikan drawer ada di sini
        body: pages[navController.selectedIndex.value],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(
                () => CreateTweetScreen()); // 🔥 Navigasi ke halaman CreateTweet
          },
          backgroundColor: Color.fromARGB(255, 53, 161, 255),
          child: Icon(Icons.add, color: Colors.white),
        ),

        bottomNavigationBar: BottomNavbarWidget(),
      ),
    );
  }
}
