import 'package:flutter/material.dart';

class CreateTweetScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Create Post", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Text("Post",
                  style: TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Profil & Input Text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/akuntwt.jpg"),
                  radius: 24,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "What's happening?",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Spacer(), // ✅ Mengisi ruang agar ikon tetap di bawah

          // Opsi siapa yang bisa reply
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.public, color: Colors.blue, size: 18),
                SizedBox(width: 5),
                Text("Everyone can reply",
                    style: TextStyle(color: Colors.blue, fontSize: 14)),
              ],
            ),
          ),

          // ✅ Ikon Menu Bawah (Tetap di Posisi Bawah)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border(
                  top: BorderSide(color: Colors.grey.shade800, width: 0.5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.image, color: Colors.blue),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.gif, color: Colors.blue),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.poll, color: Colors.blue),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.location_on, color: Colors.blue),
                        onPressed: () {}),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.circle_outlined, color: Colors.grey),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.add, color: Colors.blue),
                        onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
