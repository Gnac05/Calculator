// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gnac_caculator/widgets/textfield.dart';

class Det extends StatefulWidget {
  const Det({Key? key}) : super(key: key);

  @override
  State<Det> createState() => _DetState();
}

bool result = false;

double a1 = 0;
double b1 = 0;
double c1 = 0;
double a2 = 0;
double b2 = 0;
double c2 = 0;
double a3 = 0;
double b3 = 0;
double c3 = 0;

List matrice = [
  [a1, b1, c1],
  [a2, b2, c2],
  [a3, b3, c3]
];

TextEditingController A1 = TextEditingController();
TextEditingController B1 = TextEditingController();
TextEditingController C1 = TextEditingController();
TextEditingController A2 = TextEditingController();
TextEditingController B2 = TextEditingController();
TextEditingController C2 = TextEditingController();
TextEditingController A3 = TextEditingController();
TextEditingController B3 = TextEditingController();
TextEditingController C3 = TextEditingController();

onSave() {
  a1 = double.parse(A1.text);
  b1 = double.parse(B1.text);
  c1 = double.parse(C1.text);
  a2 = double.parse(A2.text);
  b2 = double.parse(B2.text);
  c2 = double.parse(C2.text);
  a3 = double.parse(A3.text);
  b3 = double.parse(B3.text);
  c3 = double.parse(C3.text);
}

class _DetState extends State<Det> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //ligne 1
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: CustomTextFieldNumber(
                                text: 'a1', controller_: A1)),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: CustomTextFieldNumber(
                                text: 'b1', controller_: B1)),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: CustomTextFieldNumber(
                                text: 'c1', controller_: C1)),
                      ],
                    ),
                  ),

                  //ligne 2
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: CustomTextFieldNumber(
                                text: 'a2', controller_: A2)),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: CustomTextFieldNumber(
                                text: 'b2', controller_: B2)),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: CustomTextFieldNumber(
                                text: 'c2', controller_: C2)),
                      ],
                    ),
                  ),

                  //ligne3
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: CustomTextFieldNumber(
                                text: 'a3', controller_: A3)),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: CustomTextFieldNumber(
                                text: 'b3', controller_: B3)),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: CustomTextFieldNumber(
                                text: 'c3', controller_: C3)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          result
              ? Expanded(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${determinant(matrice)}',style: TextStyle(fontSize: 50),),
                  ],
                ))
              : const Expanded(
                  child: Text(''),
                ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 75),
              child: ElevatedButton(
                  onPressed: () {
                    onSave();
                    print(result);
                    result = true;
                  },
                  child: const Text(
                    'Resolution',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            flex: 2,
          )
        ],
      ),
    );
  }
}

double determinant(List matrice) {
  if (matrice.length == 2) {
    return (matrice[0][0] * matrice[1][1] - matrice[0][1] * matrice[1][0]);
  } else {
    double det = 0;
    for (var i = 0; i < matrice.length; i++) {
      det +=
          (matrice[0][i] * pow(-1, 2 + i) * determinant(modif(matrice, 0, i)));
    }
    return det;
  }
}

List modif(List matrice, int lign, int column) {
  List new_lign = [];
  List to_conserve = [];
  List new_matrice = [];
  new_matrice = matrice.sublist(0);
  for (var i = 0; i < new_matrice.length; i++) {
    new_lign = new_matrice[i];
    to_conserve = new_lign.sublist(0);
    to_conserve.removeAt(column);
    new_matrice[i] = to_conserve.sublist(0);
  }
  new_matrice.removeAt(lign);
  return new_matrice;
}
