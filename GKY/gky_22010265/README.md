## User Class

```dart
class User {
  final String _username;
  final String _password;
  final String _role;

  User({required String username, required String password, required String role}): 
        _username = username,
        _password = password,
        _role = role;

  String get username => _username;
  String get password => _password;
  String get role => _role;
}
```

## User Objects

```dart
final List<User> users = [
  User(username: 'Minh', password: '123', role: 'Admin'),
  User(username: 'Duong', password: '3445', role: 'User'),
  User(username: 'Dung', password: '22c', role: 'User'),
  User(username: 'Anon1', password: 'None', role: 'Guess'),
  User(username: 'Anon2', password: 'None', role: 'Guess'),
];
```

## Gallery
![af252d14-f5e7-47c9-a8b6-cb6387e69881](https://github.com/user-attachments/assets/69085547-d890-4135-8823-355c138e2908)

