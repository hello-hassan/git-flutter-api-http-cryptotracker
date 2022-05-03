import 'dart:convert';

import 'package:http/http.dart' as http;

class Api
{
  static String _uri = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

  static Future<List<dynamic>> getMarkets() async
  {
    var response = await http.get(Uri.parse(_uri));
    var decodedResponse = jsonDecode(response.body);

    List<dynamic> markets = decodedResponse as List<dynamic>;
    return markets;
  }
}