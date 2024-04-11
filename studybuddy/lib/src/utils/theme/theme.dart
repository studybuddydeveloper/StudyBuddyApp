//For the theme of the app
import 'package:flutter/material.dart';
import 'package:studybuddy/src/utils/theme/widget_themes/list_tile_theme.dart';
import 'package:studybuddy/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:studybuddy/src/utils/theme/widget_themes/text_theme.dart';

import '../../features/authentication/screens/widgets/elevated_button_theme.dart';
import '../../features/authentication/screens/widgets/outlined_button_theme.dart';

class SAppTheme {
  SAppTheme._(); // this basically makes it so you can instantiate this class

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: STextTheme.lightTextTheme,
      hintColor: Colors.black,
      outlinedButtonTheme: SOutlinedButtonTheme.lightOutlinedButtonTheme,
      elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: STextFieldTheme.lightInputDecorationTheme,
      listTileTheme: SListTileTheme.lightListTileTheme,
      // iconTheme: IconThemeData(color: Colors.black),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        iconColor: MaterialStateProperty.all(Colors.black),
        // ))
      )),
      colorScheme: ColorScheme(
          background: Colors.white,
          brightness: Brightness.light,
          error: Colors.red,
          onBackground: Colors.black,
          onError: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          primary: Colors.blue,
          secondary: Colors.blue,
          surface: Colors.white));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: STextTheme.darkTextTheme,
      hintColor: Colors.white,
      outlinedButtonTheme: SOutlinedButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: STextFieldTheme.darkInputDecorationTheme,
      iconTheme: IconThemeData(color: Colors.yellow),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        iconColor: MaterialStateProperty.all(Colors.yellow),
      )));
}
