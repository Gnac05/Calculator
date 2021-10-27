// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gnac_caculator/screen/RSE2I.dart';
import 'package:math_expressions/math_expressions.dart';

class Classique extends StatefulWidget {
  const Classique({Key? key}) : super(key: key);

  @override
  _ClassiqueState createState() => _ClassiqueState();
}

class _ClassiqueState extends State<Classique> {
  String expression = "0";
  String result = "0";
  double size_expression = 45;
  double size_result = 30;

  // Fonctions utils
  //1
  sequencer(String number) {
    int length = number.length;
    String newnomnber = '';
    while (length > 3) {
      newnomnber = number.substring(number.length - 3) + newnomnber;
      number = number.substring(0, number.length - 3);
      newnomnber = ' ' + newnomnber;
      length -= 3;
    }
    newnomnber = number + newnomnber;
    number = newnomnber;
    return number;
  }

  //2
  //true : comma is inside
  //false : comma is not inside
  bool detector_of_comma(int length, String text) {
    int i = 0;
    int a = text.codeUnits[0];
    while (i < length && a != 44) {
      i += 1;
      if (i == length) {
        break;
      } else {
        a = text.codeUnits[i];
      }
    }
    if (i < length) {
      //print('Il y a une virgule dans $text');
      return true;
    } else {
      //print('Il ny a pas une virgule dans $text');
      return false;
    }
  }

//3 head
  changed(String symbol) {
    setState(() {
      if (symbol == '=') {
        size_expression = 30;
        size_result = 45;
      } else {
        size_expression = 45;
        size_result = 30;
      }
      switch (symbol) {
        case "AC":
          {
            expression = "0";
            result = "0";
            break;
          }
        case "DEL":
          {
            expression.length == 1
                ? expression = '0'
                : expression = expression.substring(0, expression.length - 1);
            if (expression.substring(expression.length - 3) == 'MOD') {
              expression = expression.substring(0, expression.length - 3);
            }
            break;
          }
        case "=":
          {
            String equation = '';
            equation = expression;
            equation = equation.replaceAll(',', '.');
            try {
              Parser p = Parser();
              Expression exp = p.parse(equation);
              ContextModel cm = ContextModel();
              result = '${exp.evaluate(EvaluationType.REAL, cm)}';
              result = result.replaceAll('.', ',');
            } catch (e) {
              result = 'ERROR';
            }
            if (result.substring(result.length - 2) == ',0') {
              result = result.substring(0, result.length - 2);
            }

            break;
          }
        default:
          if (expression == "0") {
            if (symbol == ",") {
              expression = expression + symbol;
            } else {
              expression = symbol;
            }
          } else {
            expression = expression + symbol;
          }

          String equation = '';
          equation = expression;
          equation = equation.replaceAll(',', '.');
          equation = equation.replaceAll('MOD', '%');
          try {
            Parser p = Parser();
            Expression exp = p.parse(equation);
            ContextModel cm = ContextModel();
            result = '${exp.evaluate(EvaluationType.REAL, cm)}';
            result = result.replaceAll('.', ',');
          } catch (e) {
            result = "...";
          }
          if (result.substring(result.length - 2) == ',0') {
            result = result.substring(0, result.length - 2);
          }
      }
    });
  }

  Widget ColorText(String text, Color color) {
    return TextButton(
      onPressed: () => changed(text),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: text == 'MOD' ? 30 : 35),
      ),
    );
  }

  //Same actions that the last function but with color blue
  // Widget TextColor(String text, Color color) {
  //   return ElevatedButton(
  //     onPressed: () => changed(text),
  //     child: Text(
  //       text,
  //       style: TextStyle(color: color, fontSize: text=='MOD'? 25 : 35),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Resolution()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('RSE2I'),
                        ))
                  ],
                )),

            //operation
            Expanded(
                flex: 6,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white70),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            alignment: Alignment.centerRight,
                            child: ListView(
                              reverse: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 28),
                                  child: Text(
                                    expression,
                                    style: TextStyle(
                                        fontSize: size_expression,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              result.codeUnits[0] > 47
                                  ? result.codeUnits[0] < 58
                                      ? detector_of_comma(result.length, result)
                                          ? result
                                          : sequencer(result)
                                      : result
                                  : result,
                              style: TextStyle(
                                  fontSize: size_result,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),

            Expanded(
              flex: 10,
              child: PageView(
                children: [
                  Column(
                    children: [
                      // première ligne
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(child: ColorText("AC", Colors.purple)),
                            Expanded(child: ColorText("/", Colors.purple)),
                            Expanded(child: ColorText("*", Colors.purple)),
                            Expanded(child: ColorText("DEL", Colors.purple))
                          ],
                        ),
                      ),

                      // deuxième ligne
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(child: ColorText("7", Colors.black)),
                            Expanded(child: ColorText("8", Colors.black)),
                            Expanded(child: ColorText("9", Colors.black)),
                            Expanded(child: ColorText("-", Colors.purple)),
                          ],
                        ),
                      ),

                      // troisième ligne
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(child: ColorText("4", Colors.black)),
                            Expanded(child: ColorText("5", Colors.black)),
                            Expanded(child: ColorText("6", Colors.black)),
                            Expanded(child: ColorText("+", Colors.purple)),
                          ],
                        ),
                      ),

                      //quatrième et dernière ligne
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Expanded(
                                            child:
                                                ColorText("1", Colors.black)),
                                        Expanded(
                                            child:
                                                ColorText("2", Colors.black)),
                                        Expanded(
                                            child: ColorText("3", Colors.black))
                                      ],
                                    )),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Expanded(
                                            child:
                                                ColorText("MOD", Colors.black)),
                                        Expanded(
                                            child:
                                                ColorText("0", Colors.black)),
                                        Expanded(
                                            child: ColorText(",", Colors.black))
                                      ],
                                    ))
                                  ],
                                )),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                width: 40,
                                decoration: const BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: ColorText("=", Colors.white),
                              ),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),

                  //scientis keyboard
                  Column(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(child: ColorText('(', Colors.purple)),
                          Expanded(child: ColorText(')', Colors.purple)),
                          Expanded(child: ColorText('√', Colors.purple)),
                          Expanded(child: ColorText('π', Colors.purple)),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(child: ColorText('^', Colors.black)),
                          Expanded(child: ColorText('P', Colors.black)),
                          Expanded(child: ColorText('C', Colors.black)),
                          Expanded(child: ColorText('ln', Colors.purple)),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(child: ColorText('cos', Colors.black)),
                          Expanded(child: ColorText('sin', Colors.black)),
                          Expanded(child: ColorText('tan', Colors.black)),
                          Expanded(child: ColorText('log', Colors.purple)),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(child: ColorText('arcos', Colors.black)),
                          Expanded(child: ColorText('arcsin', Colors.black)),
                          Expanded(child: ColorText('arctan', Colors.black)),
                          Expanded(child: ColorText('!', Colors.purple)),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(child: ColorText('ch', Colors.black)),
                          Expanded(child: ColorText('sh', Colors.black)),
                          Expanded(child: ColorText('th', Colors.black)),
                          Expanded(child: ColorText('e', Colors.purple)),
                        ],
                      )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class ColorText extends StatefulWidget {
//   const ColorText({Key? key, required this.text, required this.color})
//       : super(key: key);
//   final String text;
//   final Color color;

//   @override
//   State<ColorText> createState() => _ColorTextState();
// }

// class _ColorTextState extends State<ColorText> {

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: changed(widget.text),
//       child: Text(
//         widget.text,
//         style: TextStyle(color: widget.color, fontSize: 20),
//       ),
//     );
//   }
// }
