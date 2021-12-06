// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gnac_caculator/widgets/rse2i.dart';
import 'package:gnac_caculator/widgets/textfield.dart';

class Resolution extends StatefulWidget {
  const Resolution({Key? key}) : super(key: key);

  @override
  State<Resolution> createState() => _ResolutionState();
}

class _ResolutionState extends State<Resolution> {
  double a = 0;

  double b = 0;

  double c = 0;

  double d = 0;

  double e = 0;

  double f = 0;

  TextEditingController A = TextEditingController();
  TextEditingController B = TextEditingController();
  TextEditingController C = TextEditingController();
  TextEditingController D = TextEditingController();
  TextEditingController E = TextEditingController();
  TextEditingController F = TextEditingController();

  onSave() {
    a=double.parse(A.text);
    b = double.parse(B.text);
    c = double.parse(C.text);
    d =  double.parse(D.text);
    e =  double.parse(E.text);
    f =  double.parse(F.text);
  }
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            //        "Résolution d'un systhème d'équation à deux inconnues",
            'RSE2I'),
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
                  const Text('|ax + by = c', style: TextStyle(fontSize: 20),),
                  const Text('|dx + ey = f', style: TextStyle(fontSize: 20)),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFieldNumber(text: 'Entrez a', controller_: A),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez b', controller_: B),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez c', controller_: C),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez d', controller_: D),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez e', controller_: E),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNumber(text: 'Entrez f', controller_: F),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await onSave();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => solution(a, b, c, d, e, f)));
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
}
