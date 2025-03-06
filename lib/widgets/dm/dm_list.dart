import 'package:flutter/material.dart';
import 'package:twitterapp/widgets/dm/dm_item.dart';
import 'package:twitterapp/screens/new_dm_screen.dart';

class DMAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController searchController;
  final Function(String) onSearch;

  const DMAppBarWidget({
    Key? key,
    required this.searchController,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      titleSpacing: 0,
      leading: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/akuntwt.jpg"),
            ),
          ),
        ),
      ),
      title: DMSearchBarWidget(
        controller: searchController,
        onChanged: onSearch,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.settings_outlined, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class DMFABWidget extends StatelessWidget {
  const DMFABWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewDMScreen()),
        );
      },
      backgroundColor: Colors.blue,
      child: Icon(Icons.mail, color: Colors.white),
    );
  }
}
