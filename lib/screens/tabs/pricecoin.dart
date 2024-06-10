import 'package:flutter/material.dart';
import 'package:cryptocurrency/model/crypto.dart';

class PriceTab extends StatelessWidget {
  final List<Coin> coins;
  
  PriceTab({required this.coins});

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

  String formatPrice(double price) {
    if (price >= 1000) {
      return (price / 1000).toStringAsFixed(1) + 'k';
    }
    return price.toStringAsFixed(2);
  }

  Color determineColor(double change) {
    return change < 0 ? Colors.red : Colors.green;
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
              child: Image.asset(profileImages[index]),
            ),
          ),
          title: Text(
            item.name.toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            formatPrice(item.price),
            style: TextStyle(color: Colors.white),
          ),
          trailing: Text(
            item.volume_change_24h.toString(),
            style: TextStyle(
              color: determineColor(item.volume_change_24h),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        );
      },
    );
  }
}
