import 'dart:math';
import '../utils/random_string.dart';

class KeyPair {
  String public;
  String private;

  KeyPair({required this.public, required this.private});

  static KeyPair generate() {
    String publicKey = Crypto.generateRandomString(32); 
    String privateKey = Crypto.generateRandomString(64);
    return KeyPair(public: publicKey, private: privateKey);
  }
}
