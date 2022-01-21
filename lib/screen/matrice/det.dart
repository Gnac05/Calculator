// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison, unused_import
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';
import 'package:gnac_caculator/data/colors_app.dart';
import 'package:gnac_caculator/screen/matrice/matrice.dart';
import 'package:gnac_caculator/widgets/alert_dialog_error.dart';
import 'package:gnac_caculator/widgets/textfield.dart';
import 'mat_size.dart';

class Det extends StatefulWidget {
  const Det({Key? key}) : super(key: key);
  @override
  State<Det> createState() => _DetState();
}

void reinitialize() {
  A1 = TextEditingController();
  B1 = TextEditingController();
  C1 = TextEditingController();
  D1 = TextEditingController();
  E1 = TextEditingController();
  A2 = TextEditingController();
  B2 = TextEditingController();
  C2 = TextEditingController();
  D2 = TextEditingController();
  E2 = TextEditingController();
  A3 = TextEditingController();
  B3 = TextEditingController();
  C3 = TextEditingController();
  D3 = TextEditingController();
  E3 = TextEditingController();
  A4 = TextEditingController();
  B4 = TextEditingController();
  C4 = TextEditingController();
  D4 = TextEditingController();
  E4 = TextEditingController();
  A5 = TextEditingController();
  B5 = TextEditingController();
  C5 = TextEditingController();
  D5 = TextEditingController();
  E5 = TextEditingController();
}

double a1 = 0;
double b1 = 0;
double c1 = 0;
double d1 = 0;
double e1 = 0;
double a2 = 0;
double b2 = 0;
double c2 = 0;
double d2 = 0;
double e2 = 0;
double a3 = 0;
double b3 = 0;
double c3 = 0;
double d3 = 0;
double e3 = 0;
double a4 = 0;
double b4 = 0;
double c4 = 0;
double d4 = 0;
double e4 = 0;
double a5 = 0;
double b5 = 0;
double c5 = 0;
double d5 = 0;
double e5 = 0;

List<List> mat2x2 = [
  [a1, b1],
  [a2, b2]
];

List<List> mat3x3 = [
  [a1, b1, c1],
  [a2, b2, c2],
  [a3, b3, c3]
];

List<List> mat4x4 = [
  [a1, b1, c1, d1],
  [a2, b2, c2, d2],
  [a3, b3, c3, d3],
  [a4, b4, c4, d4]
];

List<List> mat5x5 = [
  [a1, b1, c1, d1, e1],
  [a2, b2, c2, d2, e2],
  [a3, b3, c3, d3, e3],
  [a4, b4, c4, d4, e4],
  [a5, b5, c5, d5, e5]
];

TextEditingController A1 = TextEditingController();
TextEditingController B1 = TextEditingController();
TextEditingController C1 = TextEditingController();
TextEditingController D1 = TextEditingController();
TextEditingController E1 = TextEditingController();
TextEditingController A2 = TextEditingController();
TextEditingController B2 = TextEditingController();
TextEditingController C2 = TextEditingController();
TextEditingController D2 = TextEditingController();
TextEditingController E2 = TextEditingController();
TextEditingController A3 = TextEditingController();
TextEditingController B3 = TextEditingController();
TextEditingController C3 = TextEditingController();
TextEditingController D3 = TextEditingController();
TextEditingController E3 = TextEditingController();
TextEditingController A4 = TextEditingController();
TextEditingController B4 = TextEditingController();
TextEditingController C4 = TextEditingController();
TextEditingController D4 = TextEditingController();
TextEditingController E4 = TextEditingController();
TextEditingController A5 = TextEditingController();
TextEditingController B5 = TextEditingController();
TextEditingController C5 = TextEditingController();
TextEditingController D5 = TextEditingController();
TextEditingController E5 = TextEditingController();

