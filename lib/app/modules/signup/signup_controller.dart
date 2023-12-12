import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/repository/auth_repository.dart';
import '../../routes/app_pages.dart';
import '../utils/snackbar.dart';

class SignupController extends GetxController {
  AuthRepository authRepository;
  SignupController(this.authRepository);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userNameControl = TextEditingController();
  final TextEditingController emailControl = TextEditingController();
  final TextEditingController passControl = TextEditingController();
  //TODO: Implement SignupController
  bool isFormValid = false;

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
    userNameControl.dispose();
    emailControl.dispose();
    passControl.dispose();
  }

  void clearText() {
    passControl.clear();
    emailControl.clear();
    userNameControl.clear();
  }

  void signUp(
      {required String email,
      required String pass,
      required String name}) async {
    isFormValid = formKey.currentState!.validate();
    if (!isFormValid) {
      return;
    } else {
      formKey.currentState!.save();
      try {
        await authRepository.signup({
          "userId": ID.unique(),
          "name": name,
          "email": email,
          "password": pass
        }).then((value) {
          CustomSnackBar.successSnackBar(
              context: Get.context, title: "Success", message: "Success Register");

          clearText();
          Get.offAllNamed(Routes.login);
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
