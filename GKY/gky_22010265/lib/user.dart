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