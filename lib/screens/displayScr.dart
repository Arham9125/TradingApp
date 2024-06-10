import 'package:cryptocurrency/model/cartmodel.dart';
import 'package:cryptocurrency/model/crypto.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PriceGraph extends StatefulWidget {
  
final Coin c;

PriceGraph({ required this.c});

  @override
  State<PriceGraph> createState() => _PriceGraphState();
}

class _PriceGraphState extends State<PriceGraph> {
  String formatPrice(double price) {
    if (price >= 1000) {
      return (price / 1000).toStringAsFixed(1) + 'k';
    }
    return price.toStringAsFixed(2);
  }
bool isFavorite = false;
   bool onclick = false;

Widget boxes(String text){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 6, 44, 61),
      foregroundColor: Colors.white
    ),
    onPressed: (){},
    child: Center(child: Text(text, style: TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500
        
    ),)),
  );
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

   Widget views(String txt, String supp){

    
     return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(txt, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500

                        ),
                        
                        )
                        ,
                        Text(supp,style:  TextStyle(
                          
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20

                        ),)
                      ],
                    ),
                  );

                
   }

   final List<String> boxesname = [
    "1H",
    "8H",
    "1D",
    "1W",
    "1M",
    "3M",
   ];

  @override
  Widget build(BuildContext context) {
    String? imageurl = coinImageMap[widget.c.symbol];
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 11, 28, 53),
    
      body: 
       Consumer<CartModel>(builder: (context, value, child) {
         return  Column(
        
          children: [
// name of the coin + starto favourite + backbutton
         Expanded(
           child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
             return    Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }
                    , icon:   Icon(Icons.arrow_back_ios, size: 25, color: Colors.white60,)),
                            
                      Row(
                        children: [
                        
                    Image.asset(imageurl.toString(), height: 30,),
                       SizedBox(width: 5,),
                          Text(
                      widget.c.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                           
                        ],
                      ),
                 
       IconButton(
  onPressed: () {

 
    setState(() {
      isFavorite = !isFavorite; 
    });
     if (isFavorite) {
                        Provider.of<CartModel>(context, listen: false).addtocart(widget.c);
                      } else {
                        Provider.of<CartModel>(context, listen: false).addtocart(widget.c);
                      }
                    
   
  },
  icon: Icon(
    Icons.star,
    size: 30,
    color: isFavorite ? Colors.yellow : Colors.white70,
  ),
)
  
                    ],
                  ),
                  SizedBox(height: 20,),

                  //price and percent box
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
   children: [
     Padding(
                                            padding: const EdgeInsets.only(left: 30),
                                            child: Text(
                                            "\$${widget.c.price.toStringAsFixed(2)}",
                                              style: TextStyle(color: Colors.white, 
                                              fontSize: 27,
                                              fontWeight: FontWeight.bold),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20),
                                            child: Container(
                                              width: 80,
                                              decoration: BoxDecoration(
                                                color: widget.c.percent_change_1h.isNegative ? Colors.red : Colors.green,
                                                borderRadius: BorderRadius.circular(20)
                                            
                                            
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    
                                                    widget.c.percent_change_1h.isNegative ?Icons.arrow_drop_down_sharp: Icons.arrow_drop_up ,
                                                    color: Colors.white 
                                                 ),
                                                  Text("${widget.c.percent_change_1h.toStringAsFixed(2)} %", style: TextStyle(
                                                    color: Colors.white
                                                  ),),
                                                ],
                                              ),
                                            ),
                                          )
   ],
 ),
 //boxes
 SizedBox(height: 10,),
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
   
    children: List.generate(boxesname.length, (index) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: boxes(boxesname[index]),
    )),
  ),
),
SizedBox(height: 10,),
//graphhs
 Stack(
              children: [
                AspectRatio(
                  aspectRatio: 2,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: true),
                      titlesData: FlTitlesData(show: true),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 1),
                            FlSpot(1, 1.5),
                            FlSpot(2, 1.4),
                            FlSpot(3, 3.4),
                            FlSpot(4, 2.6),
                          ],
                          isCurved: true,
                          color: Colors.white,
                          barWidth: 1,
                          isStrokeCapRound: true,
                          belowBarData: BarAreaData(
                            show: true,
                          
                          ),
                        ),
                      ],
                      lineTouchData: LineTouchData(enabled: false),
                    ),
                  ),
                ),
                Positioned(
                  right: 60,
                  top: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      
                        SizedBox(height: 50),
                      Text(
                        "\$${formatPrice(widget.c.volume_change_24h)}", // Replace with actual highest price logic
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      
                      Text(
                        "\$${widget.c.price.toStringAsFixed(2)}",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      
                      Text(
                        "${widget.c.percent_change_1h.toStringAsFixed(2)} %",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text("Trading History", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20)),
            ),

            SizedBox(height: 10,),

   Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10 ),
  child: Card(
    color: Color.fromARGB(255, 5, 48, 68),
    child: ListTile(
      leading: CircleAvatar(
        radius: 20,
        child: Icon(widget.c.percent_change_1h.isNegative ? Icons.u_turn_left : Icons.arrow_downward),
      ),
      title: Text(
        widget.c.percent_change_1h.isNegative ? "Sell" : "Buy",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      trailing: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Container(
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(
                widget.c.percent_change_1h.isNegative ? Icons.arrow_drop_down_sharp : Icons.arrow_drop_up,
                color: Colors.white,
              ),
              Text(
                "${widget.c.percent_change_1h.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              
            ],
          ),
        ),
      ),
         subtitle: Text(widget.c.symbol, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),),
    ),
  ),
),



               ],
             );
           
           }),
         )
        
 

  


       ],
        );
   
   
       },)
   



    );
  }
}
