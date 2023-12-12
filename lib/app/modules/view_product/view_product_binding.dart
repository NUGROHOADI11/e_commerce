import 'package:get/get.dart';

import 'view_product_controller.dart';

class ViewProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewProductController>(
      () => ViewProductController(),
    );
  }
}
