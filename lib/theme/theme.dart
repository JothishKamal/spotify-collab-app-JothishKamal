import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF1ED760),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF1ED760),
    secondary: Color(0xFF1ED760),
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff0F1510),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF2C2C2C),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF1ED760)),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF1ED760),
    textTheme: ButtonTextTheme.primary,
  ),
);
