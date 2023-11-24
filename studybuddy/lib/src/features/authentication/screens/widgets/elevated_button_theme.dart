import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';

/* -- Light and Dark Elevated Button Theme -- */

class SElevatedButtonTheme {
  SElevatedButtonTheme._(); // this basically makes it so you can instantiate this class

  /* -- Light Elevated Button Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        side: const BorderSide(color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: sButtonHeight),
      )
  );

  /* -- Dark Elevated Button Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      side: const BorderSide(color: Colors.black),
      padding: const EdgeInsets.symmetric(vertical: sButtonHeight),
    )
  );
}