import 'package:flutter/material.dart';

class SAppTheme {
  static const primary = Colors.blue;
  static final primaryColor = Colors.blue.shade300;

  static ThemeData darkTheme = ThemeData(
    // brightness: Brightness.dark,
    // textTheme: STextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColorDark: primaryColor,
    colorScheme: const ColorScheme.dark(primary: primary),
    dividerColor: Colors.white,
  );
  static ThemeData lightTheme = ThemeData(
    // brightness: Brightness.light,
    // textTheme: STextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(primary: primary),
    dividerColor: Colors.black,
  );
}
