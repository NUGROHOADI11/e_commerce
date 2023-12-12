import 'package:e_commerce/app/data/provider/appwrite_provider.dart';
import 'package:e_commerce/app/data/repository/auth_repository.dart';
import 'package:get/get.dart';

import 'add_product_controller.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(
      () => AddProductController(AuthRepository(AppWriteProvider())),
    );
  }
}
