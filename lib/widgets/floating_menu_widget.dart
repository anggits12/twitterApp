import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/create_screen.dart';

class FloatingMenu extends StatefulWidget {
  @override
  _FloatingMenuState createState() => _FloatingMenuState();
}

class _FloatingMenuState extends State<FloatingMenu> with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }

  void toggleMenu() {
    setState(() {
      isOpen = !isOpen;
      if (isOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  Widget buildOption({required IconData icon, required String label, required VoidCallback onTap}) {
    return ScaleTransition(
      scale: _animation,
      child: GestureDetector(
        onTap: () {
          toggleMenu();
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Label (Text)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  label,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              SizedBox(width: 10),
              // Icon dengan background putih dan border biru
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Icon(icon, color: Colors.blue, size: 26),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isOpen) ...[
          buildOption(icon: Icons.video_camera_front, label: "Go Live", onTap: () {}),
          buildOption(icon: Icons.mic, label: "Spaces", onTap: () {}),
          buildOption(icon: Icons.image, label: "Photos", onTap: () {}),
          buildOption(icon: Icons.edit, label: "Post", onTap: () {
            Get.to(() => CreateTweetScreen());
          }),
        ],
        FloatingActionButton(
          onPressed: toggleMenu,
          backgroundColor: Colors.blue,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ],
    );
  }
}
