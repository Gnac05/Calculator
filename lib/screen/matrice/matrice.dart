import 'package:flutter/material.dart';
import 'package:gnac_caculator/screen/matrice/mat_size.dart';
import 'package:gnac_caculator/screen/matrice/taille.dart';
import 'package:gnac_caculator/screen/popupmenu.dart';

bool inverse = false;

class Resoudre extends StatefulWidget {
  const Resoudre({Key? key}) : super(key: key);

  @override
  State<Resoudre> createState() => _ResoudreState();
}

class _ResoudreState extends State<Resoudre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            //Déterminant
            child: ElevatedButton(
                onPressed: () {
                  if (isGenerator) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                    inverse = false;
                    return const TailleMatrice();
                  }));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                    inverse = false;
                    return const MatSize();
                  }));
                  }
                },
                child: const Text('Déterminant'))),
        const SizedBox(
          height: 20,
        ),
        //inverse
        ElevatedButton(
            onPressed: () {
              if (isGenerator) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                /*Inv()*/
                inverse = true;
                return const TailleMatrice();
              }));
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                /*Inv()*/
                inverse = true;
                return const MatSize();
              }));
              }
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
