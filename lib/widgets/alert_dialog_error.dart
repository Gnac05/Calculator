import 'package:flutter/material.dart';

AlertDialog alertDialogError(String plus) {
  return AlertDialog(
    content: Text('Désolé!!!\nVeuillez remplir toutes les valeurs $plus'),
    title: const Text('Error !!!'),
  );
}
