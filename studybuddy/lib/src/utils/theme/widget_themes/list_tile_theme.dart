import 'package:flutter/material.dart';

class SListTileTheme {
  SListTileTheme._();

  static final ListTileThemeData lightListTileTheme = ListTileThemeData(
    tileColor: Colors.black,
    selectedTileColor: Colors.blue,
    iconColor: Colors.black,
    textColor: Colors.white,
    selectedColor: Colors.white,
    contentPadding: EdgeInsets.all(10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      // co
    ),
  );
}
