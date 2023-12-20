import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<UserModel>> fetchUserModel(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((model) => UserModel.fromJson(model)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user models');
  }
}

class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      website: json["website"],
    );
  }
}

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late final Future<List<UserModel>> futureUsers;
  

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUserModel(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'List User',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List User'),
        ),
        body: FutureBuilder<List<UserModel>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text("Loading ...."),
              );
            } else {
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text("Tidak ada data"),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Text((index + 1).toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(snapshot.data![index].username),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
