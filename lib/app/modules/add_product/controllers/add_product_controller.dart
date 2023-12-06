import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketplace_v2/app/data/models/product_model.dart';
import 'package:marketplace_v2/app/utils/appwrite_constant.dart';

import '../../../data/repository/auth_repository.dart';
import '../../../routes/app_pages.dart';

class AddProductController extends GetxController {
  AuthRepository authRepository;
  AddProductController(this.authRepository);
  bool isFormValid = false;
  final TextEditingController nameControl = TextEditingController();
  final TextEditingController priceControl = TextEditingController();
  final TextEditingController descControl = TextEditingController();
  final count = 0.obs;
  // final GetStorage _getStorage = GetStorage();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var imagePath = ''.obs;
  final ImagePicker _picker = ImagePicker();
  late String uploadedFileId;
  var isEdit = false.obs;
  var imageUrl = ''.obs;
  late Product product;


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
    nameControl.dispose();
    priceControl.dispose();
    descControl.dispose();
  }

  void clearText() {
    nameControl.clear();
    priceControl.clear();
    descControl.clear();
  }

  void selectImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path;
    } else {
      Get.snackbar('Cancel', 'Image Canceled', backgroundColor: Colors.orange);
    }
  }

  void save(
      {required String name,
      required String price,
      required String desc}) async {
    isFormValid = formKey.currentState!.validate();
    if (!isFormValid) {
      return;
    } else {
      formKey.currentState!.save();
      if (imagePath.isNotEmpty) {
        try {
          await authRepository
              .uploadProductImage(imagePath.value)
              .then((value) async {
            uploadedFileId = value.$id;
            await authRepository.createProduct({
              "name": name,
              "description": desc,
              "image": uploadedFileId,
              "price": price,
            }).then((value) {
              Get.snackbar('Success', 'Snackbar Content: $value',
                  backgroundColor: Colors.green);
            }).catchError((error) async {
              if (error is AppwriteException) {
                Get.snackbar('Error', 'Snackbar Content: $error',
                    backgroundColor: Colors.red);
              } else {
                Get.snackbar('Error', 'Snackbar Content: $error',
                    backgroundColor: Colors.red);
              }
              await authRepository.deleteProductImage(uploadedFileId);
            });
          }).catchError((error) {
            if (error is AppwriteException) {
              Get.snackbar('Error', 'Snackbar Content: $error',
                  backgroundColor: Colors.red);
            } else {
              Get.snackbar('Error', 'Snackbar Content: $error',
                  backgroundColor: Colors.red);
            }
          });
        } catch (e) {
          Get.snackbar('Error', 'Snackbar Content: $e',
              backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar('Cancel', 'Upload Failed', backgroundColor: Colors.orange);
      }
    }
  }

  void updateproduct(
      {required String name,
      required String price,
      required String desc}) async {
    isFormValid = formKey.currentState!.validate();
    if (!isFormValid) {
      return;
    } else {
      formKey.currentState!.save();
      if (imagePath.isNotEmpty) {
        try {
          await authRepository
              .uploadProductImage(imagePath.value)
              .then((value) async {
            uploadedFileId = value.$id;
            await authRepository.updateProduct({
              "name": name,
              "description": desc,
              "image": uploadedFileId,
              "price": price,
            }).then((value) {
              Get.snackbar('Success', 'Snackbar Content: $value',
                  backgroundColor: Colors.green);
            }).catchError((error) async {
              if (error is AppwriteException) {
                Get.snackbar('Error', 'Snackbar Content: $error',
                    backgroundColor: Colors.red);
              } else {
                Get.snackbar('Error', 'Snackbar Content: $error',
                    backgroundColor: Colors.red);
              }
              await authRepository.deleteProductImage(uploadedFileId);
            });
          }).catchError((error) {
            if (error is AppwriteException) {
              Get.snackbar('Error', 'Snackbar Content: $error',
                  backgroundColor: Colors.red);
            } else {
              Get.snackbar('Error', 'Snackbar Content: $error',
                  backgroundColor: Colors.red);
            }
          });
        } catch (e) {
          Get.snackbar('Error', 'Snackbar Content: $e',
              backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar('Cancel', 'Upload Failed', backgroundColor: Colors.orange);
      }
    }
  }
}
