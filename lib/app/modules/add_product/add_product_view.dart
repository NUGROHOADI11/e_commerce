import 'dart:io';

import 'package:e_commerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  AddProductView({Key? key}) : super(key: key);
  @override
  final AddProductController controller = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            'Add Product',
            style: GoogleFonts.sora(
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          backgroundColor: const Color(0xffeedcc6),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => controller.imagePath == ''.obs
                        ? const Text(
                            'Select Image',
                            style: TextStyle(fontSize: 20),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                              height: 150,
                              width: 150,
                              image:
                                  FileImage(File(controller.imagePath.value)),
                              fit: BoxFit.fill,
                            ),
                          )),
                    IconButton(
                        onPressed: () {
                          controller.selectImage();
                        },
                        icon: const Icon(Icons.camera_alt)),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.nameControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Product Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.priceControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Product Price",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.descControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Product Description",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: context.width),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.save(
                          name: controller.nameControl.text,
                          price: controller.priceControl.text,
                          desc: controller.descControl.text);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.orange), // Change the color as needed
                    ),
                    child: const Text("Create Product"),
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
