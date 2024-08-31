import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';

/* -- Light and Dark Outlined Button Theme -- */
class SOutlinedButtonTheme {
  SOutlinedButtonTheme._(); // this basically makes it so you can instantiate this class

  /* -- Light Outlined Button Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.black),
        padding: const EdgeInsets.symmetric(vertical: sButtonHeight),
        textStyle: TextStyle(color: Colors.white)),
  );

  /* -- Dark Outlined Button Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      side: const BorderSide(color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: sButtonHeight),
    ),
  );
}
