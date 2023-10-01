import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
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
      side: BorderSide(color: Colors.black),
      padding: EdgeInsets.symmetric(vertical: sButtonHeight),
    ),
  );

  /* -- Dark Outlined Button Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      side: BorderSide(color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: sButtonHeight),
    ),
  );

}