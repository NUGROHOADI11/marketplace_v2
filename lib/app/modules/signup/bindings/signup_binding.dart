import 'package:get/get.dart';
import 'package:marketplace_v2/app/data/provider/appwrite_provider.dart';
import 'package:marketplace_v2/app/data/repository/auth_repository.dart';

import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(AuthRepository(AppWriteProvider())),
    );
  }
}
