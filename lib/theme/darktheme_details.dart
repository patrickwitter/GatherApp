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
  headline5: For displaying information on cards and hint text within forms 
  caption: For showing additional dates such as dates on cards and text only icons
  headline6: For displaying information on cards but wuth different font and weight
  bodytext2: This is for showing infected members.
  subtitle2: For showing text within icons
  subititle1: For showing label text on forms
*/
TextTheme darkTextTheme = TextTheme(
  headline5: GoogleFonts.lato(
    fontSize: 16.sp,
    color: Color.fromARGB(255, 242, 238, 238),
  ),
  headline4: GoogleFonts.lato(
    fontSize: 23.sp,
    color: Color.fromARGB(255, 242, 238, 238),
  ),
  headline6: GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 242, 238, 238),
  ),
  caption: TextStyle(
    color: Color.fromARGB(255, 242, 238, 238),
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
    color: Color.fromARGB(255, 242, 238, 238),
  ),
  headline3: GoogleFonts.raleway(
    color: Colors.black,
    fontSize: 20.sp,
  ),
  subtitle1: GoogleFonts.raleway(
    color: Color.fromARGB(255, 242, 238, 238),
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  ),
  subtitle2: GoogleFonts.lato(
    fontSize: 16.sp,
    color: Colors.white,
  ),
);

ThemeData pickerTheme = ThemeData();

/*
outline is for the outlines of textbuttons 
secondary color is overscroll color and splash color of some icons and buttons  when pressed
onsurface is the theme for other icons for example show notifications
onprimary container is the icon color for the tab icon in the bottom tab bar  when selected 
onsecondary container is the color for the tab icon when unselected
*/
ColorScheme darkColorScheme = ColorScheme.light().copyWith(
  secondary: Color.fromARGB(124, 36, 123, 194),
  outline: Colors.black,
  onSurface: Color.fromARGB(255, 242, 238, 238),
  onPrimaryContainer: Colors.blue,
  onSecondaryContainer: Colors.grey,
  tertiary: Colors.blue,
);

//Icon theme is main main action icons such as sending covid alert
IconThemeData darkIcontheme = IconThemeData(color: Colors.blue);

Color scaffoldBackground = Color(0xFF00101F);

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: Color.fromARGB(255, 8, 50, 84),
);

// cardcolor is the color that all card widgets such as member cards have in the background
Color cardColor = Color.fromARGB(124, 36, 123, 194);
