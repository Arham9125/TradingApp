import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Boxes extends StatelessWidget {

  String imagename;
  String sybmol;
  String coinname;
  String price;
  String coinup;


  Boxes({required this.imagename, required this.sybmol, required this.coinname, required this.price, required this.coinup});


  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 180,
      width: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 27, 37, 42),
      ),
      child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white60, width: 0.5)),
                  child: Image.asset(
                    imagename,
                    height: 50,
                    color: Color.fromARGB(255, 41, 60, 69),
                  )),
            ),
            Column(
              children: [
                Text(
                  sybmol,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white60,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                 coinname,
                  style: TextStyle(color: Colors.white54),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
          child: 
          LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
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
                    FlSpot(2, 1.4),
                  ],
                  isCurved: false,
                  color: Colors.white,
                  barWidth: 0.2,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(
                      show: true, color: Color.fromARGB(255, 41, 60, 69)),
                ),
              ],
              lineTouchData: LineTouchData(enabled: false),
            ),
          ),
        ),
      
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    price,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "0.098 BTC",
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Text(
                coinup,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ]),
    );
 
 
  }
}
