import 'package:flutter/material.dart';

class PopupWidget extends StatelessWidget {
  const PopupWidget({Key? key, required this.text, required this.widget})
      : super(key: key);
  final String text;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => widget));
    } ,
      title: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
