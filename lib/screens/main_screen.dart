import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navbar_controller.dart';
import '../widgets/bottom_navbar_widget.dart';
import '../widgets/sidebar_widget.dart';
import 'create_screen.dart';
import '../screens/dm_screen.dart';
import 'home_screen.dart';
import 'notification_screen.dart';
import 'search_screen.dart';

class MainScreen extends StatelessWidget {
  final NavController navController = Get.find();

  final List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    NotificationScreen(),
    DMScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black,
        drawer: ProfileDrawer(),
        body: pages[navController.selectedIndex.value],
        floatingActionButton: (navController.selectedIndex.value != 3)
            ? FloatingActionButton(
                onPressed: () {
                  Get.to(() => CreateTweetScreen());
                },
                backgroundColor: Color.fromARGB(255, 53, 161, 255),
                child: Icon(Icons.add, color: Colors.white),
              )
            : null,
        bottomNavigationBar: BottomNavbarWidget(),
      ),
    );
  }
}
