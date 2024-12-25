import 'dart:math';
String _generateRandomString(int length) {
  const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  Random rng = Random();
  return List.generate(length, (index) => chars[rng.nextInt(chars.length)]).join();
}


class KeyPair {
  String public;
  String private;

  KeyPair({required this.public, required this.private});

  static KeyPair generate() {
    String publicKey = _generateRandomString(32);  
    String privateKey = _generateRandomString(64);
    return KeyPair(public: publicKey, private: privateKey);
  }
}

class Network {

}

class Wallet {
  KeyPair keyPair; 

  Wallet({required this.keyPair});
}

class WalletManager {
  List<Wallet> wallets = []; 

  void createWallet() {
    KeyPair keyPair = KeyPair.generate();
    Wallet wallet = Wallet(keyPair: keyPair); 
    wallets.add(wallet);

    print('Wallet created with public key: ${keyPair.public}');
  }

  void importPrivateKey(String privateKey) {
    KeyPair keyPair = KeyPair(public: '', private: privateKey);
    Wallet wallet = Wallet(keyPair: keyPair);
    wallets.add(wallet);
  }

  void sendTransaction(Wallet sender, Wallet receiver, double amount) {
    String signature = TransactionSigner().signTransaction("send", sender.keyPair.private);
    String signDate = DateTime.now().toString();
    Transaction transaction = Transaction(sender: sender, receiver: receiver, amount: amount, signature: signature, signDate: signDate);
    transaction.showTransaction();
  }
}

class TransactionSigner {
  String signTransaction(String message, String privateKey) {
    return 'signature';
  }
}

class Transaction {
  Wallet sender;
  Wallet receiver;
  String signature = '';
  String signDate = '';
  double amount;
  String txId = '';

  Transaction({required this.sender, required this.receiver, required this.amount, this.signature = '', this.signDate = ''}) {
    txId = _generateTxId();
  }

  void showTransaction() {
    print('Transaction ID: $txId');
    print('From: $sender');
    print('To: $receiver');
    print('Amount: \$${amount}');
    print('Signature: $signature');
    print('Date: $signDate');
  }

  String _generateTxId() {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String randomString = _generateRandomString(8); 
    return '$timestamp-$randomString';
  }
}

void main() {
  WalletManager walletManager = WalletManager();
  walletManager.createWallet(); 

  Wallet sender = walletManager.wallets[0];
  Wallet receiver = Wallet(keyPair: KeyPair(public: 'receiverPublicKey', private: ''));
  walletManager.sendTransaction(sender, receiver, 10.0);
}
