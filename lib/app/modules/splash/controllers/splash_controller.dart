import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final GetStorage _getStorage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    
  }

  @override
  void onReady() {
    super.onReady();
    if (_getStorage.read("userId") != null) {
      Get.offAllNamed(Routes.ADMIN);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
    Future.delayed(const Duration(seconds: 3), ()=> Get.offAllNamed(Routes.LOGIN));
  }

  @override
  void onClose() {
    super.onClose();
  }
}
