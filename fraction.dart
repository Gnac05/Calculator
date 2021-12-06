import 'package:fraction/fraction.dart';

 main() {
  final f1= Fraction.fromDouble(1652235.22);
  //final reduce=f1.reduce();
  print(f1);
  print(_toFraction('12,6'));
  print(!false);

}
  _toFraction(String number){
    String _number=number.replaceAll(',', '.');
    double n=double.tryParse(_number)!;
    return Fraction.fromDouble(n)  ;
  }
