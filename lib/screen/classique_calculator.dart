import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            break;
          }
        case "=":
          try {
            Parser p = Parser();
            Expression exp = p.parse(expression);
            ContextModel cm = ContextModel();
            result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          } catch (e) {
            result = 'ERROR';
          }
          break;
        default:
          expression == "0"
              ? expression = symbol
              : expression = expression + symbol;
      }
    });
  }

  Widget ColorText(String text, Color color) {
    return TextButton(
      onPressed: () => changed(text),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(color: Colors.white70),
              )),

          //operation
          Expanded(
              flex: 6,
              child: Container(
                width: 1000,
                height: 1000,
                decoration: const BoxDecoration(color: Colors.white70),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Text(
                            expression,
                            style: TextStyle(
                                fontSize: size_expression,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      flex: 2,
                    ),
                    Expanded(
                        child: Text(
                      result,
                      style: TextStyle(
                          fontSize: size_result, fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
              )),

          Expanded(
              flex: 10,
              child: Column(
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
                                        child: ColorText("1", Colors.black)),
                                    Expanded(
                                        child: ColorText("2", Colors.black)),
                                    Expanded(
                                        child: ColorText("3", Colors.black))
                                  ],
                                )),
                                Expanded(
                                    child: Row(
                                  children: [
                                    Expanded(
                                        child: ColorText("%", Colors.black)),
                                    Expanded(
                                        child: ColorText("0", Colors.black)),
                                    Expanded(
                                        child: ColorText(",", Colors.black))
                                  ],
                                ))
                              ],
                            )),
                        Expanded(
                            child: Container(
                          height: 100,
                          width: 40,
                          decoration: const BoxDecoration(
                              color: Colors.purple,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: ColorText("=", Colors.white),
                        )),
                      ],
                    ),
                  )
                ],
              ))
        ],
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
