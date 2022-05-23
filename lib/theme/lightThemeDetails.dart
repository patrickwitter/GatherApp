/*
  All themes relating to to the light theme of the app
*/

// headline5: Used to style text showing information on cards
// headline4: Used to style text shwowing menu headers
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme lightTextTheme = TextTheme(
  headline5: GoogleFonts.lato(
    fontSize: 20,
    color: Colors.black,
  ),
  headline4: GoogleFonts.lato(
    fontSize: 25,
    color: Colors.black,
  ),
  headline6: GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
  caption: TextStyle(
    color: Colors.black,
    fontSize: 18,
  ),
  headline1: TextStyle(
    fontFamily: "WaterBrush",
    fontSize: 80,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  bodyText2: GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
);

ThemeData pickerTheme = ThemeData();

ColorScheme lightColorScheme = ColorScheme.light().copyWith(
  secondary: Colors.grey,
);

IconThemeData lightIcontheme = IconThemeData(color: Colors.blue);
