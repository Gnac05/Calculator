import 'package:flutter/material.dart';
class CustomTextFieldNumber extends StatelessWidget {
  const CustomTextFieldNumber({ Key? key,required this.text,required this.controller_ }) : super(key: key);
  final String text;
  final TextEditingController controller_;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller_,
      decoration: InputDecoration(
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
    );
  }
}