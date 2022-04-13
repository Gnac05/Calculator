// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';
import 'package:gnac_caculator/model/dtb_equation.dart';
import 'package:gnac_caculator/model/equation.dart';
import 'package:gnac_caculator/screen/classique_calculator.dart';
import 'package:gnac_caculator/screen/equation_historique.dart';
import 'package:gnac_caculator/widgets/alert_dialog_error.dart';
import 'package:gnac_caculator/widgets/textfield.dart';


class Equation extends StatefulWidget {
  const Equation({Key? key}) : super(key: key);

  @override
  State<Equation> createState() => _EquationState();
}

class _EquationState extends State<Equation> {
  TextEditingController A = TextEditingController();
  TextEditingController B = TextEditingController();
  TextEditingController C = TextEditingController();
  double a = 0;
  double b = 0;
  double c = 0;
  onSaveC() {
    a = double.parse(A.text);
    b = double.parse(B.text);
    c = double.parse(C.text);
  }

  refresh_db() {
    DatabaseEquationSD().getAllEquationSD().then((value) {
      setState(() {
        equationsSD = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Equation'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EqutionHistorique()));
                },
                icon: const Icon(Icons.history))
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Résolution d\'équation du second dégré de la forme ax²+bx+c = 0',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: CustomTextFieldNumber(text: 'a', controller_: A)),
                  const Expanded(
                      flex: 1,
                      child: FittedBox(
                        child: Text(
                          'x² + ',
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: CustomTextFieldNumber(text: 'b', controller_: B)),
                  const Expanded(
                      flex: 1,
                      child: FittedBox(
                        child: Text(
                          'x + ',
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: CustomTextFieldNumber(text: 'c', controller_: C)),
                  const Expanded(
                      flex: 1,
                      child: FittedBox(
                        child: Text(
                          ' = 0',
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () async {
                if (A.text != '' &&
                    B.text != '' &&
                    C.text != '' &&
                    A.text != '0') {
                  await onSaveC();
                  Map<String, dynamic> map = {
                    'a': A.text,
                    'b': B.text,
                    'c': C.text,
                    'day': date(DateTime.now().toString().substring(0, 10))
                  };
                  EquationSD equationSD = EquationSD();
                  equationSD.fromMap(map);
                  DatabaseEquationSD()
                      .addEquationSD(equationSD)
                      .then((value) => refresh_db());

                  return showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (builder) {
                        return AlertDialog(
                          title: const Text('Résolution'),
                          content: Scrollbar(
                            child: SizedBox(
                              height: 200,
                              child: ListView(
                                children: [
                                  Center(
                                    child: SelectableText(
                                      '${a == 1 ? '' : a > 0 ? '${Fraction.fromDouble(a)}' : '(${Fraction.fromDouble(a)})'}x² ${b == 0 ? ' ' : b == 1 ? ' + x' : b > 0 ? ' + ${Fraction.fromDouble(b)}x' : ' - ${Fraction.fromDouble(b).toString().substring(1)}x'} ${c == 0 ? '' : c > 0 ? '+ ${Fraction.fromDouble(c)}' : ' - ${Fraction.fromDouble(c).toString().substring(1)}'} = 0 \nOn a delta = b²-4ac \nsoit delta = (${pow(b, 2) - 4 * a * c}) \n${signeDelta(pow(b, 2) - 4 * a * c, a, b)}',
                                      style:
                                          const TextStyle(fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK')),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return showDialog(
                      context: context,
                      builder: (builder) {
                        return alertDialogError(
                            'de l\'équation avec a différent de zéro (0)');
                      });
                }
              },
              child: const Text('Résoudre'),
            )
          ],
        ));
  }
}

String signeDelta(double delta, double a, double b) {
  if (delta > 0) {
    return 'delta > 0\n'
        // 'alors on a deux solutions distinctes\n'
        // 'x1 et x2 avec\n'
        'x1 = ${Fraction.fromDouble((0 - sqrt(delta) - b) / (2 * a))}\n'
        // 'et\n'
        ' x2 = ${Fraction.fromDouble((sqrt(delta) - b) / (2 * a))}';
  } else {
    if (delta == 0) {
      return 'delta = 0\n'
          // 'alors on a une double solution x0\n'
          'x0 = ${Fraction.fromDouble((0 - b) / (2 * a))}';
    } else {
      return 'delta < 0\n'
          // 'alors on a deux solutions distinctes complexes\n'
          // 'x1 et x2 avec\n'
          'x1 = ${b == 0 ? '' : Fraction.fromDouble((0 - b) / (2 * a))} ${(sqrt(0 - delta)) / (2 * a) > 0 ? ' - ${Fraction.fromDouble((sqrt(0 - delta)) / (2 * a))}i' : ' ${Fraction.fromDouble((sqrt(0 - delta)) / (2 * a)).toString().substring(1)}i'}\n'
          // 'et\n'
          'x2 = ${b == 0 ? '' : Fraction.fromDouble((0 - b) / (2 * a))} ${(sqrt(0 - delta)) / (2 * a) > 0 ? ' ${b == 0 ? '' : '+'} ${Fraction.fromDouble((sqrt(0 - delta)) / (2 * a))}i' : ' - ${Fraction.fromDouble((sqrt(0 - delta)) / (2 * a)).toString().substring(1)}i'}';
    }
  }
}
