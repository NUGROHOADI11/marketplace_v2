import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:marketplace_v2/app/controllers/db.dart';

import '../../../controllers/save_data.dart';

class AdminController extends GetxController {
  var currentNavIndex = 0.obs;
  List<Document> products = [];
  //TODO: Implement AdminController
  String userName = "User";
  String email = "Email";
  final count = 0.obs;
  @override
  void onInit() {
    userName = SaveData.getUsername();
    email = SaveData.getEmail();

    getAllProduct().then((value) => products = value);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    
    super.onClose();
  }

  void increment() => count.value++;
}
