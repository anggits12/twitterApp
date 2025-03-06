import 'package:flutter/material.dart';

class DMItemWidget extends StatelessWidget {
  final String name;
  final String handle;
  final String date;
  final String message;
  final VoidCallback onTap;

  const DMItemWidget({
    Key? key,
    required this.name,
    required this.handle,
    required this.date,
    required this.message,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.grey[900],
        child: Icon(Icons.person, color: Colors.white),
      ),
      title: Row(
        children: [
          Flexible(
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 6),
          Text("· $date", style: TextStyle(color: Colors.grey)),
        ],
      ),
      subtitle: Text(
        message,
        style: TextStyle(color: Colors.grey),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      onTap: onTap,
    );
  }
}

class DMGroupItemWidget extends StatelessWidget {
  final String name;
  final String date;
  final String message;
  final VoidCallback onTap;

  const DMGroupItemWidget({
    Key? key,
    required this.name,
    required this.date,
    required this.message,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.grey[900],
        child: Icon(Icons.group, color: Colors.white),
      ),
      title: Row(
        children: [
          Flexible(
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 6),
          Text("· $date", style: TextStyle(color: Colors.grey)),
        ],
      ),
      subtitle: Text(
        message,
        style: TextStyle(color: Colors.grey),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      onTap: onTap,
    );
  }
}

class DMSearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final String hintText;

  const DMSearchBarWidget({
    Key? key,
    required this.controller,
    required this.onChanged,
    this.hintText = "Cari Direct Message",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 35,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 15),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
