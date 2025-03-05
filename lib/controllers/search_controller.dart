import 'package:get/get.dart';
import '../data/search_data.dart';
import '../models/search_model.dart';


class TrendSearchController  extends GetxController {
  var trends = <SearchModel>[].obs;
  var searchQuery = "".obs;

  @override
  void onInit() {
    super.onInit();
    trends.assignAll(dummySearch);
  }

  void search(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      trends.assignAll(dummySearch);
    } else {
      trends.assignAll(dummySearch
          .where((trend) => trend.title.toLowerCase().contains(query.toLowerCase()))
          .toList());
    }
  }
}
