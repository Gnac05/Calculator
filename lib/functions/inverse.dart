// S'assurer que le déterminant de la matrice est
//différent de zéro et
//que pour le moment c'est une matrice n>=3
import 'dart:math';

import 'package:fraction/fraction.dart';
import 'package:gnac_caculator/functions/determinant.dart';

List<List> inv(List<List> matrice) {
  int length = matrice.length;
  List<List> n_mat = initialaze(length);
  double inv_det = (1 / determinant(matrice));
  for (var i = 0; i < length; i++) {
    for (var j = 0; j < length; j++) {
      n_mat[i][j] = Fraction.fromDouble(
          determinant(modif(matrice, i, j)) * pow(-1, j + i) * inv_det);
    }
  }
  return tranpose(n_mat);
}

List<List> initialaze(int length) {
  List zero = [];
  List<List> _zero = [];
  List l;
  for (var i = 0; i < length; i++) {
    zero.add(0);
  }
  for (var i = 0; i < length; i++) {
    l = zero.sublist(0);
    _zero.add(l);
  }
  return _zero;
}

List<List> tranpose(List mat_inversible) {
  int length = mat_inversible.length;
  List<List> mat_helper = [];
  mat_helper = initialaze(length);
  int i = 0;
  int j = 0;
  for (i = 0; i < length; i++) {
    for (j = 0; j < length; j++) {
      mat_helper[i][j] = mat_inversible[j][i];
    }
  }
  return mat_helper;
}
