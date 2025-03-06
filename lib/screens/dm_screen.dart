import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/sidebar_widget.dart';
import '../widgets/dm/dm_list.dart';
import '../controllers/dm_controller.dart';

class DMScreen extends GetView<DMController> {
  DMScreen({Key? key}) : super(key: key) {
    Get.put(DMController());
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: ProfileDrawer(),
      appBar: DMAppBarWidget(
        searchController: searchController,
        onSearch: controller.searchDMs,
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.filteredDMList.length,
        itemBuilder: (context, index) {
          final dm = controller.filteredDMList[index];
          return _buildDMItem(dm);
        },
      )),
      floatingActionButton: DMFABWidget(),
    );
  }

  Widget _buildDMItem(Map<String, dynamic> dm) {
    bool isGroup = dm["handle"].isEmpty;
    bool hasImage = dm["image"] != null && dm["image"].isNotEmpty;

    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.grey[900],
        child: hasImage
            ? ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(dm["image"], fit: BoxFit.cover),
              )
            : Icon(
                isGroup ? Icons.group : Icons.person,
                color: Colors.lightBlue,
                size: 30,
              ),
      ),
      title: Row(
        children: [
          Flexible(
            child: Text(
              dm["name"],
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 6),
          Text(
            "· ${dm["date"]}",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      subtitle: Text(
        dm["message"],
        style: TextStyle(color: Colors.grey),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      onTap: () {},
    );
  }
}