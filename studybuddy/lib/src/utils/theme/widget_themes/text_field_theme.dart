import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class STextFieldTheme {

  static const lightInputDecorationTheme = InputDecorationTheme(
      prefixIconColor: sSecondaryColor,
      border: OutlineInputBorder(),
      //todo will update this later
      iconColor: sSecondaryColor,
      floatingLabelStyle: TextStyle(
          color: sSecondaryColor
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: sSecondaryColor,
        ),
      ),
    );

  static InputDecorationTheme darkInputDecorationTheme = const InputDecorationTheme(
    prefixIconColor: sPrimaryColor,
    border: OutlineInputBorder(),
    //todo will update this later
    iconColor: sPrimaryColor,
    floatingLabelStyle: TextStyle(
        color: sPrimaryColor
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: sPrimaryColor,
      ),
    ),
  );
}