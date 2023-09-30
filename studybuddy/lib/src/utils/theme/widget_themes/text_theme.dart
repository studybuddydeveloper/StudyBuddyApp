import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class STextTheme {

  //making the constructor private
  STextTheme._();

  //creating the text themes
  //light theme
  static TextTheme lightTextTheme = TextTheme(
          displayMedium: GoogleFonts.montserrat(
            color: ThemeData.dark().colorScheme.onPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold
      ),
    displaySmall: GoogleFonts.montserrat(
      color: ThemeData.dark().colorScheme.onPrimary,
      fontSize: 20,
    ),
  );

  //dark theme
  static TextTheme darkTextTheme = TextTheme(
      displayMedium: GoogleFonts.montserrat(
        color: ThemeData.dark().colorScheme.onPrimary,
      )
  );
}