import 'dart:convert';
import 'package:http/http.dart' as http;

class CoinGeckoService {
  final String baseUrl = "https://api.coingecko.com/api/v3";

  Future<double?> getCryptoPrice(String cryptoId, String currency) async {
    final url = Uri.parse("$baseUrl/simple/price?ids=$cryptoId&vs_currencies=$currency");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data[cryptoId]?[currency] as num?)?.toDouble();
    } else {
      throw Exception("Failed to fetch crypto price: ${response.statusCode}");
    }
  }

  Future<double?> getCryptoPriceChange(String cryptoId, String currency) async {
    final url = Uri.parse("$baseUrl/simple/price?ids=$cryptoId&vs_currencies=$currency&include_24hr_change=true");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data[cryptoId]?["usd_24h_change"] as num?)?.toDouble();
    } else {
      throw Exception("Failed to fetch crypto price: ${response.statusCode}");
    }
  }
}
