import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace_v2/app/data/repository/auth_repository.dart';

import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  AuthRepository authRepository;
  SignupController(this.authRepository);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userNameControl = TextEditingController();
  final TextEditingController emailControl = TextEditingController();
  final TextEditingController passControl = TextEditingController();

  bool isFormValid = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    userNameControl.dispose();
    emailControl.dispose();
    passControl.dispose();
  }

  void clearText() {
    passControl.clear();
    emailControl.clear();
    userNameControl.clear();
  }

  void signUp(
      {required String email,
      required String pass,
      required String name}) async {
    isFormValid = formKey.currentState!.validate();
    if (!isFormValid) {
      return;
    } else {
      formKey.currentState!.save();
      try {
        await authRepository.signup({
          "userId": ID.unique(),
          "name": name,
          "email": email,
          "password": pass
        }).then((value) {
          Get.snackbar('Success', 'User Created',
              backgroundColor: Colors.green);
          clearText();
          Get.offAllNamed(Routes.LOGIN);
        }).catchError((error) {
          if (error is AppwriteException) {
            Get.snackbar(
                'Error', // Replace with your desired title
                'Snackbar Content: $error',
                backgroundColor: Colors.red);
          } else {
            Get.snackbar(
                'Error', // Replace with your desired title
                'Snackbar Content: $error',
                backgroundColor: Colors.red);
          }
        });
      } catch (e) {
        Get.snackbar(
            'Error', // Replace with your desired title
            'Snackbar Content: $e',
            backgroundColor: Colors.red);
      }
    }
  }
}
