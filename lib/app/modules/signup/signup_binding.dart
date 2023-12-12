import 'package:e_commerce/app/data/provider/appwrite_provider.dart';
import 'package:e_commerce/app/data/repository/auth_repository.dart';
import 'package:get/get.dart';

import 'signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(AuthRepository(AppWriteProvider())),
    );
  }
}
