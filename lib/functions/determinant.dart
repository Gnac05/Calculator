
import 'dart:math';

double determinant(List matrice) {
  if (matrice.length == 1) {
    return matrice[0][0];
  } else {
    double det = 0;
    for (var i = 0; i < matrice.length; i++) {
      det +=
          (matrice[0][i] * pow(-1, 2 + i) * determinant(modif(matrice, 0, i)));
    }
    return det;
  }
}

List modif(List matrice, int lign, int column) {
  List new_lign = [];
  List to_conserve = [];
  List new_matrice = [];
  new_matrice = matrice.sublist(0);
  for (var i = 0; i < new_matrice.length; i++) {
    new_lign = new_matrice[i];
    to_conserve = new_lign.sublist(0);
    to_conserve.removeAt(column);
    new_matrice[i] = to_conserve.sublist(0);
  }
  new_matrice.removeAt(lign);
  return new_matrice;
}