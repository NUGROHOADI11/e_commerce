import 'package:e_commerce/app/data/provider/appwrite_provider.dart';
import 'package:e_commerce/app/data/repository/auth_repository.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(AuthRepository(AppWriteProvider())),
    );
  }
}
