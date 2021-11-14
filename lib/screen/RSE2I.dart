// ignore_for_file: file_names

import 'package:flutter/material.dart';

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
                  TextField(
                    controller: A,
                    decoration: const InputDecoration(hintText: 'Entrez a'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: B,
                    decoration: const InputDecoration(hintText: 'Entrez b'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: C,
                    decoration: const InputDecoration(hintText: 'Entrez c'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: D,
                    decoration: const InputDecoration(hintText: 'Entrez d'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: E,
                    decoration: const InputDecoration(hintText: 'Entrez e'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: F,
                    decoration: const InputDecoration(hintText: 'Entrez f'),
                    keyboardType: TextInputType.number,
                  ),
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
