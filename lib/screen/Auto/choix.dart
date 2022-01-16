// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gnac_caculator/screen/Auto/auto_matrice.dart';
import 'package:gnac_caculator/widgets/alert_dialog_error.dart';
import 'package:gnac_caculator/widgets/textfield.dart';

class Choix extends StatefulWidget {
  const Choix({ Key? key }) : super(key: key);

  @override
  State<Choix> createState() => _ChoixState();
}
TextEditingController choix=TextEditingController();
int monchoix=0;
class _ChoixState extends State<Choix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Choix'),),
      body: Column(
        children: [
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: CustomTextFieldNumber(text: 'Votre Choix', controller_: choix),
         ),
         const SizedBox(height: 10),
         ElevatedButton(onPressed: (){
           double temp=0; temp=double.parse(choix.text);
           monchoix=temp.toInt();
           if (monchoix<0||monchoix-temp!=0) {
              showDialog(context: context, builder: (builder){
                return alertDialogError('correctement en entrant un entier naturel strictement positif.');
              });
           } else {
             Navigator.push(context, MaterialPageRoute(builder: (builder)=>AutoMatrice(taille: monchoix)));
           }

         }, child: Text('OK'))
        ],
      ),
    );
  }
}