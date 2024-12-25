import 'key_pair.dart';

class Wallet {
  KeyPair keyPair;
  double balance = 0;
  
  Wallet({required this.keyPair});
}
