import 'package:flutter/material.dart';
import 'package:gnac_caculator/data/colors_app.dart';

class CustomTextFieldNumber extends StatelessWidget {
  const CustomTextFieldNumber(
      {Key? key, required this.text, required this.controller_})
      : super(key: key);
  final String text;
  final TextEditingController controller_;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ePcolor,
      keyboardType: TextInputType.number,
      controller: controller_,
      decoration: InputDecoration(
          fillColor: ePcolor,
          focusColor: ePcolor,
          hoverColor: ePcolor,
          labelText: text,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
