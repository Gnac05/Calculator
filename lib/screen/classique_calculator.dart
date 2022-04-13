// ignore_for_file: non_constant_identifier_names, unused_element, avoid_print, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:gnac_caculator/data/colors_app.dart';
import 'package:gnac_caculator/model/calcul.dart';
import 'package:gnac_caculator/model/dtb_calcul.dart';
import 'package:gnac_caculator/screen/popupmenu.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math';
import 'package:fraction/fraction.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// int _initialPage=0;
class Classique extends StatefulWidget {
  const Classique({Key? key}) : super(key: key);

  @override
  _ClassiqueState createState() => _ClassiqueState();
}

List<Calcul> calculs = [];
int isSelctedPageView = 0;
final controllerPageView = PageController(initialPage: 0);

class _ClassiqueState extends State<Classique> {
  String expression = "0";
  String result = "0";
  double size_expression = 45;
  double size_result = 30;
  bool s_to_d = false;
  bool cursor = false;
  int positionCursorStart = 0;
  int positionCursorEnd = 1;

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
  //true : char is inside
  //false : char is not inside
  // bool detector_of_comma(int length, String text) {
  //   int i = 0;
  //   int a = text.codeUnits[0];
  //   while (i < length && a != 44) {
  //     i += 1;
  //     if (i == length) {
  //       break;
  //     } else {
  //       a = text.codeUnits[i];
  //     }
  //   }
  //   if (i < length) {
  //     //print('Il y a une virgule dans $text');
  //     return true;
  //   } else {
  //     //print('Il ny a pas une virgule dans $text');
  //     return false;
  //   }
  // }

  bool detector_of_char(int length, String text, int char_code_ascii) {
    int i = 0;
    int a = text.codeUnits[0];
    while (i < length && a != char_code_ascii) {
      i += 1;
      if (i == length) {
        break;
      } else {
        a = text.codeUnits[i];
      }
    }
    if (i < length) {
      return true;
    } else {
      return false;
    }
  }

  //fonction which allow to supprim a string
  // supprim(String expression, String word_supprim) {
  //   int _length = expression.length;
  //   int length_word = expression.length - word_supprim.length;
  //   if (_length >= 0) {
  //     if (expression.length == 1) {
  //       expression = '0';
  //     } else {

