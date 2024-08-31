// import 'package:flutter/material.dart';
//
// class STextTheme {
//   STextTheme._(); // this basically makes it so you can instantiate this class
//
//   /* -- Light Text Theme -- */
//   static final lightTextTheme = TextTheme(
//     displayLarge: TextStyle(
//       fontSize: 96,
//       fontWeight: FontWeight.w300,
//       color: Colors.black,
//     ),
//     displayMedium: TextStyle(
//       fontSize: 34,
//       fontWeight: FontWeight.w400,
//       color: Colors.black,
//     ),
//     displaySmall: TextStyle(
//       fontSize: 20,
//       fontWeight: FontWeight.w500,
//       color: Colors.black,
//     ),
//     titleLarge: TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w400,
//       color: Colors.black,
//     ),
//     titleMedium: TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w500,
//       color: Colors.black,
//     ),
//     bodyLarge: TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w400,
//       color: Colors.black,
//     ),
//     bodyMedium: TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       color: Colors.black,
//     ),
//     labelLarge: TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w500,
//       color: Colors.black,
//     ),
//     bodySmall: TextStyle(
//       fontSize: 12,
//       fontWeight: FontWeight.w400,
//       color: Colors.black,
//     ),
//   );
//
//   /* -- Dark Text Theme -- */
//   static final darkTextTheme = TextTheme(
//     displayLarge: TextStyle(
//       fontSize: 96,
//       fontWeight: FontWeight.w300,
//       color: Colors.white,
//     ),
//     displayMedium: TextStyle(
//       fontSize: 34,
//       fontWeight: FontWeight.w400,
//       color: Colors.white,
//     ),
//     displaySmall: TextStyle(
//       fontSize: 20,
//       fontWeight: FontWeight.w500,
//       color: Colors.white,
//     ),
//     titleLarge: TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w400,
//       color: Colors.white,
//     ),
//     titleMedium: TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w500,
//       color: Colors.white,
//     ),
//     bodyLarge: TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w400,
//       color: Colors.white,
//     ),
//     bodyMedium: TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       color: Colors.white,
//     ),
//     labelLarge: TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w500,
//       color: Colors.white,
//     ),
//     bodySmall: TextStyle(
//       fontSize: 12,
//       fontWeight: FontWeight.w400,
//       color: Colors.white,
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class STextTheme {
  //making the constructor private
  STextTheme._();

  //creating the text themes
  //light theme
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
        color: ThemeData.dark().colorScheme.primary,
        fontSize: 34,
        fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.montserrat(
        color: ThemeData.dark().colorScheme.onSecondary,
        fontSize: 26,
        fontWeight: FontWeight.bold),
    displaySmall: GoogleFonts.montserrat(
      color: ThemeData.dark().colorScheme.onSecondary,
      fontSize: 23,
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: ThemeData.dark().colorScheme.onSecondary,
      fontSize: 20,
    ),
    bodyMedium: GoogleFonts.montserrat(
      color: ThemeData.dark().colorScheme.onSecondary,
      fontSize: 18,
    ),
    bodySmall: GoogleFonts.montserrat(
      color: ThemeData.dark().colorScheme.onSecondary,
      fontSize: 16,
    ),
  );

  //dark theme
  static TextTheme darkTextTheme = TextTheme(
      displayMedium: GoogleFonts.montserrat(
        color: ThemeData.light().colorScheme.onSecondary,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: GoogleFonts.montserrat(
        color: ThemeData.light().colorScheme.onSecondary,
        fontSize: 24,
      ),
      bodyLarge: GoogleFonts.montserrat(
        color: ThemeData.light().colorScheme.onSecondary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.montserrat(
        color: ThemeData.light().colorScheme.onSecondary,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.montserrat(
        color: ThemeData.light().colorScheme.onSecondary,
        fontSize: 16,
      ));
}
