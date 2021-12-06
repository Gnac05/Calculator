import 'package:flutter/material.dart';

class PopupWidget extends StatelessWidget {
  const PopupWidget({ Key? key, required this.text, required this.widget }) : super(key: key);
  final String text;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        // ignore: sized_box_for_whitespace
        child:Container(width:150,child: Text(text)),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> widget));
        },
      ),
    );
  }
}