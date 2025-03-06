import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/dm/dm_new/dm_new_list.dart';
import '../controllers/new_dm_controller.dart';

class NewDMScreen extends GetView<NewDMController> {
  NewDMScreen({Key? key}) : super(key: key) {
    Get.put(NewDMController());
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Direct Message", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          DMNewSearchBarWidget(
            controller: searchController,
            onChanged: controller.searchDMs,
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.filteredDMList.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return DMNewGroupWidget(
                    onTap: () {
                    },
                  );
                }
                final dm = controller.filteredDMList[index - 1];
                return DMNewItemWidget(
                  name: dm["name"]!,
                  handle: dm["handle"]!,
                  onTap: () {
                  },
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}
