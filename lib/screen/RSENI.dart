// ignore_for_file: file_names, unused_import, non_constant_identifier_names, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';
import 'package:gnac_caculator/data/colors_app.dart';
import 'package:gnac_caculator/functions/determinant.dart';
import 'package:gnac_caculator/widgets/alert_dialog_error.dart';
import 'package:gnac_caculator/widgets/textfield.dart';
import 'matrice/det.dart';

class Resolution extends StatefulWidget {
  const Resolution({Key? key}) : super(key: key);

  @override
  State<Resolution> createState() => _ResolutionState();
}

int systemValue = 3;

class _ResolutionState extends State<Resolution> {
  double a1 = 0;
  double a2 = 0;
  double a3 = 0;
  double a4 = 0;
  double a5 = 0;
  double a = 0;

  double b = 0;
  double b1 = 0;
  double b2 = 0;
  double b3 = 0;
  double b4 = 0;
  double b5 = 0;

  double c = 0;
  double c1 = 0;
  double c2 = 0;
  double c3 = 0;
  double c4 = 0;
  double c5 = 0;

  double d = 0;
  double d1 = 0;
  double d2 = 0;
  double d3 = 0;
  double d4 = 0;
  double d5 = 0;

  double e = 0;
  double e1 = 0;
  double e2 = 0;
  double e3 = 0;
  double e4 = 0;
  double e5 = 0;

  TextEditingController A = TextEditingController();
  TextEditingController A1 = TextEditingController();
  TextEditingController A2 = TextEditingController();
  TextEditingController A3 = TextEditingController();
  TextEditingController A4 = TextEditingController();
  TextEditingController A5 = TextEditingController();

  TextEditingController B = TextEditingController();
  TextEditingController B1 = TextEditingController();
  TextEditingController B2 = TextEditingController();
  TextEditingController B3 = TextEditingController();
  TextEditingController B4 = TextEditingController();
  TextEditingController B5 = TextEditingController();

  TextEditingController C = TextEditingController();
  TextEditingController C1 = TextEditingController();
  TextEditingController C2 = TextEditingController();
  TextEditingController C3 = TextEditingController();
  TextEditingController C4 = TextEditingController();
  TextEditingController C5 = TextEditingController();

  TextEditingController D = TextEditingController();
  TextEditingController D1 = TextEditingController();
  TextEditingController D2 = TextEditingController();
  TextEditingController D3 = TextEditingController();
  TextEditingController D4 = TextEditingController();
  TextEditingController D5 = TextEditingController();

  TextEditingController E = TextEditingController();
  TextEditingController E1 = TextEditingController();
  TextEditingController E2 = TextEditingController();
  TextEditingController E3 = TextEditingController();
  TextEditingController E4 = TextEditingController();
  TextEditingController E5 = TextEditingController();

  onSave(int num_inconnues) {
    switch (num_inconnues) {
      case 2:
        a1 = double.parse(A1.text);
        a2 = double.parse(A2.text);
        a = double.parse(A.text);

        b = double.parse(B.text);
        b1 = double.parse(B1.text);
        b2 = double.parse(B2.text);
        break;
      case 3:
        a1 = double.parse(A1.text);
        a2 = double.parse(A2.text);
        a3 = double.parse(A3.text);
        a = double.parse(A.text);

        b = double.parse(B.text);
        b1 = double.parse(B1.text);
        b2 = double.parse(B2.text);
        b3 = double.parse(B3.text);

        c = double.parse(C.text);
        c1 = double.parse(C1.text);
        c2 = double.parse(C2.text);
        c3 = double.parse(C3.text);
        break;
      case 4:
        a1 = double.parse(A1.text);
        a2 = double.parse(A2.text);
        a3 = double.parse(A3.text);
        a4 = double.parse(A4.text);
        a = double.parse(A.text);

        b = double.parse(B.text);
        b1 = double.parse(B1.text);
        b2 = double.parse(B2.text);
        b3 = double.parse(B3.text);
        b4 = double.parse(B4.text);

        c = double.parse(C.text);
        c1 = double.parse(C1.text);
        c2 = double.parse(C2.text);
        c3 = double.parse(C3.text);
        c4 = double.parse(C4.text);

        d = double.parse(D.text);
        d1 = double.parse(D1.text);
        d2 = double.parse(D2.text);
        d3 = double.parse(D3.text);
        d4 = double.parse(D4.text);
        break;
      case 5:
        a1 = double.parse(A1.text);
        a2 = double.parse(A2.text);
        a3 = double.parse(A3.text);
        a4 = double.parse(A4.text);
        a5 = double.parse(A5.text);
        a = double.parse(A.text);

        b = double.parse(B.text);
        b1 = double.parse(B1.text);
        b2 = double.parse(B2.text);
        b3 = double.parse(B3.text);
        b4 = double.parse(B4.text);
        b5 = double.parse(B5.text);

        c = double.parse(C.text);
        c1 = double.parse(C1.text);
        c2 = double.parse(C2.text);
        c3 = double.parse(C3.text);
        c4 = double.parse(C4.text);
        c5 = double.parse(C5.text);

        d = double.parse(D.text);
        d1 = double.parse(D1.text);
        d2 = double.parse(D2.text);
        d3 = double.parse(D3.text);
        d4 = double.parse(D4.text);
        d5 = double.parse(D5.text);

        e = double.parse(E.text);
        e1 = double.parse(E1.text);
        e2 = double.parse(E2.text);
        e3 = double.parse(E3.text);
        e4 = double.parse(E4.text);
        e5 = double.parse(E5.text);
        break;
      default:
    }
  }

