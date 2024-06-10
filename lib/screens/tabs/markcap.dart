import 'package:flutter/material.dart';
import 'package:cryptocurrency/model/crypto.dart';

class MarkCap extends StatelessWidget {
  final List<Coin> coins;

  MarkCap({required this.coins});

  final List<String> profileImages = [
    "images/bitcoin.png",
    "images/eth.png",
    "images/usdt.png",
    "images/bnb.png",
    "images/solana.png",
    "images/usd.png",
    "images/xrpcoin.png",
    "images/dogecoin.png",
    "images/cardano.png",
    "images/shiba.png",
  ];

  String formatMarketCap(double marketCap) {
    if (marketCap >= 1e12) {
      return (marketCap / 1e12).toStringAsFixed(1) + 'T';
    } else if (marketCap >= 1e9) {
      return (marketCap / 1e9).toStringAsFixed(1) + 'B';
    } else if (marketCap >= 1e6) {
      return (marketCap / 1e6).toStringAsFixed(1) + 'M';
    } else if (marketCap >= 1e3) {
      return (marketCap / 1e3).toStringAsFixed(1) + 'K';
    }
    return marketCap.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coins.length,
      itemBuilder: (context, index) {
        final item = coins[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 40,
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(profileImages[index % profileImages.length]),
            ),
          ),
          title: Text(
            item.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            formatMarketCap(item.price),
            style: TextStyle(color: Colors.white),
          ),
          trailing: Text(
            formatMarketCap(item.market_cap),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        );
      },
    );
  }
}