onSave() {
  switch (groupValueDet) {
    case 0:
      a1 = double.parse(A1.text);
      b1 = double.parse(B1.text);
      a2 = double.parse(A2.text);
      b2 = double.parse(B2.text);
      mat2x2 = [
        [a1, b1],
        [a2, b2]
      ];
      break;
    case 1:
      a1 = double.parse(A1.text);
      b1 = double.parse(B1.text);
      c1 = double.parse(C1.text);
      a2 = double.parse(A2.text);
      b2 = double.parse(B2.text);
      c2 = double.parse(C2.text);
      a3 = double.parse(A3.text);
      b3 = double.parse(B3.text);
      c3 = double.parse(C3.text);
      mat3x3 = [
        [a1, b1, c1],
        [a2, b2, c2],
        [a3, b3, c3]
      ];
      break;
    case 2:
      a1 = double.parse(A1.text);
      b1 = double.parse(B1.text);
      c1 = double.parse(C1.text);
      d1 = double.parse(D1.text);
      a2 = double.parse(A2.text);
      b2 = double.parse(B2.text);
      c2 = double.parse(C2.text);
      d2 = double.parse(D2.text);
      a3 = double.parse(A3.text);
      b3 = double.parse(B3.text);
      c3 = double.parse(C3.text);
      d3 = double.parse(D3.text);
      a4 = double.parse(A4.text);
      b4 = double.parse(B4.text);
      c4 = double.parse(C4.text);
      d4 = double.parse(D4.text);
      mat4x4 = [
        [a1, b1, c1, d1],
        [a2, b2, c2, d2],
        [a3, b3, c3, d3],
        [a4, b4, c4, d4]
      ];
      break;
    default:
      a1 = double.parse(A1.text);
      b1 = double.parse(B1.text);
      c1 = double.parse(C1.text);
      d1 = double.parse(D1.text);
      e1 = double.parse(E1.text);
      a2 = double.parse(A2.text);
      b2 = double.parse(B2.text);
      c2 = double.parse(C2.text);
      d2 = double.parse(D2.text);
      e2 = double.parse(E2.text);
      a3 = double.parse(A3.text);
      b3 = double.parse(B3.text);
      c3 = double.parse(C3.text);
      d3 = double.parse(D3.text);
      e3 = double.parse(E3.text);
      a4 = double.parse(A4.text);
      b4 = double.parse(B4.text);
      c4 = double.parse(C4.text);
      d4 = double.parse(D4.text);
      e4 = double.parse(E4.text);
      a5 = double.parse(A5.text);
      b5 = double.parse(B5.text);
      c5 = double.parse(C5.text);
      d5 = double.parse(D5.text);
      e5 = double.parse(E5.text);
      mat5x5 = [
        [a1, b1, c1, d1, e1],
        [a2, b2, c2, d2, e2],
        [a3, b3, c3, d3, e3],
        [a4, b4, c4, d4, e4],
        [a5, b5, c5, d5, e5]
      ];
  }
}

class _DetState extends State<Det> {
  @override
  Widget build(BuildContext context) {
    switch (groupValueDet) {
      case 0:
        return ForMat2x2(context);
      case 1:
        return ForMat3x3(context);
      case 2:
        return ForMat4x4(context);
      default:
        return ForMat5x5(context);
    }
  }
}

double determinant(List matrice) {
  if (matrice.length == 1) {
    return matrice[0][0];
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

Widget ForMat2x2(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
          onPressed: () {
            reinitialize();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
    ),
    body: Column(
      children: [
        Expanded(
          flex: 2,
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
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'b2', controller_: B2)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: ElevatedButton(
                onPressed: () async {
                  if (A1.text != '' &&
                      B1.text != '' &&
                      A2.text != '' &&
                      B2.text != '') {
                    await onSave();
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return AlertDet(0);
                        });
                  } else {
                    showDialog(
                        context: context,
                        builder: (builder) =>
                            alertDialogError('de la matrice'));
                  }
                },
                child: const Text(
                  'Solution',
                  style: TextStyle(fontSize: 20),
                )),
          ),
          flex: 3,
        ),
      ],
    ),
  );
}

Widget ForMat3x3(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
          onPressed: () {
            reinitialize();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
    ),
    body: Column(
      children: [
        Expanded(
          flex: 1,
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
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'b2', controller_: B2)),
                      const SizedBox(
                        width: 10,
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
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'b3', controller_: B3)),
                      const SizedBox(
                        width: 10,
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
        
        Expanded(
          child: Center(
            child: ElevatedButton(
                onPressed: () {
                  if (A1.text != '' &&
                      B1.text != '' &&
                      C1.text != '' &&
                      A2.text != '' &&
                      B2.text != '' &&
                      C2.text != '' &&
                      A3.text != '' &&
                      B3.text != '' &&
                      C3.text != '') {
                    onSave();
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return AlertDet(1);
                        });
                  } else {
                    showDialog(
                        context: context,
                        builder: (builder) =>
                            alertDialogError('de la matrice'));
                  }
                },
                child: const Text(
                  'Solution',
                  style: TextStyle(fontSize: 20),
                )),
          ),
        ),
      ],
    ),
  );
}

