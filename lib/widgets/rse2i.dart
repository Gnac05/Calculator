 import 'package:flutter/material.dart';

Widget solution(double a,double b,double c,double d,double e,double f) {
    return Scaffold(
      appBar: AppBar(title:const Text('Solution'),),
      body: Center(
        child: Column(
          children: [
          const  SizedBox(height: 20,),
           const Text('Le systeme suivant', style: TextStyle(fontSize: 20)),
              Text('|${a}x + ${b}y = $c', style:const TextStyle(fontSize: 20)),
              Text('|${d}x + ${e}y = $f', style:const TextStyle(fontSize: 20)),
              const SizedBox(height: 20,),
            const  Text("A pour solutions ", style: TextStyle(fontSize: 20)),const SizedBox(height: 20,),
                   Text('x = ${(c*e-b*f)/(a*e-b*d)}', style:const TextStyle(fontSize: 20)),
            const SizedBox(height: 10,),
                   Text('y = ${(a*f-d*c)/(a*e-b*d)}', style:const TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
