import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<UserModel> fetchUserModel(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return UserModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class UserModel {
    int userId;
    int id;
    String title;
    bool completed;

    UserModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}


class List extends StatefulWidget {
  const List({super.key});

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  late final Future<UserModel> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchUserModel(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<UserModel>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}