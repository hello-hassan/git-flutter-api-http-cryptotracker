import 'package:flutter/material.dart';
import 'package:flutter_api_cryptotracker/models/crypto_currency_model.dart';
import 'package:flutter_api_cryptotracker/providers/market_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Crypto Market Now',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20,),

              Expanded(
                child: Consumer<MarketProvider>(
                  builder: (context, marketProvider, child) {
                    if(marketProvider.isLoading == true)
                    {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else
                    {
                      if(marketProvider.markets.length > 0)
                      {
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: marketProvider.markets.length,
                          itemBuilder: (context, index) {
                            CryptoCurrencyModel cryptoCurrency = marketProvider.markets[index];
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.network(cryptoCurrency.image!),
                              ),
                              title: Text('${cryptoCurrency.name!} #${cryptoCurrency.marketCapRank}'),
                              subtitle: Text(cryptoCurrency.symbol!.toUpperCase()),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '\$${cryptoCurrency.currentPrice!.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: Colors.blue[500],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),

                                  Builder(
                                    builder: (context) {
                                      var priceChange = cryptoCurrency.priceChange24;
                                      var priceChangePercent = cryptoCurrency.priceChangePercent24;

                                      Color color = Colors.red;
                                      String sign = '';

                                      if(priceChange! < 0)
                                      {
                                        color = Colors.red;
                                        sign = '';
                                      }
                                      else
                                      {
                                        color = Colors.green;
                                        sign = '+';
                                      }

                                      return Text(
                                        '${sign}${priceChangePercent!.toStringAsFixed(4)}% (\$${priceChange.toStringAsFixed(2)})',
                                        style: TextStyle(
                                          color: color,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      else
                      {
                        return Text('No data found!');
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
