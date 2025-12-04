



import 'package:flutter/material.dart';

class TheTheme{
 static const primarycolor=Color(0xFF050E3C);
 static const bgcolor=Color(0xFF002455);
 static const forcolor=Color.fromARGB(255, 255, 255, 255);
 static ThemeData get themedata{
   return ThemeData(
    scaffoldBackgroundColor: bgcolor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primarycolor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: forcolor,
        fontSize: 20,
        fontWeight: FontWeight.bold),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: forcolor,
        fontSize: 18,
      ),
    ),
   );

 }
}