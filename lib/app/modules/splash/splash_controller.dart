import 'package:e_commerce/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final GetStorage _getStorage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    if (_getStorage.read("userId") != null) {
      Get.offAllNamed(Routes.home);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }

  @override
  void onReady() {
    super.onReady();
    // Future.delayed(const Duration(seconds: 1), () => Get.toNamed(Routes.login));
    if (_getStorage.read("userId") != null) {
      Get.offAllNamed(Routes.home);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
