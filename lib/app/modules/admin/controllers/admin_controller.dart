import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marketplace_v2/app/controllers/db.dart';
import 'package:marketplace_v2/app/data/models/product_model.dart';
import 'package:marketplace_v2/app/data/repository/auth_repository.dart';

import '../../../controllers/save_data.dart';
import '../../../routes/app_pages.dart';

class AdminController extends GetxController with StateMixin<List<Product>> {
  final GetStorage _getStorage = GetStorage();
  late List<Product> productList = [];
  AuthRepository authRepository;
  AdminController(this.authRepository);
  var currentNavIndex = 0.obs;
  List<Document> products = [];
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

  logout() async {
    try {
      await authRepository.logout(_getStorage.read("sessionId")).then((value) {
        _getStorage.erase();
        Get.offAllNamed(Routes.LOGIN);
      });
    } catch (e) {
      Get.snackbar('Error', 'Snackbar Content: $e',
          backgroundColor: Colors.red);
    }
  }

  getProduct() async {
    try {
      change(null, status: RxStatus.loading());
      await authRepository.getProduct().then((value) {
        Map<String, dynamic> data = value.toMap();
        List d = data['documents'].toList();
        productList = d
            .map(
              (e) => Product.fromMap(e['data']),
            )
            .toList();
        change(productList, status: RxStatus.success());
      }).catchError((error) {
        Get.snackbar('Error', 'Snackbar Content: $error',
            backgroundColor: Colors.red);
      });
    } catch (e) {
      Get.snackbar('Error', 'Snackbar Content: $e',
          backgroundColor: Colors.red);
    }
  }

  
}
