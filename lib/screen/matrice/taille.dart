import 'package:flutter/material.dart';
import 'package:gnac_caculator/screen/matrice/generator.dart';
import 'package:gnac_caculator/screen/popupmenu.dart';

class TailleMatrice extends StatefulWidget {
  const TailleMatrice({Key? key}) : super(key: key);

  @override
  State<TailleMatrice> createState() => _TailleMatriceState();
}

TextEditingController taille = TextEditingController();
int _taille = 0;

class _TailleMatriceState extends State<TailleMatrice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taille de la Matrice'),
        leading: IconButton(
          onPressed: () {
            taille=TextEditingController();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Taille',
              ),
              controller: taille,
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: () async {
                  String temp = taille.text;
                  // print('TextField : $taille');
                  // print('text : $temp');
                 try {
                  _taille = await int.parse(temp);
                  _taille==0? showDialog(context: context, builder:(context){
                      return AlertDialog(
                        title: Text('Error!!!'),
                        content: Text('Veuiller entrer un entier naturel différent de zéro (0). Merci de recommencer.'),
                      );
                    }):
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) /*=> Generator(matTaille: _taille) */ {
                        isGenerator=false;
                    return Generator(matTaille: _taille);
                  }));
                 } catch (e) {
                    showDialog(context: context, builder:(context){
                      return AlertDialog(
                        title: Text('Error!!!'),
                        content: Text('Veuiller entrer un entier naturel différent de zéro (0). Merci de recommencer.'),
                      );
                    });
                 }
                  
                },
                child: Text('Confirmer'))
          ],
        ),
      ),
    );
  }
}
