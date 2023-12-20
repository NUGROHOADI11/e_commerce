import 'dart:convert';

import 'package:e_commerce/app/data/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListUserController extends GetxController {
  //TODO: Implement ListUserController
  final List<UserModel> allUser = [];
  final http.Client client = http.Client();

  Future<void> getAllUser() async {
    try {
      final response = await client.get(Uri.parse('https://reqres.in/api/users'));
      List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
      data.forEach((element) {
        allUser.add(UserModel.fromJson(element));
      });
    } catch (e) {
      print("An error occurred: $e");
    }
  }

  final count = 0.obs;
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
    client.close();
    super.onClose();
  }

  void increment() => count.value++;
}
