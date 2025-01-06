## Preview
![image](https://github.com/user-attachments/assets/5b24c8e8-2f54-480a-b7a5-cfb6e4a6b31d)
## User Class
```dart
class User {
  String username;
  String password;
  String role;

  User({required this.username, required this.password, required this.role});
}
```

## User Object
```dart
import 'user.dart';

final List<User> users = [
  User(username: 'user1', password: 'pass1', role: 'admin'),
  User(username: 'user2', password: 'pass2', role: 'user'),
  User(username: 'user3', password: 'pass3', role: 'guest'),
  User(username: 'user4', password: 'pass4', role: 'admin'),
  User(username: 'user5', password: 'pass5', role: 'user'),
];
```

## Main
```dart
import 'package:flutter/material.dart';
// import 'user.dart';
import 'user_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kiem tra Giua Ky'),
          backgroundColor: Colors.blueAccent, 
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blueAccent, 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Username: ${users[index].username}', style: TextStyle(color: Colors.white)),
                  Text('Role: ${users[index].role}', style: TextStyle(color: Colors.white)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
```
