import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gnac_caculator/data/colors_app.dart';
import 'package:gnac_caculator/screen/classique_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int id = 0;
  @override
  Widget build(BuildContext context) {
    //Force the layout to Portrait Mode
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculatrice Scientifique',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: ePcolor),
        primaryColor: ePcolor,
        fontFamily: 'Montserrat-Regular',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: ePcolor),
        ),
      ),
      home: const Classique(),
    );
  }
}