Widget ForMat4x4(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
          onPressed: () {
            reinitialize();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
    ),
    body: Column(
      children: [
        Expanded(
          flex: 2,
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
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'd1', controller_: D1)),
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
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'b2', controller_: B2)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'c2', controller_: C2)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'd2', controller_: D2)),
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
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'b3', controller_: B3)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'c3', controller_: C3)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'd3', controller_: D3)),
                    ],
                  ),
                ),

                //ligne4
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'a4', controller_: A4)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'b4', controller_: B4)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'c4', controller_: C4)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'd4', controller_: D4)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        
        Expanded(
          child: Center(
            child: ElevatedButton(
                onPressed: () {
                  if (A1.text != '' &&
                      B1.text != '' &&
                      C1.text != '' &&
                      D1.text != '' &&
                      A2.text != '' &&
                      B2.text != '' &&
                      C2.text != '' &&
                      D2.text != '' &&
                      A3.text != '' &&
                      B3.text != '' &&
                      C3.text != '' &&
                      D3.text != '' &&
                      A4.text != '' &&
                      B4.text != '' &&
                      C4.text != '' &&
                      D4.text != '') {
                    onSave();
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return AlertDet(2);
                        });
                  } else {
                    showDialog(
                        context: context,
                        builder: (builder) =>
                            alertDialogError('de la matrice'));
                  }
                },
                child: const Text(
                  'Solution',
                  style: TextStyle(fontSize: 20),
                )),
          ),
        ),
      ],
    ),
  );
}

Widget ForMat5x5(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
          onPressed: () {
            reinitialize();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
    ),
    body: Column(
      children: [
        Expanded(
          flex: 5,
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
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'd1', controller_: D1)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'e1', controller_: E1)),
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
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'b2', controller_: B2)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'c2', controller_: C2)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'd2', controller_: D2)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'e2', controller_: E2)),
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
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'b3', controller_: B3)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'c3', controller_: C3)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'd3', controller_: D3)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'e3', controller_: E3)),
                    ],
                  ),
                ),

                //ligne4
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'a4', controller_: A4)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'b4', controller_: B4)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'c4', controller_: C4)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'd4', controller_: D4)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'e4', controller_: E4)),
                    ],
                  ),
                ),

                //ligne5
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'a5', controller_: A5)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'b5', controller_: B5)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'c5', controller_: C5)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'd5', controller_: D5)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldNumber(
                              text: 'e5', controller_: E5)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        
        Expanded(
          child: Center(
            child: ElevatedButton(
                onPressed: () {
                  if (A1.text != '' &&
                      B1.text != '' &&
                      C1.text != '' &&
                      D1.text != '' &&
                      E1.text != '' &&
                      A2.text != '' &&
                      B2.text != '' &&
                      C2.text != '' &&
                      D2.text != '' &&
                      E2.text != '' &&
                      A3.text != '' &&
                      B3.text != '' &&
                      C3.text != '' &&
                      D3.text != '' &&
                      E3.text != '' &&
                      A4.text != '' &&
                      B4.text != '' &&
                      C4.text != '' &&
                      D4.text != '' &&
                      E4.text != '' &&
                      A5.text != '' &&
                      B5.text != '' &&
                      C5.text != '' &&
                      D5.text != '' &&
                      E5.text != '') {
                    onSave();

                    showDialog(
                        context: context,
                        builder: (builder) {
                          return AlertDet(3);
                        });
                  } else {
                    showDialog(
                        context: context,
                        builder: (builder) =>
                            alertDialogError('de la matrice'));
                  }
                },
                child: const Text(
                  'Solution',
                  style: TextStyle(fontSize: 20),
                )),
          ),
        ),
        
      ],
    ),
  );
}

AlertDialog AlertDet(int index) {
  return AlertDialog(
    title: const Text('Résultat'),
    content: SizedBox(
      height: 150,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: resolutionDet(index),
          ),
        ],
      ),
    ),
  );
}

