class Coin {
  final int id;
  final String name;
  final String symbol;
  final double volume_change_24h;
  final double market_cap;
  final double price;
  final double percent_change_1h;
  final double market_cap_dominance; //three terms
  // final  int circulatingSupply;

final List tags;
  
  Coin({
    required this.id,
    required this.name,
     required this.price,
    required this.symbol,
    required this.volume_change_24h,
    required this.market_cap,
    required this.percent_change_1h,
    required this.market_cap_dominance,
    // required this.circulatingSupply
   required this.tags

   
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      tags: json['tags'],
      // circulatingSupply: json['circulating_supply'],
    
     volume_change_24h: json['quote']['USD']['volume_change_24h'],
      market_cap: json['quote']['USD']['market_cap'],
       price: json['quote']['USD']['price'],
       //market_cap_dominance
       percent_change_1h: json['quote']['USD']['percent_change_1h'],
       market_cap_dominance: json['quote']['USD']['market_cap_dominance'],
       
    
    );
  }
}