  @override
  Widget RSE2I(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            //"Résolution d'un systhème d'équation à deux inconnues",
            'RSE2I'),
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
            flex: 15,
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: ListView(
                children: [
                  const Text(
                      "Entrez un systeme d'équation de la forme ci-dessous"),
                  const Text(
                    '|a1x + a2y = a',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text('|b1x + b2y = b', style: TextStyle(fontSize: 20)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Ligne 1'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a1', controller_: A1),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a2', controller_: A2),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a', controller_: A),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Ligne 2'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b1', controller_: B1),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b2', controller_: B2),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b', controller_: B),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (A1.text != '' &&
                            A2.text != '' &&
                            A.text != '' &&
                            B1.text != '' &&
                            B2.text != '' &&
                            B.text != '' &&
                            ((A1.text != '0' && B1.text != '0') ||
                                (A2.text != '0' && B2.text != '0'))) {
                          await onSave(2);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => solutionE2I()));
                        } else {
                          return showDialog(
                              context: context,
                              builder: (builder) {
                                return alertDialogError('du système');
                              });
                        }
                      },
                      child: const Text('Résoudre'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget solutionE2I() {
    List<List> matriceD = [
      [a1, a2],
      [b1, b2]
    ];
    List secondMembre = [a, b];
    List se2i = solutionIconnues(matriceD, secondMembre);

    bool matriceDisnull = false;
    bool matricesNarenull = false;

    if (determinant(matriceD) == 0.0) {
      matriceDisnull = true;
    }
    int i = 0;
    while (i != secondMembre.length &&
        determinant(matriceN(matriceD, secondMembre, i)) == 0.0) {
      i++;
    }
    if (i == secondMembre.length) {
      matricesNarenull = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Solution'),
      ),
      body: Center(
        child: SelectableText(
          '''
      Le Système Suivant

          |${a1 > 0 ? '${Fraction.fromDouble(a1)}' : '(${Fraction.fromDouble(a1)})'}x + ${a2 > 0 ? '${Fraction.fromDouble(a2)}' : '(${Fraction.fromDouble(a2)})'}y = ${Fraction.fromDouble(a)}
          |${b1 > 0 ? '${Fraction.fromDouble(b1)}' : '(${Fraction.fromDouble(b1)})'}x + ${b2 > 0 ? '${Fraction.fromDouble(b2)}' : '(${Fraction.fromDouble(b2)})'}y = ${Fraction.fromDouble(b)}

${matriceDisnull ? matricesNarenull ? 'Admet une infinitée de solution qui est représentée géométriquement par l\'équation de la ligne 1' : "N'admet aucune solution" : '''   A pour solutions 

          x = ${Fraction.fromDouble(se2i[0])}
          y = ${Fraction.fromDouble(se2i[1])}
          '''}
        ''',
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget RSE3I(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            //"Résolution d'un systhème d'équation à trois inconnues",
            'RSE3I'),
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
            flex: 15,
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: ListView(
                children: [
                  const Text(
                      "Entrez un systeme d'équation de la forme ci-dessous"),
                  const Text(
                    '|a1x + a2y + a3z= a',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text('|b1x + b2y + b3z= b',
                      style: TextStyle(fontSize: 20)),
                  const Text('|c1x + c2y + c3z= c',
                      style: TextStyle(fontSize: 20)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Ligne 1'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a1', controller_: A1),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a2', controller_: A2),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a3', controller_: A3),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a', controller_: A),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Ligne 2'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b1', controller_: B1),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b2', controller_: B2),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b3', controller_: B3),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b', controller_: B),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Ligne 3'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c1', controller_: C1),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c2', controller_: C2),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c3', controller_: C3),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c', controller_: C),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (A1.text != '' &&
                            A2.text != '' &&
                            A3.text != '' &&
                            A.text != '' &&
                            B1.text != '' &&
                            B2.text != '' &&
                            B3.text != '' &&
                            B.text != '' &&
                            C1.text != '' &&
                            C2.text != '' &&
                            C3.text != '' &&
                            C.text != '' &&
                            ((A1.text != '0' &&
                                    B1.text != '0' &&
                                    C1.text != '0') ||
                                (A2.text != '0' &&
                                    B2.text != '0' &&
                                    C2.text != '0') ||
                                (A3.text != '0' &&
                                    B3.text != '0' &&
                                    C3.text != '0'))) {
                          await onSave(3);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => solutionE3I()));
                        } else {
                          return showDialog(
                              context: context,
                              builder: (builder) {
                                return alertDialogError('du système');
                              });
                        }
                      },
                      child: const Text('Résoudre'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget solutionE3I() {
    List<List> matriceD = [
      [a1, a2, a3],
      [b1, b2, b3],
      [c1, c2, c3]
    ];
    List secondMembre = [a, b, c];
    List se3i = solutionIconnues(matriceD, secondMembre);

    bool matriceDisnull = false;
    bool matricesNarenull = false;

    if (determinant(matriceD) == 0.0) {
      matriceDisnull = true;
    }
    int i = 0;
    while (i != secondMembre.length &&
        determinant(matriceN(matriceD, secondMembre, i)) == 0.0) {
      i++;
    }
    if (i == secondMembre.length) {
      matricesNarenull = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Solution'),
      ),
      body: Center(
        child: SelectableText(
          '''
      Le Système Suivant

          |${a1 > 0 ? '${Fraction.fromDouble(a1)}' : '(${Fraction.fromDouble(a1)})'}x + ${a2 > 0 ? '${Fraction.fromDouble(a2)}' : '(${Fraction.fromDouble(a2)})'}y + ${a3 > 0 ? '${Fraction.fromDouble(a3)}' : '(${Fraction.fromDouble(a3)})'}z = ${Fraction.fromDouble(a)}
          |${b1 > 0 ? '${Fraction.fromDouble(b1)}' : '(${Fraction.fromDouble(b1)})'}x + ${b2 > 0 ? '${Fraction.fromDouble(b2)}' : '(${Fraction.fromDouble(b2)})'}y + ${b3 > 0 ? '${Fraction.fromDouble(b3)}' : '(${Fraction.fromDouble(b3)})'}z = ${Fraction.fromDouble(b)}
          |${c1 > 0 ? '${Fraction.fromDouble(c1)}' : '(${Fraction.fromDouble(c1)})'}x + ${c2 > 0 ? '${Fraction.fromDouble(c2)}' : '(${Fraction.fromDouble(c2)})'}y + ${c3 > 0 ? '${Fraction.fromDouble(c3)}' : '(${Fraction.fromDouble(c3)})'}z = ${Fraction.fromDouble(c)}
 
  ${matriceDisnull ? matricesNarenull ? 'Admet une infinitée de solution qui est représentée géométriquement par l\'équation de la ligne 1' : "N'admet aucune solution" : '''A pour solutions 

          x = ${Fraction.fromDouble(se3i[0])}
          y = ${Fraction.fromDouble(se3i[1])}
          z = ${Fraction.fromDouble(se3i[2])}
          '''}
        ''',
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget RSE4I(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            //"Résolution d'un systhème d'équation à quatre inconnues",
            'RSE4I'),
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
            flex: 15,
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: ListView(
                children: [
                  const Text(
                      "Entrez un systeme d'équation de la forme ci-dessous"),
                  const Text(
                    '|a1.x1 + a2.x2 + a3.x3 +a4.x4= a',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text('|b1.x1 + b2.x2 + b3.x3 +b4.x4= b',
                      style: TextStyle(fontSize: 20)),
                  const Text('|c1.x1 + c2.x2 + c3.x3 +c4.x4= c',
                      style: TextStyle(fontSize: 20)),
                  const Text('|d1.x1 + d2.x2 + d3.x3 +d4.x4= d',
                      style: TextStyle(fontSize: 20)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Ligne 1'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a1', controller_: A1),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a2', controller_: A2),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a3', controller_: A3),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a4', controller_: A4),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a', controller_: A),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Ligne 2'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b1', controller_: B1),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b2', controller_: B2),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b3', controller_: B3),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b4', controller_: B4),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b', controller_: B),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Ligne 3'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c1', controller_: C1),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c2', controller_: C2),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c3', controller_: C3),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c4', controller_: C4),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c', controller_: C),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Ligne 4'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldNumber(text: 'Entrez d1', controller_: D1),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez d2', controller_: D2),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez d3', controller_: D3),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez d4', controller_: D4),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez d', controller_: D),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (A1.text != '' &&
                            A2.text != '' &&
                            A3.text != '' &&
                            A4.text != '' &&
                            A.text != '' &&
                            B1.text != '' &&
                            B2.text != '' &&
                            B3.text != '' &&
                            B4.text != '' &&
                            B.text != '' &&
                            C1.text != '' &&
                            C2.text != '' &&
                            C3.text != '' &&
                            C4.text != '' &&
                            C.text != '' &&
                            D.text != '' &&
                            D1.text != '' &&
                            D2.text != '' &&
                            D3.text != '' &&
                            D4.text != '' &&
                            ((A1.text != '0' &&
                                    B1.text != '0' &&
                                    C1.text != '0' &&
                                    D1.text != '0') ||
                                (A2.text != '0' &&
                                    B2.text != '0' &&
                                    C2.text != '0' &&
                                    D2.text != '0') ||
                                (A3.text != '0' &&
                                    B3.text != '0' &&
                                    C3.text != '0' &&
                                    D3.text != '0') ||
                                (A4.text != '0' &&
                                    B4.text != '0' &&
                                    C4.text != '0' &&
                                    D4.text != '0'))) {
                          await onSave(4);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => solutionE4I()));
                        } else {
                          return showDialog(
                              context: context,
                              builder: (builder) {
                                return alertDialogError('du système');
                              });
                        }
                      },
                      child: const Text('Résoudre'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget solutionE4I() {
    List<List> matriceD = [
      [a1, a2, a3, a4],
      [b1, b2, b3, b4],
      [c1, c2, c3, c4],
      [d1, d2, d3, d4],
    ];
    List secondMembre = [a, b, c, d];
    List se4i = solutionIconnues(matriceD, secondMembre);

    bool matriceDisnull = false;
    bool matricesNarenull = false;

    if (determinant(matriceD) == 0.0) {
      matriceDisnull = true;
    }
    int i = 0;
    while (i != secondMembre.length &&
        determinant(matriceN(matriceD, secondMembre, i)) == 0.0) {
      i++;
    }
    if (i == secondMembre.length) {
      matricesNarenull = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Solution'),
      ),
      body: Center(
        child: SelectableText(
          '''
      Le Système Suivant

          |${a1 > 0 ? '${Fraction.fromDouble(a1)}' : '(${Fraction.fromDouble(a1)})'}x1 + ${a2 > 0 ? '${Fraction.fromDouble(a2)}' : '(${Fraction.fromDouble(a2)})'}x2 + ${a3 > 0 ? '${Fraction.fromDouble(a3)}' : '(${Fraction.fromDouble(a3)})'}x3 + ${a4 > 0 ? '${Fraction.fromDouble(a4)}' : '(${Fraction.fromDouble(a4)})'}x4 = ${Fraction.fromDouble(a)}
          |${b1 > 0 ? '${Fraction.fromDouble(b1)}' : '(${Fraction.fromDouble(b1)})'}x1 + ${b2 > 0 ? '${Fraction.fromDouble(b2)}' : '(${Fraction.fromDouble(b2)})'}x2 + ${b3 > 0 ? '${Fraction.fromDouble(b3)}' : '(${Fraction.fromDouble(b3)})'}x3 + ${b4 > 0 ? '${Fraction.fromDouble(b4)}' : '(${Fraction.fromDouble(b4)})'}x4 = ${Fraction.fromDouble(b)}
          |${c1 > 0 ? '${Fraction.fromDouble(c1)}' : '(${Fraction.fromDouble(c1)})'}x1 + ${c2 > 0 ? '${Fraction.fromDouble(c2)}' : '(${Fraction.fromDouble(c2)})'}x2 + ${c3 > 0 ? '${Fraction.fromDouble(c3)}' : '(${Fraction.fromDouble(c3)})'}x3 + ${c4 > 0 ? '${Fraction.fromDouble(c4)}' : '(${Fraction.fromDouble(c4)})'}x4 = ${Fraction.fromDouble(c)}
          |${d1 > 0 ? '${Fraction.fromDouble(d1)}' : '(${Fraction.fromDouble(d1)})'}x1 + ${d2 > 0 ? '${Fraction.fromDouble(d2)}' : '(${Fraction.fromDouble(d2)})'}x2 + ${d3 > 0 ? '${Fraction.fromDouble(d3)}' : '(${Fraction.fromDouble(d3)})'}x3 + ${d4 > 0 ? '${Fraction.fromDouble(d4)}' : '(${Fraction.fromDouble(d4)})'}x4 = ${Fraction.fromDouble(d)}
         
          ${matriceDisnull ? matricesNarenull ? 'Admet une infinitée de solution qui est représentée géométriquement par l\'équation de la ligne 1' : "N'admet aucune solution" : '''A pour solutions 

          x1 = ${Fraction.fromDouble(se4i[0])}
          x2 = ${Fraction.fromDouble(se4i[1])}
          x3 = ${Fraction.fromDouble(se4i[2])}
          x4 = ${Fraction.fromDouble(se4i[3])}
          '''}
        ''',
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget RSE5I(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            //"Résolution d'un systhème d'équation à quatre inconnues",
            'RSE4I'),
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
            flex: 15,
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: ListView(
                children: [
                  const Text(
                      "Entrez un systeme d'équation de la forme ci-dessous"),
                  const Text(
                    '|a1.x1 + a2.x2 + a3.x3 + a4.x4 + a5.x5= a',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text('|b1.x1 + b2.x2 + b3.x3 + b4.x4 + b5.x5= b',
                      style: TextStyle(fontSize: 16)),
                  const Text('|c1.x1 + c2.x2 + c3.x3 + c4.x4 + c5.x5= c',
                      style: TextStyle(fontSize: 16)),
                  const Text('|d1.x1 + d2.x2 + d3.x3 + d4.x4 + d5.x5= d',
                      style: TextStyle(fontSize: 16)),
                  const Text('|e1.x1 + e2.x2 + e3.x3 + e4.x4 + e5.x5= e',
                      style: TextStyle(fontSize: 16)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Ligne 1'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a1', controller_: A1),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a2', controller_: A2),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a3', controller_: A3),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a4', controller_: A4),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a5', controller_: A5),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a', controller_: A),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Ligne 2'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b1', controller_: B1),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b2', controller_: B2),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b3', controller_: B3),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b4', controller_: B4),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b5', controller_: B5),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b', controller_: B),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Ligne 3'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c1', controller_: C1),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c2', controller_: C2),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c3', controller_: C3),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c4', controller_: C4),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c5', controller_: C5),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c', controller_: C),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Ligne 4'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldNumber(text: 'Entrez d1', controller_: D1),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez d2', controller_: D2),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez d3', controller_: D3),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez d4', controller_: D4),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez d5', controller_: D5),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez d', controller_: D),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Ligne 5'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldNumber(text: 'Entrez e1', controller_: E1),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez e2', controller_: E2),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez e3', controller_: E3),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez e4', controller_: E4),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez e5', controller_: E5),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez e', controller_: E),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (A1.text != '' &&
                            A2.text != '' &&
                            A3.text != '' &&
                            A4.text != '' &&
                            A5.text != '' &&
                            A.text != '' &&
                            B1.text != '' &&
                            B2.text != '' &&
                            B3.text != '' &&
                            B4.text != '' &&
                            B5.text != '' &&
                            B.text != '' &&
                            C1.text != '' &&
                            C2.text != '' &&
                            C3.text != '' &&
                            C4.text != '' &&
                            C5.text != '' &&
                            C.text != '' &&
                            D1.text != '' &&
                            D2.text != '' &&
                            D3.text != '' &&
                            D4.text != '' &&
                            D5.text != '' &&
                            D.text != '' &&
                            E1.text != '' &&
                            E2.text != '' &&
                            E3.text != '' &&
                            E4.text != '' &&
                            E5.text != '' &&
                            E.text != '' &&
                            ((A1.text != '0' &&
                                    B1.text != '0' &&
                                    C1.text != '0' &&
                                    D1.text != '0' &&
                                    E1.text != '0') ||
                                (A2.text != '0' &&
                                    B2.text != '0' &&
                                    C2.text != '0' &&
                                    D2.text != '0' &&
                                    E2.text != '0') ||
                                (A3.text != '0' &&
                                    B3.text != '0' &&
                                    C3.text != '0' &&
                                    D3.text != '0' &&
                                    E3.text != '0') ||
                                (A4.text != '0' &&
                                    B4.text != '0' &&
                                    C4.text != '0' &&
                                    D4.text != '0' &&
                                    E4.text != '0') ||
                                (A5.text != '0' &&
                                    B5.text != '0' &&
                                    C5.text != '0' &&
                                    D5.text != '0' &&
                                    E5.text != '0'))) {
                          await onSave(5);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => solutionE5I()));
                        } else {
                          return showDialog(
                              context: context,
                              builder: (builder) {
                                return alertDialogError('du système');
                              });
                        }
                      },
                      child: const Text('Résoudre'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget solutionE5I() {
    List<List> matriceD = [
      [a1, a2, a3, a4, a5],
      [b1, b2, b3, b4, b5],
      [c1, c2, c3, c4, c5],
      [d1, d2, d3, d4, d5],
      [e1, e2, e3, e4, e5],
    ];
    List secondMembre = [a, b, c, d, e];

    bool matriceDisnull = false;
    bool matricesNarenull = false;

    if (determinant(matriceD) == 0.0) {
      matriceDisnull = true;
    }
    int i = 0;
    while (i != secondMembre.length &&
        determinant(matriceN(matriceD, secondMembre, i)) == 0.0) {
      i++;
    }
    if (i == secondMembre.length) {
      matricesNarenull = true;
    }

    List se5i = solutionIconnues(matriceD, secondMembre);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solution'),
      ),
      body: Center(
        child: SelectableText(
          '''
      Le Système Suivant

          |${a1 > 0 ? '${Fraction.fromDouble(a1)}' : '(${Fraction.fromDouble(a1)})'}x1 + ${a2 > 0 ? '${Fraction.fromDouble(a2)}' : '(${Fraction.fromDouble(a2)})'}x2 + ${a3 > 0 ? '${Fraction.fromDouble(a3)}' : '(${Fraction.fromDouble(a3)})'}x3 + ${a4 > 0 ? '${Fraction.fromDouble(a4)}' : '(${Fraction.fromDouble(a4)})'}x4 + ${a5 > 0 ? '${Fraction.fromDouble(a5)}' : '(${Fraction.fromDouble(a5)})'}x5 = ${Fraction.fromDouble(a)}
          |${b1 > 0 ? '${Fraction.fromDouble(b1)}' : '(${Fraction.fromDouble(b1)})'}x1 + ${b2 > 0 ? '${Fraction.fromDouble(b2)}' : '(${Fraction.fromDouble(b2)})'}x2 + ${b3 > 0 ? '${Fraction.fromDouble(b3)}' : '(${Fraction.fromDouble(b3)})'}x3 + ${b4 > 0 ? '${Fraction.fromDouble(b4)}' : '(${Fraction.fromDouble(b4)})'}x4 + ${b5 > 0 ? '${Fraction.fromDouble(b5)}' : '(${Fraction.fromDouble(b5)})'}x5 = ${Fraction.fromDouble(b)}
          |${c1 > 0 ? '${Fraction.fromDouble(c1)}' : '(${Fraction.fromDouble(c1)})'}x1 + ${c2 > 0 ? '${Fraction.fromDouble(c2)}' : '(${Fraction.fromDouble(c2)})'}x2 + ${c3 > 0 ? '${Fraction.fromDouble(c3)}' : '(${Fraction.fromDouble(c3)})'}x3 + ${c4 > 0 ? '${Fraction.fromDouble(c4)}' : '(${Fraction.fromDouble(c4)})'}x4 + ${c5 > 0 ? '${Fraction.fromDouble(c5)}' : '(${Fraction.fromDouble(c5)})'}x5 = ${Fraction.fromDouble(c)}
          |${d1 > 0 ? '${Fraction.fromDouble(d1)}' : '(${Fraction.fromDouble(d1)})'}x1 + ${d2 > 0 ? '${Fraction.fromDouble(d2)}' : '(${Fraction.fromDouble(d2)})'}x2 + ${d3 > 0 ? '${Fraction.fromDouble(d3)}' : '(${Fraction.fromDouble(d3)})'}x3 + ${d4 > 0 ? '${Fraction.fromDouble(d4)}' : '(${Fraction.fromDouble(d4)})'}x4 + ${a4 > 0 ? '${Fraction.fromDouble(d5)}' : '(${Fraction.fromDouble(d5)})'}x5 = ${Fraction.fromDouble(d)}
          |${e1 > 0 ? '${Fraction.fromDouble(e1)}' : '(${Fraction.fromDouble(e1)})'}x1 + ${e2 > 0 ? '${Fraction.fromDouble(e2)}' : '(${Fraction.fromDouble(e2)})'}x2 + ${e3 > 0 ? '${Fraction.fromDouble(e3)}' : '(${Fraction.fromDouble(e3)})'}x3 + ${e4 > 0 ? '${Fraction.fromDouble(e4)}' : '(${Fraction.fromDouble(e4)})'}x4 + ${a4 > 0 ? '${Fraction.fromDouble(e5)}' : '(${Fraction.fromDouble(e5)})'}x5 = ${Fraction.fromDouble(e)}
     
      ${matriceDisnull ? matricesNarenull ? 'Admet une infinitée de solution qui est représentée géométriquement par l\'équation de la ligne 1' : "N'admet aucune solution" : '''A pour solutions 

          x1 = ${Fraction.fromDouble(se5i[0])}
          x2 = ${Fraction.fromDouble(se5i[1])}
          x3 = ${Fraction.fromDouble(se5i[2])}
          x4 = ${Fraction.fromDouble(se5i[3])}
          x5 = ${Fraction.fromDouble(se5i[4])}
          '''}
        ''',
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void reinitialize() {
    A = TextEditingController();
    B = TextEditingController();
    C = TextEditingController();
    D = TextEditingController();
    E = TextEditingController();
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

//* Création de l'ultime fonction qui résoud les systémes de n éqations à n inconnues
//  En premier lieu nous allons :
//    [.]création d'une fonction pour changer la ième colonne d'une matrice nxn par une
//    autre eux tous passer en paramètre
  List<List> matriceN(List<List> matriceD, List secondMembre, int colonne) {
    List<List> _matriceN = [];

    for (var i = 0; i < matriceD.length; i++) {
      List ligne = matriceD[i].sublist(0);
      _matriceN.add(ligne);
    }

    for (var i = 0; i < secondMembre.length; i++) {
      _matriceN[i][colonne] = secondMembre[i];
    }

    return _matriceN;
  }

// *Voici la fonction qui gère les solutions
  List solutionIconnues(List<List> matriceD, List secondMembre) {
    List<double> solution = [];
    for (var i = 0; i < secondMembre.length; i++) {
      solution.add(determinant(matriceN(matriceD, secondMembre, i)) /
          determinant(matriceD));
    }
    return solution;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Système d\'équation'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Radio(
                  activeColor: ePcolor,
                  value: 2,
                  groupValue: systemValue,
                  onChanged: (i) => onChangedSystem(2)),
              const Text("Système de 2 équations à 2 inconnues"),
            ],
          ),
          Row(
            children: [
              Radio(
                  activeColor: ePcolor,
                  value: 3,
                  groupValue: systemValue,
                  onChanged: (i) => onChangedSystem(3)),
              const Text("Système de 3 équations à 3 inconnues"),
            ],
          ),
          Row(
            children: [
              Radio(
                  activeColor: ePcolor,
                  value: 4,
                  groupValue: systemValue,
                  onChanged: (i) => onChangedSystem(4)),
              const Text("Système de 4 équations à 4 inconnues"),
            ],
          ),
          Row(
            children: [
              Radio(
                  activeColor: ePcolor,
                  value: 5,
                  groupValue: systemValue,
                  onChanged: (i) => onChangedSystem(5)),
              const Text("Système de 5 équations à 5 inconnues"),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  switch (systemValue) {
                    case 2:
                      return RSE2I(context);
                    case 3:
                      return RSE3I(context);
                    case 4:
                      return RSE4I(context);
                    default:
                      return RSE5I(context);
                  }
                }));
              },
              child: const Text('OK'))
        ],
      ),
    );
  }

  onChangedSystem(int value) {
    setState(() {
      systemValue = value;
    });
  }
}
