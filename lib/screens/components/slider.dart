import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MySlider extends StatelessWidget {
  const MySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return   
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                      height: 180,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Colors.white),
                                    image: DecorationImage(image: AssetImage("images/cback.jpeg"), fit: BoxFit.cover),
                                   
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      
                                      SizedBox(height: 30,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 30),
                                        child: Text(
                                          "Balance ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white54),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 30),
                                        child: Text(
                                          "\$4,068.79",
                                          style: TextStyle(color: Colors.white, 
                                          fontSize: 27,
                                          fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      
                                      SizedBox(height: 30,),
                                      
                                       Padding(
                                        padding: const EdgeInsets.only(left: 30),
                                        child: Text(
                                          "Profit Today",
                                          style: TextStyle(color: Colors.white54, 
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                     
                                       Padding(
                                        padding: const EdgeInsets.only(left: 30),
                                        child: Text(
                                          "\$201.02",
                                          style: TextStyle(color: Colors.white, 
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              );
                            
                          
                          
    
                     
                     
  }
}