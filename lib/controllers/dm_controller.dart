import 'package:get/get.dart';

class DMController extends GetxController {
  final RxList<Map<String, dynamic>> dmList = <Map<String, dynamic>>[
    {
      "name": "Yupienfess (SEMUA BISA ...",
      "handle": "@yupienfess",
      "date": "24 Sep 24",
      "message": "cara kirim menfess klik link di bio",
      "image": "",
    },
    {
      "name": "alyaa - open",
      "handle": "@sereinstoree",
      "date": "30 Jun 24",
      "message": "Anda mengirim postingan @sereinstoree: x.com/sereinstoree/s...",
      "image": "",
    },
    {
      "name": "Nana ~ 3500+ testi",
      "handle": "@bomstore",
      "date": "28 Feb 24",
      "message": "sama2 kaa, makasih kembali. enjoy canva nya!!❤️📸✨",
      "image": "",
    },
    {
      "name": "Kevin, Clara",
      "handle": "",
      "date": "15 Jan 24",
      "message": "Kevin: Aku udah sampai, kalian di mana?",
      "image": "",
    },
    {
      "name": "Raka Aditya",
      "handle": "@raka_adit",
      "date": "5 Des 23",
      "message": "Besok jadi futsal?",
      "image": "",
    },
    {
      "name": "Ella, Reza",
      "handle": "",
      "date": "27 Nov 23",
      "message": "Reza: Jangan lupa meeting jam 3!",
      "image": "",
    },
    {
      "name": "Budi Santoso",
      "handle": "@budi_santoso",
      "date": "12 Okt 23",
      "message": "Oke, saya transfer sekarang ya!",
      "image": "",
    },
    {
      "name": "Dini Pratiwi",
      "handle": "@dini_pratiwi",
      "date": "3 Sep 23",
      "message": "Makasih ya! ❤️",
      "image": "",
    },
    {
      "name": "Andi, Rizky",
      "handle": "",
      "date": "19 Agu 23",
      "message": "Andi: Udah nonton film baru belum?",
      "image": "",
    },
    {
      "name": "Fitri Handayani",
      "handle": "@fitri_hdy",
      "date": "1 Jul 23",
      "message": "Nanti aku kabarin lagi ya!",
      "image": "",
    },
  ].obs;

  final RxList<Map<String, dynamic>> filteredDMList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredDMList.assignAll(dmList);
  }

  void searchDMs(String query) {
    if (query.isEmpty) {
      filteredDMList.assignAll(dmList);
    } else {
      final filtered = dmList.where((dm) {
        String name = dm["name"].toLowerCase();
        String handle = dm["handle"].toLowerCase();
        String message = dm["message"].toLowerCase();
        return name.contains(query.toLowerCase()) ||
            handle.contains(query.toLowerCase()) ||
            message.contains(query.toLowerCase());
      }).toList();
      filteredDMList.assignAll(filtered);
    }
  }
}