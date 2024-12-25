import '../model/wallet.dart';
import '../model/transaction.dart';
import '../services/transaction_signer.dart';
import '../model/key_pair.dart';

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
