import 'package:flutter/material.dart';
import 'package:gnac_caculator/screen/matrice/det.dart';
import 'package:gnac_caculator/screen/matrice/inv.dart';

class Matrice extends StatelessWidget {
  const Matrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Det()));
                },
                child: const Text('Déterminant'))),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Inv()));
            },
            child: const Text('Inverse')),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Autres')),
      ],
    ));
  }
}
