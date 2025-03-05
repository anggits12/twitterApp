import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navbar_controller.dart';

class BottomNavbarWidget extends StatelessWidget {
  final NavController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          currentIndex: navController.selectedIndex.value,
          onTap: (index) => navController.changeTab(index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifikasi"),
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: "DM"),
          ],
        ));
  }
}
