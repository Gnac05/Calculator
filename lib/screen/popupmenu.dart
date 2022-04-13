import 'package:flutter/material.dart';
import 'package:gnac_caculator/screen/apropos.dart';
import 'package:gnac_caculator/screen/historique.dart';
import 'package:gnac_caculator/screen/matrice/matrice.dart';
import 'package:gnac_caculator/widgets/popup.dart';
import 'RSENI.dart';
import 'equation.dart';

bool isGenerator=false;
class PopupMenu extends StatelessWidget {
  const PopupMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem(
            child: PopupWidget(text: 'Equation', widget: Equation())),
        // const PopupMenuItem(child: PopupWidget(text: 'Graphe', widget: /*ToDev()*/ Graphe())),
        const PopupMenuItem(
            child: PopupWidget(text: 'Historique', widget: Historique())),
        const PopupMenuItem(
            child: PopupWidget(text: 'Matrice', widget: Resoudre())),
        const PopupMenuItem(
            child: PopupWidget(
                text: 'Système d\'équations', widget: Resolution())),
        const PopupMenuItem(
            child: PopupWidget(text: 'A Propos', widget: APropos())),
        PopupMenuItem(child: ListTile(
      onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) {
            isGenerator=true;
            return Resoudre();
          }));
    } ,
      title: Text(
        'Generator',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ))
      ],
    );
  }
}
