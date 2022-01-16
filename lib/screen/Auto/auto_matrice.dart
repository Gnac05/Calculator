// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gnac_caculator/widgets/textfield.dart';

class AutoMatrice extends StatefulWidget {
  const AutoMatrice({ Key? key,required this.taille }) : super(key: key);
  final int taille;

  @override
  State<AutoMatrice> createState() => _AutoMatriceState();
}
 List<CustomTextFieldNumber> listTextField=[];
 List<Row> listRow=[];
 List<List<TextEditingController>> controllers=[];
 List<List<TextEditingController>> initialaze(int length) {
  List<TextEditingController> zero = [];
  List<List<TextEditingController>> _zero = [];
  
  for (var i = 0; i < length; i++) {
    zero.add(TextEditingController());
  }
  for (var i = 0; i < length; i++) {
    
    _zero.add(zero.sublist(0));
  }
  return _zero;
}
 Column MesRowTextField(int taille){
   controllers=initialaze(taille);
   for (var j = 0; j < taille; j++) {
     for (var i = 0; i < taille; i++) {
     controllers[j][i]=TextEditingController();
     listTextField.add(CustomTextFieldNumber(text: '${i+1}', controller_: controllers[j][i]));
   }
    listRow.add(Row(children: listTextField,));
    listTextField=[];
   }
   return Column(
     children:listRow
   );
 }
class _AutoMatriceState extends State<AutoMatrice> {
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Auto Matrice'),
      ),
      body: Column(
        children: [
          Expanded(flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: MesRowTextField(widget.taille),
            ),
          ),
          Expanded(
            child: ElevatedButton(onPressed: (){
              // print(controllers);
            }, child:const Text('Test')),
          )
        ],
      ),
    );
  }
}