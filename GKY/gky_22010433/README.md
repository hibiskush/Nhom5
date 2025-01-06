# gky_22010433

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
##Anh

## code chính 
```
import 'dart:math'; // Để tạo màu ngẫu nhiên
import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid with Random Colors',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'UserApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<User> users = [
    User(username: 'Phu', password: '123', role: 'Admin'),
    User(username: 'Dang Minh', password: '35', role: 'User'),
    User(username: 'Dung', password: '2777', role: 'Manager'),
    User(username: 'Thanh', password: '33100', role: 'User'),
    User(username: 'Nam', password: '2313', role: 'User'),
  ];

  Color getRandomColor() {
    final Random random = Random();

    int r = random.nextInt(256);
    int g = random.nextInt(256);
    int b = random.nextInt(256);

    if (r == 255 && g == 255 && b == 255) {
      r = random.nextInt(255);
      g = random.nextInt(255);
      b = random.nextInt(255);
    }

    return Color.fromRGBO(r, g, b, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 2,
          ),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final randomColor = getRandomColor(); // Màu ngẫu nhiên cho mỗi user
            return Card(
              color: randomColor, // Màu ngẫu nhiên
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username: ${user.username}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Role: ${user.role}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
![Image](<<img width="297" alt="Ảnh màn hình 2025-01-06 lúc 15 17 41" src="https://github.com/user-attachments/assets/bd45dd0b-b238-40b5-885b-8149cd2021e5" />
>)
