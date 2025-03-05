import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/navbar_controller.dart';
import 'controllers/tweet_controller.dart';
import 'screens/main_screen.dart';

void main() {
  // Inisialisasi controller agar tersedia selama aplikasi berjalan
  Get.put(NavController());
  Get.put(TweetController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Twitter Clone',
      theme: ThemeData.dark(),
      home: MainScreen(),
    );
  }
}
