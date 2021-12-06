import 'package:flutter/material.dart';
import 'package:gnac_caculator/screen/equation.dart';
import 'package:gnac_caculator/screen/graphe.dart';
import 'package:gnac_caculator/screen/matrice/matrice.dart';
import 'package:gnac_caculator/widgets/popup.dart';

import 'RSE2I.dart';
class PopupMenu extends StatelessWidget {
  const PopupMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) =>[
        const PopupMenuItem(child: PopupWidget(text: 'Système d\'équations', widget:Resolution())),
        const PopupMenuItem(child: PopupWidget(text: 'Matrice', widget: Matrice())),
        const PopupMenuItem(child: PopupWidget(text: 'Graphe', widget: Graphe())),
        const PopupMenuItem(child: PopupWidget(text: 'Equation', widget: Equation())),
      ],
    );
  }
}
