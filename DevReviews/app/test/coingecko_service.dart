import 'package:wallet/services/coingecko_services.dart';

void main() async {
  final coinGeckoService = CoinGeckoService();
  final market = await coinGeckoService.getCryptoPrice("ethereum", "usd");
  print(market);
}