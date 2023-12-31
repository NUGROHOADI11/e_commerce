import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../data/models/user.dart';
import 'list_user_controller.dart';
import 'package:http/http.dart' as http;

class ListUserView extends GetView<ListUserController> {
  ListUserView({Key? key}) : super(key: key);

  final List<UserModel> allUser = [];
  Future<void> getAllUser() async {
    try {
      var response = await http.get(Uri.parse('https://reqres.in/api/users'));
      List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
      data.forEach((element) {
        allUser.add(UserModel.fromJson(element));
      });
    } catch (e) {
      print("An error occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List User'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Loading ...."),
            );
          } else {
            if (allUser.isEmpty) {
              return const Center(
                child: Text("Tidak ada data"),
              );
            }
            return ListView.builder(
              itemCount: allUser.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(backgroundColor: Colors.grey,
                foregroundImage: NetworkImage(allUser[index].avatar),),
                title: Text(
                    "${allUser[index].firstName} ${allUser[index].lastName}"),
                subtitle: Text(allUser[index].email),
              ),
            );
          }
        },
      ),
    );
  }
}
