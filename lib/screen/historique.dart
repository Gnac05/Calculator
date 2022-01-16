// ignore_for_file: unused_element, prefer_is_empty, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gnac_caculator/data/colors_app.dart';
import 'package:gnac_caculator/model/dtb_calcul.dart';
import 'package:gnac_caculator/widgets/nodata.dart';
import 'classique_calculator.dart';

class Historique extends StatefulWidget {
  const Historique({Key? key}) : super(key: key);

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  @override
  @override
  void initState() {
    super.initState();
    recover();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique'),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (builder) {
                      return AlertDialog(
                        title: const Text('Effacer'),
                        content: SizedBox(
                          height: 90,
                          child: Column(
                            children: [
                              const Text('Effacer l\'historique'),
                              const Divider(),
                              Row(
                                children: [
                                  Expanded(
                                      child: TextButton(
                                          onPressed: () {
                                            // DatabaseCalcul().deleteCalcul(2, calcultable);
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'IGNORER',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ))),
                                  Expanded(
                                      child: TextButton(
                                    onPressed: () async {
                                      DatabaseCalcul().deleteTable();
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  const Historique()));
                                    },
                                    child: Text(
                                      'EFFACER',
                                      style: TextStyle(
                                          color: ePcolor),
                                    ),
                                  ))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: (calculs.length == 0)
          ? const NoData(
              text:
                  'Vous n\'avez pas encore faire de calcul. Veiller le faire et appuyer sur = pour l\'enregistrer. Merci pour la compréhension')
          : Scrollbar(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return (index == 0 ||
                            calculs[index].date != calculs[index - 1].date)
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text(calculs[index].date),
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                              ListTile(
                                subtitle: subtitle(index),
                                title: title(index),
                              ),
                            ],
                          )
                        : ListTile(
                            subtitle: subtitle(index), title: title(index));
                  },
                  itemCount: calculs.length),
            ),
    );
  }

  void recover() {
    DatabaseCalcul().allCalcul().then((value) {
      setState(() {
        calculs = value;
      });
    });
  }
}

Widget title(int index) {
  return Container(
    height: 70,
    child: ListView(
      reverse: true,
      scrollDirection: Axis.horizontal,
      children: [
        Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectableText(calculs[index].expression,
                  style: const TextStyle(fontSize: 45)),
            )),
      ],
    ),
  );
}

Widget subtitle(int index) {
  return Container(
    alignment: Alignment.centerRight,
    child: SelectableText(calculs[index].result,
        style: const TextStyle(fontSize: 30)),
  );
}
