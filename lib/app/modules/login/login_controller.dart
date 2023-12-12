import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/repository/auth_repository.dart';
import '../../routes/app_pages.dart';
import '../utils/snackbar.dart';

class LoginController extends GetxController {
  AuthRepository authRepository;
  LoginController(this.authRepository);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailControl = TextEditingController();
  final TextEditingController passControl = TextEditingController();

  bool isFormValid = false;
  final GetStorage _getStorage = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void clearText() {
    passControl.clear();
    emailControl.clear();
  }

  void logIn({required String email, required String pass}) async {
    isFormValid = formKey.currentState!.validate();
    if (!isFormValid) {
      return;
    } else {
      formKey.currentState!.save();
      try {
        await authRepository
            .login({"email": email, "password": pass}).then((value) {
          CustomSnackBar.successSnackBar(
              context: Get.context, title: "Success", message: "Login Success");

          clearText();
          _getStorage.write("userId", value.userId);
          _getStorage.write("sessionId", value.$id);
          Get.offAllNamed(Routes.home);
        }).catchError((error) {
          if (error is AppwriteException) {
            CustomSnackBar.showErrorSnackBar(
                context: Get.context,
                title: "error",
                message: "Something error");
          } else {
            CustomSnackBar.showErrorSnackBar(
                context: Get.context,
                title: "error",
                message: "Something error");
          }
        });
      } catch (e) {
        CustomSnackBar.showErrorSnackBar(
            context: Get.context, title: "error", message: "Something error");
      }
    }
  }
}
