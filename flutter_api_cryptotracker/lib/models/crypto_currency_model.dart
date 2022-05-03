import 'package:flutter/foundation.dart';

class CryptoCurrencyModel {
  String? id;
  String? symbol;
  String? name;
  String? image;
  var currentPrice;
  var marketCap;
  int? marketCapRank;
  var high24;
  var low24;
  double? priceChange24;
  double? priceChangePercent24;
  double? circulatingSupply;
  double? ath;
  double? alt;

  CryptoCurrencyModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.high24,
    required this.low24,
    required this.priceChange24,
    required this.priceChangePercent24,
    required this.circulatingSupply,
    required this.ath,
    required this.alt
  });

  factory CryptoCurrencyModel.fromJson(Map map)
  {
    return CryptoCurrencyModel(
        id: map['id'],
        symbol: map['symbol'],
        name: map['name'],
        image: map['image'],
        currentPrice: map['current_price'],
        marketCap: map['market_cap'],
        marketCapRank: map['market_cap_rank'],
        high24: map['high_24h'],
        low24: map['low_24h'],
        priceChange24: map['price_change_24h'],
        priceChangePercent24: map['price_change_percentage_24h'],
        circulatingSupply: map['19029418'],
        ath: map['69045'],
        alt: map['67.81'],
    );
  }
}