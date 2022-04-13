import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';
import 'package:gnac_caculator/functions/determinant.dart';
import 'package:gnac_caculator/functions/inverse.dart';
import 'package:gnac_caculator/screen/matrice/det.dart';
import 'package:gnac_caculator/screen/matrice/matrice.dart';
import 'package:gnac_caculator/widgets/alert_dialog_error.dart';
import 'package:gnac_caculator/widgets/textfield.dart';

List controllerList = [];
List <List>  doubleList = [];

class Generator extends StatefulWidget {
  const Generator({Key? key, required this.matTaille}) : super(key: key);
  final int matTaille;

  @override
  State<Generator> createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
  @override
  Widget build(BuildContext context) {
    //ces 8 lignes dernière permettent de generer
    //une matrice de taille [matTaille] composé de
    //[TextEditingController]
    controllerList=[];
    for (var i = 0; i < widget.matTaille; i++) {
      List listTemp = [];
      for (var j = 0; j < widget.matTaille; j++) {
        listTemp.add(TextEditingController());
      }
      controllerList.add(listTemp.sublist(0));
    }

    //ces 8 lignes dernière permettent de generer
    //une matrice de taille [matTaille] composé de
    //[double]
    doubleList=[];
    for (var i = 0; i < widget.matTaille; i++) {
      List /* <List<double>> */ listTemp = [];
      for (var j = 0; j < widget.matTaille; j++) {
        double temp = 0;
        listTemp.add(temp);
      }
      doubleList.add(listTemp.sublist(0));
    }

    // print('initial : $doubleList');
    // doubleList[1][0]=6.5;
    // doubleList[0][0]=9.0;
    // print('after modi : $doubleList');

    /* 
    ? Ces commentaires permettent d'avoir une matrice 
    ? générée automatiquement il est le pionné 
    Expanded expanded = Expanded(
        child: Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(9)),
      ),
    ));
    List<Expanded> expandedList = [];
    for (var i = 0; i < matTaille; i++) {
      expandedList.add(expanded);
    }

    Expanded row = Expanded(child: Row(children: expandedList));
    List<Expanded> rowList = [];
    for (var i = 0; i < matTaille; i++) {
      rowList.add(row);
    } */

    /* 
    ?ces commentaires permettent d'avoir une interface 
    ?semblable à celle au niveau de matrice/déterminer
    Expanded expandedCustom(String text) {return Expanded(
        child: Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(9)),
            child: Text(text,style: TextStyle(color: Colors.white),),
      ),
    ));}
    List<Expanded> containerList=[];
    List<Expanded> generatorList=[];
    for (var i = 0; i < matTaille; i++) {
      for (var j = 0; j < matTaille; j++) {
        containerList.add(expandedCustom('$i $j'));
      }
      generatorList.add(Expanded(child: Row(children: containerList,)));
      containerList=[];
    } */

// Maintenant commençons les bonnes choses
// Pour générer le code automatiquements
    List<Expanded> containerList = [];
    List<Expanded> generatorList = [];
    for (var i = 0; i < widget.matTaille; i++) {
      for (var j = 0; j < widget.matTaille; j++) {
        containerList.add(Expanded(
            child: Padding(
          padding: const EdgeInsets.all(2),
          child: CustomTextFieldNumber(
              text: '${String.fromCharCode(97 + i)}${j + 1}',
              controller_: controllerList[i][j]),
        )));
      }
      generatorList.add(Expanded(
          child: Row(
        children: containerList,
      )));
      containerList = [];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Generator'),
        leading: IconButton(
          onPressed: () {
            doubleList=[];
            containerList=[];
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
      ),
      body: 
      // widget.matTaille == 0
      //     ? Center(
      //         child: Text(
      //           'Error, La taille ne doit pas être nulle',
      //           style: TextStyle(fontSize: 15),
      //         ),
      //       )
      //     :
           Column(
              children: [
                Expanded(
                    flex: widget.matTaille,
                    child: /*ListView(children: rowList,) */ Center(
                        child: Column(
                      children: generatorList,
                    ) /* Row(children: expandedList,) )*/)),
                Expanded(
                    flex: widget.matTaille > 7 ? 1 : 2,
                    child: Center(
                      child: ElevatedButton(
                          child: Text('Résolution'),
                          onPressed: () {
                            if (isValide()) {
                              loadingMatrice();
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text('Résultat'),
                                        content: SizedBox(
                                          height: 150,
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                child: CustomResult()
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                            }else{
                              showDialog(
                        context: context,
                        builder: (builder) =>
                            alertDialogError('de la matrice'));
                            }
                          }),
                    ))
              ],
            ),
    );
  }

Widget CustomResult(){
   if (inverse) {
        if (determinant(doubleList) == 0) {
          return MonText(
              'Le cette matrice n\'est pas inversible car le déterminant est nul');
        } else {
          
          return Matrice(inv(doubleList));
        }
      } else {
        return MonText('${Fraction.fromDouble(determinant(doubleList))}');
      }

}

  bool isValide() {
    for (var i = 0; i < widget.matTaille; i++) {
      for (var j = 0; j < widget.matTaille; j++) {
        if (controllerList[i][j].text == '') {
          return false;
        }
      }
    }
    return true;
  }

  loadingMatrice() {
    for (var i = 0; i < widget.matTaille; i++) {
      for (var j = 0; j < widget.matTaille; j++) {
        doubleList[i][j] = double.parse(controllerList[i][j].text);
      }
    }
  }
}
