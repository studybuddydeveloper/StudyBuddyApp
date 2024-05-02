import 'package:flutter/material.dart';

class SDrawerTheme {
  SDrawerTheme._();

  static DrawerThemeData lightDrawerTheme = DrawerThemeData(
    elevation: 16.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
    ),
    backgroundColor: Colors.black,

  );

  static DrawerThemeData darkDrawerTheme = DrawerThemeData(
    elevation: 16.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
    ),
  );
}