import 'package:get/get.dart';
import 'package:marketplace_v2/app/controllers/save_data.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  String userName = "User";
  String email = "Email";
  final count = 0.obs;
  @override
  void onInit() {
    userName = SaveData.getUsername();
    email = SaveData.getEmail();
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

  var currentNavIndex = 0.obs;

  void increment() => count.value++;
}
