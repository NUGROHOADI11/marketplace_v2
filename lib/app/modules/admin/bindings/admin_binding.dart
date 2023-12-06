import 'package:get/get.dart';
import 'package:marketplace_v2/app/data/provider/appwrite_provider.dart';
import 'package:marketplace_v2/app/data/repository/auth_repository.dart';

import '../controllers/admin_controller.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminController>(
      () => AdminController(AuthRepository(AppWriteProvider())),
    );
  }
}
