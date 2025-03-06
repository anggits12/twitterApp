import 'package:flutter/material.dart';

class DMNewGroupWidget extends StatelessWidget {
  final VoidCallback onTap;

  const DMNewGroupWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.grey[900],
        child: Icon(Icons.group, color: Colors.lightBlue, size: 24),
      ),
      title: Text(
        "Buat Grup",
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}

class DMNewItemWidget extends StatelessWidget {
  final String name;
  final String handle;
  final VoidCallback onTap;

  const DMNewItemWidget({
    Key? key,
    required this.name,
    required this.handle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[900],
            child: Icon(Icons.person, color: Colors.lightBlue, size: 30),
          ),
          title: Text(
            name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(handle, style: TextStyle(color: Colors.grey)),
          onTap: onTap,
        ),
        Container(height: 1, color: Colors.white.withOpacity(0.05)),
      ],
    );
  }
}

class DMNewSearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const DMNewSearchBarWidget({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(width: 15),
            Icon(Icons.search, color: Colors.grey, size: 30),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
