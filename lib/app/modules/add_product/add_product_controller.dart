import 'package:appwrite/appwrite.dart';
import 'package:e_commerce/app/modules/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/repository/auth_repository.dart';

class AddProductController extends GetxController {
  AuthRepository authRepository;
  AddProductController(this.authRepository);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameControl = TextEditingController();
  final TextEditingController priceControl = TextEditingController();
  final TextEditingController descControl = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  var imagePath = ''.obs;
  bool isFormValid = false;
  late String uploadedFileId;
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
    nameControl.dispose();
    descControl.dispose();
    priceControl.dispose();
  }

  void clearText() {
    nameControl.clear();
    priceControl.clear();
    descControl.clear();
  }

  void selectImage() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path;
    } else {
      CustomSnackBar.showErrorSnackBar(
          context: Get.context, message: "Add Image canceled", title: "error");
    }
  }

  void save(
      {required String name,
      required String price,
      required String desc}) async {
    isFormValid = formKey.currentState!.validate();
    if (!isFormValid) {
      return;
    } else {
      formKey.currentState!.save();
      if (imagePath.isNotEmpty) {
        try {
          await authRepository
              .uploadProductImage(imagePath.value)
              .then((value) async {
            uploadedFileId = value.$id;
            await authRepository.createProduct({
              "name": name,
              "description": desc,
              "image": uploadedFileId,
              "price": price,
            }).then((value) {
              Get.back();
              CustomSnackBar.successSnackBar(
                  context: Get.context,
                  title: "Success",
                  message: "Product Created");
            }).catchError((error) async {
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
              await authRepository.deleteProductImage(uploadedFileId);
            });
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
          Get.snackbar('Error', 'Snackbar Content: $e',
              backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar('Cancel', 'Upload Failed', backgroundColor: Colors.orange);
      }
    }
  }
}
