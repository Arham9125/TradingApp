import 'package:cryptocurrency/screens/displayScr.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrency/model/crypto.dart';

class ChangeIn24 extends StatelessWidget {
  final List<Coin> coins;

  ChangeIn24({required this.coins});

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
        final coin = coins[index];
        return ListTile(
          leading: GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PriceGraph(c: coin,);
              }));
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.yellow.shade400,
              child: Text(coin.symbol.toString()),
            ),
          ),
          title: Text(
            coin.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "\$${formatPrice(coin.price)}",
            style: TextStyle(color: Colors.white),
          ),
          trailing: Text(
            "${coin.volume_change_24h.toStringAsFixed(2)}%",
            style: TextStyle(
              color: determineColor(coin.volume_change_24h),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        );
      },
    );
  }
}
