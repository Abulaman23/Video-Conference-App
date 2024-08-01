import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(
      color: Colors.black87,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: GoogleFonts.poppins(
      color: Colors.black54,
      fontSize: 16,
    ),
    displayLarge: GoogleFonts.josefinSans(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
    displaySmall: GoogleFonts.aBeeZee(
      color: Colors.black,
      fontSize: 19,
      fontWeight: FontWeight.w400,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 28,
    ),
    titleSmall: GoogleFonts.poppins(
      color: Colors.white70,
      fontSize: 16,
    ),
    displayLarge: GoogleFonts.josefinSans(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  );
}
