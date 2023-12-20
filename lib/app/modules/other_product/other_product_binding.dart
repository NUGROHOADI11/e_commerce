import 'package:get/get.dart';

import 'other_product_controller.dart';

class OtherProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherProductController>(
      () => OtherProductController(),
    );
  }
}
