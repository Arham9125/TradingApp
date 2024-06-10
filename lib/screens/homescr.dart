import 'dart:convert';
import 'package:cryptocurrency/model/cartmodel.dart';
import 'package:cryptocurrency/model/crypto.dart';
import 'package:cryptocurrency/screens/components/boxes.dart';
import 'package:cryptocurrency/screens/components/slider.dart';
import 'package:cryptocurrency/screens/displayScr.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScr extends StatefulWidget {
  static const String apikey = "d4b26eec-5083-4517-bf8a-4ba1097ddd8e";
  static const String url =
      "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=10&convert=USD";

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  Future<List<Coin>> fetchCoins() async {
    final Map<String, String> headers = {
      'X-CMC_PRO_API_KEY': HomeScr.apikey,
      'Accepts': 'application/json'
    };

    final Uri uri = Uri.parse(HomeScr.url);
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<Coin> coins = data.map((e) => Coin.fromJson(e)).toList();
      return coins;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  final Map<String, String> coinImageMap = {
    "BTC": "images/bitcoin.png",
    "ETH": "images/eth.png",
    "USDT": "images/usdt.png",
    "BNB": "images/bnb.png",
    "SOL": "images/solana.png",
    "USDC": "images/usd.png",
    "XRP": "images/xrpcoin.png",
    "Doge": "images/dogecoin.png",
    "TON": "images/cardano.png",
    "ADA": "images/shiba.png",
  };
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


  @override
  Widget build(BuildContext context) {
                          

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 26, 37),
      body: SafeArea(
        child: FutureBuilder<List<Coin>>(
          future: fetchCoins(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No data available'));
            } else {
              List<Coin> coins = snapshot.data!;
                                  

              return CustomScrollView(
                
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            "Welcome",
                            style: GoogleFonts.abel(
                              textStyle: TextStyle(
                                color: Colors.white60,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Arham Khan !",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage("images/mas.png"),
                              ),
                            ),
                          ],
                        ),
                        MySlider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Text(
                            "My Portfolio",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: coins.length,
                        itemBuilder: (context, index) {
                          var mydata = coins[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                  return PriceGraph(c: mydata);
                                }));
                              },
                              child: Boxes(
                                imagename: profileImages[index],
                                sybmol: mydata.symbol,
                                coinname: mydata.name,
                                price: "\$${mydata.price.toStringAsFixed(2)}",
                                coinup: "${mydata.percent_change_1h.toStringAsFixed(2)}%",
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Favourite",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
               Consumer<CartModel>(
  builder: (context, cart, child) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          
          var mydata = cart.cartitems[index];
          String imageAsset = coinImageMap[mydata.symbol] ?? "images/default.png"; // Default image if symbol not found
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 3, 39, 55),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              leading: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return PriceGraph(c: mydata);
                  }));
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage(imageAsset),
                ),
              ),
              title: Text(mydata.symbol, style: TextStyle(color: Colors.white)),
              subtitle: Text(mydata.name, style: TextStyle(color: Colors.white70)),
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("\$${mydata.price.toStringAsFixed(2)}", style: TextStyle(color: Colors.white)),
                    Text(mydata.percent_change_1h.toStringAsFixed(2), style: TextStyle(color: mydata.percent_change_1h.isNegative ? Colors.red : Colors.green)),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: cart.cartitems.length,
      ),
    );
  },
),

              
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
