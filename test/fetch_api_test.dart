import 'dart:convert';

import 'package:e_commerce/app/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
void main() {
  test('ListUserController should fetch and display user data', () async {
    final httpClient = MockHttpClient();
    final listUserController = ListUserController();

    when(httpClient.get(Uri.parse('https://reqres.in/api/users')))
        .thenAnswer((_) async => http.Response(
            '{"data": [{"avatar": "url", "first_name": "George", "last_name": "Bluth", "email": "george.bluth@reqres.in"}]}',
            200));

    await listUserController.getAllUser(httpClient);

    expect(listUserController.allUser.length, 1);
    expect(listUserController.allUser[0].firstName, 'George');
    expect(listUserController.allUser[0].lastName, 'Bluth');
    expect(listUserController.allUser[0].email, 'george.bluth@reqres.in');
  });
}

class MockHttpClient extends Mock implements http.Client {}

class ListUserController extends GetxController {
  final List<UserModel> allUser = [];

  Future<void> getAllUser(http.Client httpClient) async {
    try {
      final response = await httpClient.get(Uri.parse('https://reqres.in/api/users'));

      if (response != null && response.statusCode == 200) {
        List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
        data.forEach((element) {
          allUser.add(UserModel.fromJson(element));
        });
      }
    } catch (e) {
      print("An error occurred: $e");
    }
  }
}

class ListUserView extends GetView<ListUserController> {
  const ListUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.allUser.isEmpty) {
            return const Center(
              child: Text("Tidak ada data"),
            );
          }
          return ListView.builder(
            itemCount: controller.allUser.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                foregroundImage: NetworkImage(controller.allUser[index].avatar),
              ),
              title: Text("${controller.allUser[index].firstName} ${controller.allUser[index].lastName}"),
              subtitle: Text(controller.allUser[index].email),
            ),
          );
        },
      ),
    );
  }
}
