// ignore_for_file: non_constant_identifier_names, prefer_is_empty

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gnac_caculator/data/colors_app.dart';
import 'package:gnac_caculator/model/dtb_equation.dart';
import 'package:gnac_caculator/model/equation.dart';
import 'package:gnac_caculator/screen/equation.dart';
import 'package:gnac_caculator/widgets/nodata.dart';

class EqutionHistorique extends StatefulWidget {
  const EqutionHistorique({Key? key}) : super(key: key);

  @override
  State<EqutionHistorique> createState() => _EqutionHistoriqueState();
}

List<EquationSD> equationsSD = [];

class _EqutionHistoriqueState extends State<EqutionHistorique> {
  @override
  @override
  void initState() {
    super.initState();
    refresh_db();
  }

  refresh_db() {
    DatabaseEquationSD().getAllEquationSD().then((value) {
      setState(() {
        equationsSD = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                                      DatabaseEquationSD().deleteTable();
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  const EqutionHistorique()));
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
        title: const Text('Historique'),
      ),
      body: (equationsSD.length == 0)
          ? const NoData(
              text: 'Désolé!!! Pas d\'équation du second ordre résolue')
          : Scrollbar(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return (index == 0 ||
                            equationsSD[index].day !=
                                equationsSD[index - 1].day)
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text(equationsSD[index].day),
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
                  itemCount: equationsSD.length),
            ),
    );
  }
}

Widget title(int index) {
  return SizedBox(
    height: 70,
    child: ListView(
      reverse: true,
      scrollDirection: Axis.horizontal,
      children: [
        Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '${double.parse(equationsSD[index].a) == 1 ? '' : double.parse(equationsSD[index].a) > 0 ? equationsSD[index].a : '(${equationsSD[index].a})'}x² ${double.parse(equationsSD[index].b) == 0 ? ' ' : double.parse(equationsSD[index].b) == 1 ? ' + x' : double.parse(equationsSD[index].b) > 0 ? ' + ${equationsSD[index].b}x' : ' - ${equationsSD[index].b.substring(1)}x'} ${double.parse(equationsSD[index].c) == 0 ? '' : double.parse(equationsSD[index].c) > 0 ? '+ ${equationsSD[index].c}' : ' - ${equationsSD[index].c.substring(1)}'} = 0',
                  style: const TextStyle(fontSize: 28)),
            )),
      ],
    ),
  );
}

Widget subtitle(int index) {
  return Container(
    alignment: Alignment.centerRight,
    child: SelectableText(
        signeDelta(
            pow(double.parse(equationsSD[index].b), 2) -
                4 *
                    double.parse(equationsSD[index].a) *
                    double.parse(equationsSD[index].c),
            double.parse(equationsSD[index].a),
            double.parse(equationsSD[index].b)),
        style: const TextStyle(fontSize: 30)),
  );
}
