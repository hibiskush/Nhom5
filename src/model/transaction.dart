import 'wallet.dart';
import '../utils/random_string.dart'; // Add this import

class Transaction {
  Wallet sender;
  Wallet receiver;
  String signature = '';
  String signDate = '';
  double amount;
  String txId = '';

  Transaction({
    required this.sender,
    required this.receiver,
    required this.amount,
    this.signature = '',
    this.signDate = '',
  }) {
    txId = _generateTxId();
  }

  void showTransaction() {
    print('Transaction ID: $txId');
    print('From: ${sender.keyPair.public}');
    print('To: ${receiver.keyPair.public}');
    print('Amount: \$${amount}');
    print('Signature: $signature');
    print('Date: $signDate');
  }

  String _generateTxId() {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String randomString = Crypto.generateRandomString(6);
    return '$timestamp-$randomString';
  }
}
