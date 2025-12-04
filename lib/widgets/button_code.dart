import 'package:flutter/material.dart';

Widget buildButton(String text, Function() onPress) {
  return TextButton(
    child: Text(text),
    onPressed: onPress,
  );
}