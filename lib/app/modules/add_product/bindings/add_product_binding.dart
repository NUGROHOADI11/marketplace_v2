import 'package:get/get.dart';

import '../../../data/provider/appwrite_provider.dart';
import '../../../data/repository/auth_repository.dart';
import '../controllers/add_product_controller.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(
      () => AddProductController(AuthRepository(AppWriteProvider())),
    );
  }
}
