//For the theme of the app
import 'package:flutter/material.dart';
import 'package:studybuddy/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:studybuddy/src/utils/theme/widget_themes/text_theme.dart';

import '../../features/authentication/screens/widgets/elevated_button_theme.dart';
import '../../features/authentication/screens/widgets/outlined_button_theme.dart';

class SAppTheme {
  SAppTheme._(); // this basically makes it so you can instantiate this class

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: STextTheme.lightTextTheme,
    outlinedButtonTheme: SOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: STextFieldTheme.lightInputDecorationTheme
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: STextTheme.darkTextTheme,
    outlinedButtonTheme: SOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: STextFieldTheme.darkInputDecorationTheme
  );
}