import 'package:flutter/material.dart';

class User {
  String username;
  String password;
  String role;

  User({required this.username, required this.password, required this.role});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<User> users = [
    User(username: 'user1', password: 'pass1', role: 'admin'),
    User(username: 'user2', password: 'pass2', role: 'user'),
    User(username: 'user3', password: 'pass3', role: 'guest'),
    User(username: 'user4', password: 'pass4', role: 'admin'),
    User(username: 'user5', password: 'pass5', role: 'user'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('User Grid')),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Username: ${users[index].username}'),
                  Text('Role: ${users[index].role}'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
