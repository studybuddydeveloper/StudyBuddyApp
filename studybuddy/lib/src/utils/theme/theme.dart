import 'package:flutter/material.dart';
import 'package:studybuddy/src/utils/theme/widget_themes/text_theme.dart';

class SAppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: STextTheme.darkTextTheme,
  );
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: STextTheme.lightTextTheme,
  );
}