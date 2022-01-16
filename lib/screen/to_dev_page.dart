import 'package:flutter/material.dart';

class ToDev extends StatelessWidget {
  const ToDev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Sorry This Page is in Developpement',
        style: TextStyle(color: Colors.red, fontSize: 20),
        textAlign: TextAlign.center,
      )),
    );
  }
}
