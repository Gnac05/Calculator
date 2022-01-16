import 'package:flutter/material.dart';
import 'package:gnac_caculator/screen/matrice/mat_size.dart';

bool inverse = false;

class Matrice extends StatefulWidget {
  const Matrice({Key? key}) : super(key: key);

  @override
  State<Matrice> createState() => _MatriceState();
}

class _MatriceState extends State<Matrice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            //Déterminant
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    inverse = false;
                    return const MatSize();
                  }));
                },
                child: const Text('Déterminant'))),
        const SizedBox(
          height: 20,
        ),
        //inverse
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                /*Inv()*/
                inverse = true;
                return const MatSize();
              }));
            },
            child: const Text('Inverse')),
        const SizedBox(
          height: 20,
        ),
        //produit matricielle
        // ElevatedButton(
        //     onPressed: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => const ToDev()));
        //     },
        //     child: const Text('Produit Matriciel')),
      ],
    ));
  }
}
