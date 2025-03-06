import 'package:get/get.dart';

class NewDMController extends GetxController {
  final RxList<Map<String, String>> dmList = <Map<String, String>>[
    {"name": "Dina", "handle": "@dinaptr"},
    {"name": "Rizky", "handle": "@rizky_awan"},
    {"name": "Bella", "handle": "@bellanov"},
    {"name": "Kevin", "handle": "@kevinnn"},
    {"name": "Lina", "handle": "@lina_purple"},
    {"name": "Andi", "handle": "@andi_real"},
    {"name": "Yuni", "handle": "@yuniverse"},
    {"name": "Budi", "handle": "@budi_story"},
    {"name": "Siska", "handle": "@siska_talks"},
    {"name": "Fajar", "handle": "@fajarmuda"},
    {"name": "Rina", "handle": "@rina_ri"},
    {"name": "Haris", "handle": "@haris_77"},
    {"name": "Cindy", "handle": "@cindyluv"},
    {"name": "Joko", "handle": "@joko_jk"},
    {"name": "Nadia", "handle": "@nadia_n"},
  ].obs;

  final RxList<Map<String, String>> filteredDMList = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredDMList.assignAll(dmList);
  }

  void searchDMs(String query) {
    if (query.isEmpty) {
      filteredDMList.assignAll(dmList);
    } else {
      final filtered = dmList.where((dm) =>
      dm["name"]!.toLowerCase().contains(query.toLowerCase()) ||
          dm["handle"]!.toLowerCase().contains(query.toLowerCase())
      ).toList();
      filteredDMList.assignAll(filtered);
    }
  }
}