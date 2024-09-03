
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF39A552);
  static const Color navy = Color(0xFF4F5A69);
  static const Color black = Color(0xFF303030);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFF79828B);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        foregroundColor: white,
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: white,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(35),
                bottomLeft: Radius.circular(35))),
        centerTitle: true,
      ),
      textTheme: const TextTheme(
        titleLarge:
            TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: white),
        titleSmall:   TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: black),
      ),

  );
}
