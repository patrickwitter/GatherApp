/*
  All themes relating to to the light theme of the app
*/

// headline5: Used to style text showing information on cards
// headline4: Used to style text shwowing menu headers
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

/*
  headline3: For large text buttons
  headline1: For large header text
  headline4: For Screen title headers 
  headline5: For displaying information on cards
  caption: For showing additional dates such as dates on cards
  headline6: For displaying information on cards but wuth different font and weight
  bodytext2: This is for showing infected members.
*/
TextTheme lightTextTheme = TextTheme(
  headline5: GoogleFonts.lato(
    fontSize: 16.sp,
    color: Colors.black,
  ),
  headline4: GoogleFonts.lato(
    fontSize: 23.sp,
    color: Colors.black,
  ),
  headline6: GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  ),
  caption: TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
  ),
  headline1: TextStyle(
    fontFamily: "WaterBrush",
    fontSize: 60.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  bodyText2: GoogleFonts.montserrat(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  ),
  headline3: GoogleFonts.raleway(
    color: Colors.black,
    fontSize: 20.sp,
  ),
  subtitle1: GoogleFonts.raleway(
    color: Colors.black,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  ),
);

ThemeData pickerTheme = ThemeData();

/*
outline is for the outlines of textbuttons 
Icon theme is main main action icons such as sending covid alert 
secondary color is overscroll color and splash color of some icons and buttons  when pressed
onsurface is the theme for other icons for example show notifications
onprimary container is the icon color for the tab icon in the bottom tab bar  when selected 
onsecondary container is the color for the tab icon when unselected
*/
ColorScheme lightColorScheme = ColorScheme.light().copyWith(
  secondary: Colors.grey,
  outline: Colors.black,
  onSurface: Colors.black,
  onPrimaryContainer: Colors.blue,
  onSecondaryContainer: Colors.grey,
  tertiary: Colors.blue,
);

IconThemeData lightIcontheme = IconThemeData(color: Colors.blue);

Color scaffoldBackground = Color(0xFFFFFFFF);

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: Color(0xFFf8f8f8),
);

// cardcolor is the color that all card widgets such as member cards have in the background
Color cardColor = Colors.white;
