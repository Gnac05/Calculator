import 'package:flutter/material.dart';

class APropos extends StatelessWidget {
  const APropos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A propos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(
              child: Center(
                  child: Column(
                children: [
                  SizedBox(
                    width: 250,
                    height: 200,
                    child: Image.asset('assets/image/icon.png'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Notre Appli fait non seulement les calculs mais aussi plein d'autre chose comme le calcul du déterminant des matrices, donne l'inverse d'une matrice, résoud non seulement un système d'équation mais aussi les équations du second ordre.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ),
            SizedBox(
              height: 20
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    """
Auteur: GNACADJA Serge (github.com/Gnac05)

Maintenance: Equipe Veneficus @ePatriote.com

Email: contact@epatriote.com 

Site: LaSyntax.com""",
                    style: TextStyle(fontSize: 13),
                  ),
                  Text("(C) ePatriote - Tous droits réservés.")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