SelectableText MonText(String text) {
  return SelectableText(
    text,
    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    textAlign: TextAlign.end,
    //overflow: TextOverflow.ellipsis,
  );
}

Widget resolutionDet(int index) {
  switch (index) {
    case 0:
      if (inverse) {
        if (determinant(mat2x2) == 0) {
          return MonText(
              'Le cette matrice n\'est pas inversible car le déterminant est nul');
        } else {
          return AdaptationMatrice(index);
        }
      } else {
        return MonText('${Fraction.fromDouble(determinant(mat2x2))}');
      }

    case 1:
      if (inverse) {
        if (determinant(mat3x3) == 0) {
          return MonText(
              'Le cette matrice n\'est pas inversible car le déterminant est nul');
        } else {
          return AdaptationMatrice(index);
        }
      } else {
        return MonText('${Fraction.fromDouble(determinant(mat3x3))}');
      }

    case 2:
      if (inverse) {
        if (determinant(mat4x4) == 0) {
          return MonText(
              'Le cette matrice n\'est pas inversible car le déterminant est nul');
        } else {
          return AdaptationMatrice(index);
        }
      } else {
        return MonText('${Fraction.fromDouble(determinant(mat4x4))}');
      }

    default:
      if (inverse) {
        if (determinant(mat5x5) == 0) {
          return MonText(
              'Le cette matrice n\'est pas inversible car le déterminant est nul');
        } else {
          return AdaptationMatrice(index);
        }
      } else {
        return MonText('${Fraction.fromDouble(determinant(mat5x5))}');
      }
  }
}

//Cette fonction est utilisé essentiellemment
//pour les matrices de taille nxn
//! Cette fonction est maintenant inutile
// String list_to_string(List matrice) {
//   int length = matrice.length;
//   String matrice_string = '';
//   for (var i = 0; i < length; i++) {
//     for (var j = 0; j < length; j++) {
//       matrice_string += '${matrice[i][j]}    ';
//     }
//     matrice_string += '\n';
//   }
//   return matrice_string;
// }

// Pour réglé le problème de l'affichage d'une matrice on sera obligé
// d'utiliser un table
Table Matrice(List<List> matrice) {
  List<Text> tableRow = [];
  List<TableRow> tablesRow = [];
  for (var i = 0; i < matrice.length; i++) {
    for (var item in matrice[i]) {
      tableRow.add(Text(
        '$item',
        style: const TextStyle(fontSize: 14),
      ));
    }
    tablesRow.add(TableRow(children: tableRow));
    tableRow = [];
  }
  return Table(
    children: tablesRow,
  );
}

// ! Maintenant on a besoin d'adapter cette fonction à notre programme
Table AdaptationMatrice(int index) {
  switch (index) {
    case 0:
      return Matrice(inv(mat2x2));
    case 1:
      return Matrice(inv(mat3x3));
    case 2:
      return Matrice(inv(mat4x4));
    default:
      return Matrice(inv(mat5x5));
  }
}

// S'assurer que le déterminant de la matrice est
//différent de zéro et
//que pour le moment c'est une matrice n>=3
List<List> inv(List<List> matrice) {
  int length = matrice.length;
  List<List> n_mat = initialaze(length);
  double inv_det = (1 / determinant(matrice));
  for (var i = 0; i < length; i++) {
    for (var j = 0; j < length; j++) {
      n_mat[i][j] = Fraction.fromDouble(
          determinant(modif(matrice, i, j)) * pow(-1, j + i) * inv_det);
    }
  }
  return tranpose(n_mat);
}

List<List> initialaze(int length) {
  List zero = [];
  List<List> _zero = [];
  List l;
  for (var i = 0; i < length; i++) {
    zero.add(0);
  }
  for (var i = 0; i < length; i++) {
    l = zero.sublist(0);
    _zero.add(l);
  }
  return _zero;
}

List<List> tranpose(List mat_inversible) {
  int length = mat_inversible.length;
  List<List> mat_helper = [];
  mat_helper = initialaze(length);
  int i = 0;
  int j = 0;
  for (i = 0; i < length; i++) {
    for (j = 0; j < length; j++) {
      mat_helper[i][j] = mat_inversible[j][i];
    }
  }
  return mat_helper;
}
