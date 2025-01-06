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
