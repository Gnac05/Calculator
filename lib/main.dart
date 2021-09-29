import 'package:flutter/material.dart';
import 'package:gnac_caculator/screen/classique_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Caculator',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const Classique(),
    );
  }
}

