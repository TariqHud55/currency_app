import 'package:flutter/material.dart';

Widget buildButton(String text, Function() onPress) {
  return TextButton(style: TextButton.styleFrom(
    backgroundColor: Colors.blue,),
    child: Text(text,
        style: const TextStyle(color: Colors.white, fontSize: 18)),
    onPressed: onPress,
  );
}