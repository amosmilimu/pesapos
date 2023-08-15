import 'package:flutter/material.dart';


ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.red,
    secondary: Colors.amber,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
);

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.red,
    secondary: Colors.amber,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
);