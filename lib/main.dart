
import 'package:cryptocurrency/model/cartmodel.dart';
import 'package:cryptocurrency/screens/homescr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );

    return ChangeNotifierProvider(
      
      create: (context) => CartModel(),
      
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
    
      home:  HomeScr())
    );
  }
}
