import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Loader {
  static void show() {
    Get.dialog(
        WillPopScope(
            child: Center(child: CircularProgressIndicator()),
            onWillPop: () => Future.value(false)),
        barrierDismissible: false,
        useSafeArea: true);
  }

  static void cancel() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
