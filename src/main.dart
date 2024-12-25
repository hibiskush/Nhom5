import 'services/wallet_manager.dart';
import 'model/wallet.dart';
import 'model/key_pair.dart';

void main() {
  WalletManager walletManager = WalletManager();
  walletManager.createWallet();

  Wallet sender = walletManager.wallets[0];
  Wallet receiver = Wallet(keyPair: KeyPair(public: 'receiverPublicKey', private: ''));
  walletManager.sendTransaction(sender, receiver, 10.0);
}
