import 'package:flutter/material.dart';

class PixelsTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF3CCB75),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF3CCB75),
          foregroundColor: Colors.white,
          elevation: 0,
        ));
  }
}
