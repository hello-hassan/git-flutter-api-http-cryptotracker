import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_api_cryptotracker/Api.dart';
import 'package:flutter_api_cryptotracker/models/crypto_currency_model.dart';

class MarketProvider with ChangeNotifier
{
  bool isLoading = true;
  List<CryptoCurrencyModel> markets = [];

  MarketProvider()
  {
    fetchData();
  }

  void fetchData() async
  {
    List<dynamic> _markets = await Api.getMarkets();
    markets.clear();
    _markets.forEach((element) {
      CryptoCurrencyModel cryptoCurrency = CryptoCurrencyModel.fromJson(element);
      markets.add(cryptoCurrency);
    });
    isLoading = false;
    notifyListeners();

    Timer(Duration(seconds: 2), () {
      fetchData();
    });
  }

  getMarketByID(String id)
  {
    CryptoCurrencyModel cryptoCurrency = markets.where((element) => element.id == id).toList()[0];
    return cryptoCurrency;
  }
}