import 'services/wallet_manager.dart';
import 'model/wallet.dart';

void main() {
  WalletManager walletManager = WalletManager();
  walletManager.createWallet();
  walletManager.createWallet();

  Wallet sender = walletManager.wallets[0];
  Wallet receiver = walletManager.wallets[1];
  walletManager.sendTransaction(sender, receiver, 10.0);
}