  //       if (length_word < 0) {
  //         expression = expression.substring(0, expression.length - 1);
  //       } else {
  //         if (expression.substring(length_word) == word_supprim) {
  //           length_word == 0
  //               ? expression = "0"
  //               : expression = expression.substring(0, length_word);
  //         } else {
  //           expression = expression.substring(0, expression.length - 1);
  //         }
  //       }
  //     }
  //   }
  // }

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
            cursor = false;
            positionCursorStart = 0;
            positionCursorEnd = 1;
            break;
          }
        case "DEL":
          {
            if (expression == 'ERROR' ||
                expression == 'Infinity' ||
                expression == 'NaN') {
              expression = '0';
            }
            int _length = expression.length;

            if (_length > 3 || _length == 3) {
              String word = expression.substring(_length - 3);
              switch (word) {
                case 'MOD':
                  expression == 'MOD'
                      ? expression = '0'
                      : expression = expression.substring(0, _length - 3);
                  break;
                case 'ln(':
                  expression == 'ln('
                      ? expression = '0'
                      : expression = expression.substring(0, _length - 3);
                  break;
                case 'og(':
                  expression == 'log('
                      ? expression = '0'
                      : expression = expression.substring(0, _length - 4);
                  break;
                case 'an(':
                  expression == 'tan('
                      ? expression = '0'
                      : expression = expression.substring(0, _length - 4);
                  break;
                case 'os(':
                  expression == 'cos('
                      ? expression = '0'
                      : expression = expression.substring(0, _length - 4);
                  break;
                case 'in(':
                  expression == 'sin('
                      ? expression = '0'
                      : expression = expression.substring(0, _length - 4);
                  break;
                case '10^':
                  expression == '10^'
                      ? expression = '0'
                      : expression = expression.substring(0, _length - 3);
                  break;
                default:
                  expression = expression.substring(0, _length - 1);
              }
            } else {
              _length == 1
                  ? expression = '0'
                  : expression = expression.substring(0, _length - 1);
              //  expression = expression.substring(0, _length - 1);
            }

            String equation = '';
            equation = expression;
            equation = equation.replaceAll(',', '.');
            equation = equation.replaceAll('MOD', '%');
            equation = equation.replaceAll('π', '$pi');
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
            // if (_length > 0 || _length == 0) {
            //   if (expression.length == 1) {
            //     expression = '0';
            //   } else {
            //     int lengthMOD = expression.length - 3;
            //     if (lengthMOD < 0) {
            //       expression = expression.substring(0, expression.length - 1);
            //     } else {
            //       if (expression.substring(lengthMOD) == 'MOD') {
            //         lengthMOD == 0
            //             ? expression = "0"
            //             : expression = expression.substring(0, lengthMOD);
            //       } else {
            //         expression = expression.substring(0, expression.length - 1);
            //       }
            //     }
            //   }
            // }

            // supprim(expression, 'ln(');
            // supprim(expression, 'log(');

            break;
          }
        case "=":
          {
            String equation = '';
            equation = expression;
            equation = equation.replaceAll(',', '.');
            equation = equation.replaceAll('π', '$pi');
            equation = equation.replaceAll('MOD', '%');
            equation = equation.replaceAll('√', 'sqrt');
            equation = equation.replaceAll('÷', '/');
            equation = equation.replaceAll('x', '*');
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

            if (expression != '0' &&
                result != expression &&
                (calculs.length == 0 ||
                    expression != calculs[calculs.length - 1].expression)) {
              Map<String, dynamic> map = {
                'expression': expression,
                'result': result,
                'date': date(DateTime.now().toString().substring(0, 10))
              };
              Calcul calcul = Calcul();
              calcul.fromMap(map);
              DatabaseCalcul().addCalcul(calcul).then((value) => recover());
            }
            expression = result;

            break;
          }
        case "ln":
          if (positionCursorEnd == positionCursorStart) {
            String start = expression.substring(0, positionCursorStart);
            String end = expression.substring(positionCursorEnd);
            expression = start + 'ln(' + end;
            positionCursorEnd = positionCursorEnd + 3;
            positionCursorStart = positionCursorStart + 3;
          } else {
            expression == '0' ? expression = 'ln(' : expression += 'ln(';
          }
          break;
        case "√":
          expression == '0' ? expression = '√(' : expression += '√(';
          break;
        case "cos":
          expression == '0' ? expression = 'cos(' : expression += 'cos(';
          break;
        case "sin":
          expression == '0' ? expression = 'sin(' : expression += 'sin(';
          break;
        case "tan":
          expression == '0' ? expression = 'tan(' : expression += 'tan(';
          break;
        case "e":
          expression == '0' ? expression = 'e^' : expression += 'e^';
          break;
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
          equation = equation.replaceAll('π', '$pi');
          equation = equation.replaceAll('√', 'sqrt');
          equation = equation.replaceAll('x', '*');
          equation = equation.replaceAll('÷', '/');

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

  _toFraction(String number) {
    String _number = number.replaceAll(',', '.');
    double n = double.tryParse(_number)!;
    return Fraction.fromDouble(n);
  }

  Widget ColorText(String text, Color color) {
    return TextButton(
      onPressed: () => changed(text),
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(color: color, fontSize: 30),
        ),
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
                  mainAxisAlignment: s_to_d
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(s_to_d ? 'S <=> D' : ''),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 10),
                    //   child: ElevatedButton(
                    //       onPressed: () {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => const Resolution()));
                    //       },
                    //       child: const Padding(
                    //         padding: EdgeInsets.all(8.0),
                    //         child: Text('RSE2I'),
                    //       )),
                    // ),
                    const PopupMenu()
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
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            //height: 300,
                            alignment: Alignment.centerRight,
                            child: ListView(
                              reverse: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                TextSelectionTheme(
                                  data: TextSelectionThemeData(
                                      selectionColor: ePcolor,
                                      cursorColor: ePcolor),
                                  child: SelectableText(
                                    expression,
                                    showCursor: cursor,
                                    onTap: () {
                                      setState(() {
                                        cursor = false;
                                      });
                                    },
                                    onSelectionChanged: (textSelection, cause) {
                                      print('Début ${textSelection.start}');
                                      print('fin ${textSelection.end}');
                                      setState(() {
                                        positionCursorStart =
                                            textSelection.start;
                                        positionCursorEnd = textSelection.end;
                                      });
                                    },
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
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: FittedBox(
                              child: SelectableText(
                                result == ''
                                    ? result
                                    : result.codeUnits[0] > 47
                                        ? result.codeUnits[0] < 58
                                            ? s_to_d
                                                ? detector_of_char(
                                                        result.length,
                                                        result,
                                                        44)
                                                    ? '${_toFraction(result)}'
                                                    : sequencer(result)
                                                : detector_of_char(
                                                        result.length,
                                                        result,
                                                        44)
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
                        ),
                      )
                    ],
                  ),
                )),

            Expanded(
                child: SmoothPageIndicator(
                controller: controllerPageView,
                count: 2,
                effect: WormEffect(
                  activeDotColor: ePcolor
                ),
                onDotClicked: (int index) {
                  controllerPageView.animateToPage(index,
                      duration: Duration(milliseconds: 1024),
                      curve: Curves.easeInQuad);
                },
            )
                //     Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       height: 10,
                //       width: isSelctedPageView==1? 10 : 20,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color:isSelctedPageView==1? Colors.grey : ePcolor
                //       ),
                //     ),
                //     SizedBox(width: 15,),
                //     Container(
                //       height: 10,
                //       width: isSelctedPageView==0? 10 : 20,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color:isSelctedPageView==0? Colors.grey : ePcolor
                //       ),
                //     ),
                //   ],
                // )
                ),

            Expanded(
              flex: 10,
              child: PageView(
                controller: controllerPageView,
                onPageChanged: (index) {
                  setState(() {
                    isSelctedPageView = index;
                  });
                },
                children: [
                  Column(
                    children: [
                      // première ligne
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(child: ColorText("AC", ePcolor)),
                            Expanded(child: ColorText("÷", ePcolor)),
                            Expanded(child: ColorText("x", ePcolor)),
                            Expanded(child: ColorText("DEL", ePcolor))
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
                            Expanded(child: ColorText("-", ePcolor)),
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
                            Expanded(child: ColorText("+", ePcolor)),
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
                                            child: FittedBox(
                                                child: ColorText(
                                                    "MOD", Colors.black))),
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
                                decoration: BoxDecoration(
                                    color: ePcolor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
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
                          Expanded(child: ColorText('(', ePcolor)),
                          Expanded(child: ColorText(')', ePcolor)),
                          //Expanded(child: ColorText('√', ePcolor)),
                          Expanded(child: ColorText('x', ePcolor)),
                          // Expanded(child: ColorText('π', ePcolor)),
                          Expanded(child: ColorText('DEL', ePcolor)),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(child: ColorText('^', Colors.black)),
                          // Expanded(child: ColorText('P', Colors.black)),
                          // Expanded(child: ColorText('C', Colors.black)),
                          Expanded(child: ColorText('ln', Colors.black)),
                          Expanded(child: ColorText('√', Colors.black)),
                          Expanded(child: ColorText('-', ePcolor)),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(child: ColorText('cos', Colors.black)),
                          Expanded(child: ColorText('sin', Colors.black)),
                          Expanded(child: ColorText('tan', Colors.black)),
                          Expanded(child: ColorText('+', ePcolor)),
                        ],
                      )),
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
                                                ColorText('10^', Colors.black)),
                                        Expanded(
                                            child:
                                                ColorText('e', Colors.black)),
                                        Expanded(
                                            child: ColorText('÷', ePcolor)),
                                      ],
                                    )),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Expanded(
                                            child:
                                                ColorText("π", Colors.black)),
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  s_to_d = !s_to_d;
                                                });
                                              },
                                              child: FittedBox(
                                                child: const Text(
                                                  'S <=> D',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              )),
                                        )),
                                        Expanded(
                                            child: ColorText("AC", ePcolor))
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
                                decoration: BoxDecoration(
                                    color: ePcolor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                child: ColorText("=", Colors.white),
                              ),
                            )),
                          ],
                        ),
                      )
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

  void recover() {
    DatabaseCalcul().allCalcul().then((value) {
      setState(() {
        calculs = value;
      });
    });
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

//Cette fonction permet de connaitre la date sous le format jour mois année
//elle prend en paramètre la date sous le format AAAA-MM-JJ
String date(String dateTime) {
  //dateTime = 2021-12-27
  String ans = dateTime.substring(0, 4); //2021
  String month = dateTime.substring(5, 7); //12
  String day = dateTime.substring(8); //27

  switch (month) {
    case '01':
      month = 'Janvier';
      break;
    case '02':
      month = 'Février';
      break;
    case '03':
      month = 'Mars';
      break;
    case '04':
      month = 'Avril';
      break;
    case '05':
      month = 'Mai';
      break;
    case '06':
      month = 'Juin';
      break;
    case '07':
      month = 'Juillet';
      break;
    case '08':
      month = 'Août';
      break;
    case '09':
      month = 'Septembre';
      break;
    case '10':
      month = 'Octobre';
      break;
    case '11':
      month = 'Novembre';
      break;
    default:
      month = 'Décembre';
  }
  String _date;
  _date = '$day $month $ans';
  return _date;
}
