// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:gnac_caculator/data/colors_app.dart';
import 'package:gnac_caculator/screen/matrice/det.dart';
import 'package:gnac_caculator/screen/matrice/matrice.dart';

class MatSize extends StatefulWidget {
  const MatSize({Key? key}) : super(key: key);

  @override
  _MatSizeState createState() => _MatSizeState();
}

int groupValueDet = 1;

class _MatSizeState extends State<MatSize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: inverse
            ? const Text(
                'Inverse',
                style: TextStyle(fontSize: 15),
              )
            : const Text(
                'Déterminant',
                style: TextStyle(fontSize: 15),
              ),
      ),
      body: SizedBox(
        height: 270,
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                    activeColor: ePcolor,
                    value: 0,
                    groupValue: groupValueDet,
                    onChanged: (i) => onChangedDet(0)),
                const Text('Matrice 2x2')
              ],
            ),
            Row(
              children: [
                Radio(
                    activeColor: ePcolor,
                    value: 1,
                    groupValue: groupValueDet,
                    onChanged: (i) => onChangedDet(1)),
                const Text('Matrice 3x3')
              ],
            ),
            Row(
              children: [
                Radio(
                    activeColor: ePcolor,
                    value: 2,
                    groupValue: groupValueDet,
                    onChanged: (i) => onChangedDet(2)),
                const Text('Matrice 4x4')
              ],
            ),
            Row(
              children: [
                Radio(
                    activeColor: ePcolor,
                    value: 3,
                    groupValue: groupValueDet,
                    onChanged: (i) => onChangedDet(3)),
                const Text('Matrice 5x5')
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Det()));
                },
                child: const Text('OK'))
          ],
        ),
      ),
    );
  }

  void onChangedDet(int i) {
    setState(() {
      groupValueDet = i;
    });
  }
}
