import 'package:get/get.dart';

import 'list_user_controller.dart';

class ListUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListUserController>(
      () => ListUserController(),
    );
  }
}
