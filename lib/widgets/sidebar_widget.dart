import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          // HEADER PROFIL
          UserAccountsDrawerHeader(
            accountName: Text(
              "aeraa",
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: Text(
              "@JHJHJJ_",
              style: TextStyle(color: Colors.grey),
            ),
            currentAccountPicture: CircleAvatar(
              // ✅ Pindahkan ke currentAccountPicture
              backgroundImage: AssetImage("assets/akuntwt.jpg"),
              radius: 24, // Sesuaikan ukuran agar lebih proporsional
            ),
            decoration: BoxDecoration(color: Colors.black),
          ),

          // INFORMASI MENGIKUTI DAN PENGIKUT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text("655 ",
                    style: TextStyle(color: Colors.white, fontSize: 14)),
                Text("Mengikuti",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 184, 184, 184),
                        fontSize: 14)),
                SizedBox(width: 10),
                Text("449 ",
                    style: TextStyle(color: Colors.white, fontSize: 14)),
                Text("Pengikut",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 184, 184, 184),
                        fontSize: 14)),
              ],
            ),
          ),
          Divider(color: Colors.grey),
          SizedBox(height: 10),

          // MENU NAVIGASI
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text("Profil", style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.star, color: Colors.white),
                  title: Text("Premium", style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.bookmark, color: Colors.white),
                  title: Text("Markah", style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.work, color: Colors.white),
                  title: Text("Karier", style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.list, color: Colors.white),
                  title: Text("Daftar", style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.mic, color: Colors.white),
                  title: Text("Spaces", style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.monetization_on, color: Colors.white),
                  title:
                      Text("Monetisasi", style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
              ],
            ),
          ),

          // PENGATURAN & DUKUNGAN
          Divider(color: Colors.grey),
          ListTile(
            title: Text("Pengaturan & Dukungan",
                style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.arrow_drop_down, color: Colors.white),
            onTap: () {},
          ),

          // MODE MALAM
          ListTile(
            leading: Icon(Icons.nightlight_round, color: Colors.white),
            title: Text("Mode Malam", style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
