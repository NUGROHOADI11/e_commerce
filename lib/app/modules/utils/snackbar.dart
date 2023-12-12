import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void showErrorSnackBar({
    required BuildContext? context,
    required String title,
    required String message,
  }) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        messageText: Text(message),
        duration: const Duration(seconds: 3));
  }
  static void successSnackBar({
    required BuildContext? context,
    required String title,
    required String message,
  }) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        messageText: Text(message),
        duration: const Duration(seconds: 3));
  }
}
