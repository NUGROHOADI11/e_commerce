import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  final GetStorage getStorage = GetStorage();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute:
          getStorage.read("userId") != null ? Routes.home : Routes.login,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
