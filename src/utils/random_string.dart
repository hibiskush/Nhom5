import 'dart:math';

class Crypto {
  static String generateRandomString(int length) {
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random rng = Random();
    return List.generate(length, (index) => chars[rng.nextInt(chars.length)]).join();
  }
}