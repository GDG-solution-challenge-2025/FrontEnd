import 'package:flutter/material.dart';

const Color mainColor = Color(0xFF592401);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: mainColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: mainColor,
    secondary: const Color(0xFF592401),
    surface: Colors.white,
    surfaceContainer: Colors.white,
    secondaryContainer: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
);
